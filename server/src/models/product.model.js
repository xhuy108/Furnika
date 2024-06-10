const mongoose = require("mongoose");
const validator = require("validator");
const Category = require("./category.model");

const productSchema = mongoose.Schema(
  {
    name: {
      type: String,
      required: [true, "Product must have a name"],
      trim: true,
    },
    description: {
      type: String,
      required: [true, "Product must have a description"],
    },
    price: {
      type: Number,
      required: [true, "Product must have a price"],
    },
    discountPrice: {
      type: Number,
      default: this.regular_price,
    },
    imageCover: {
      type: String,
      required: [true, "Product must have a cover image"],
    },
    images: [String],
    colors: [String],
    materials: [String],
    dimensions: {
      height: {
        type: Number,
      },
      width: {
        type: Number,
      },
      depth: {
        type: Number,
      },
    },
    weight: {
      type: Number,
    },
    quantity: {
      type: Number,
      required: true,
    },
    additionalProperties: [
      {
        key: String,
        value: String,
      },
    ],
    ratingsAverage: {
      type: Number,
      default: 0,
      min: [0, "Rating must be above 0"],
      max: [5, "Rating must be below 5.0"],
      set: (val) => Math.round(val * 10) / 10,
    },
    ratingsQuantity: {
      type: Number,
      default: 0,
    },
    category: [
      {
        type: mongoose.Schema.Types.ObjectId,
        ref: "Category",
        required: [true, "Product must belong to at least one category"],
      },
    ],
    countInStock: {
      type: Number,
      default: 0,
      min: 0,
    },
  },
  {
    toJSON: { virtuals: true },
    toObject: { virtuals: true },
    timestamps: true,
  }
);

productSchema.index({ name: 1, price: 1 });

productSchema.pre(/^find/, function (next) {
  this.populate({ path: "category" });
  next();
});

productSchema.virtual("reviews", {
  ref: "Review",
  foreignField: "product",
  localField: "_id",
});

productSchema.statics.calcTotalCategories = async function (categoryId) {
  const stats = await this.aggregate([
    {
      $match: { category: categoryId },
    },
    {
      $group: {
        _id: "$category",
        nCount: { $sum: 1 },
      },
    },
  ]);

  if (stats.length > 0) {
    await Category.findByIdAndUpdate(categoryId, {
      productCount: stats[0].nCount,
    });
  } else {
    await Category.findByIdAndUpdate(productId, {
      productCount: 0,
    });
  }
};

productSchema.post("save", function () {
  this.constructor.calcTotalCategories(this.category);
});

const Product = mongoose.model("Product", productSchema);
module.exports = Product;
