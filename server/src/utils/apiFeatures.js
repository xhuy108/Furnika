class APIFeatures {
  constructor(query, queryString) {
    this.query = query;
    this.queryString = queryString;
  }

  filter() {
    const queryObject = { ...this.queryString };
    const excludedFields = ["page", "sort", "limit", "fields", "search", "ne"];
    excludedFields.forEach((element) => delete queryObject[element]);

    let queryStr = JSON.stringify(queryObject);
    queryStr = queryStr.replace(/\b(gte|gt|lte|lt)\b/g, (match) => `$${match}`);

    this.query = this.query.find(JSON.parse(queryStr));

    return this;
  }

  sort() {
    if (this.queryString.sort) {
      const sortBy = this.queryString.sort.split(",").join(" ");
      this.query = this.query.sort(sortBy);
    } else {
      this.query = this.query.sort("-createdAt");
    }

    return this;
  }

  limitFields() {
    if (this.queryString.fields) {
      const fields = this.queryString.fields.split(",").join(" ");
      this.query = this.query.select(fields);
    } else {
      this.query = this.query.select("-__v");
    }

    return this;
  }

  paginate() {
    const page = this.queryString.page * 1 || 1;
    const limit = this.queryString.limit * 1 || 100;
    const skip = (page - 1) * limit;

    this.query = this.query.skip(skip).limit(limit);

    return this;
  }

  search() {
    if (this.queryString.search) {
      const searchValue = this.queryString.search;

      this.query = this.query.find({
        name: {
          $regex: new RegExp(searchValue, "i"),
        },
      });
    }

    return this;
  }

  ne() {
    if (this.queryString.ne) {
      const searchValue = this.queryString.ne;

      this.query = this.query.find({
        _id: {
          $ne: searchValue,
        },
      });
    }

    return this;
  }
}

module.exports = APIFeatures;
