const mongoose = require("mongoose");
const Product = require("./product.model");

const reviewSchema = new mongoose.Schema(
  {
    comment: {
      type: String,
      required: true,
    },
    images: [String],
    rating: {
      type: Number,
      required: true,
      min: 1,
      max: 5,
    },
    author: {
      type: mongoose.Schema.Types.ObjectId,
      ref: "User",
      required: [true, "Review must belong to a user."],
    },
    product: {
      type: mongoose.Schema.Types.ObjectId,
      ref: "Product",
      required: [true, "Review must belong to a product."],
    },
  },
  {
    toJSON: { virtuals: true },
    toObject: { virtuals: true },
    timestamps: true,
  }
);

reviewSchema.index({ product: 1, author: 1 }, { unique: true });

reviewSchema.pre(/^find/, function (next) {
  this.populate({ path: "author", select: "username avatarImgUrl" });
  next();
});

reviewSchema.statics.calcAverageRatings = async function (productId) {
  const stats = await this.aggregate([
    {
      $match: { product: productId },
    },
    {
      $group: {
        _id: "$product",
        nRating: { $sum: 1 },
        avgRating: { $avg: "$rating" },
      },
    },
  ]);

  if (stats.length > 0) {
    await Product.findByIdAndUpdate(productId, {
      ratingsQuantity: stats[0].nRating,
      ratingsAverage: stats[0].avgRating,
    });
  } else {
    await Product.findByIdAndUpdate(productId, {
      ratingsQuantity: 0,
      ratingsAverage: 0,
    });
  }
};

reviewSchema.post("save", function () {
  this.constructor.calcAverageRatings(this.product);
});

reviewSchema.pre(/^findOneAnd/, async function (next) {
  this.r = await this.clone().findOne();
  next();
});

reviewSchema.post(/^findOneAnd/, async function () {
  await this.r.constructor.calcAverageRatings(this.r.product);
});

const Review = mongoose.model("Review", reviewSchema);

module.exports = Review;
