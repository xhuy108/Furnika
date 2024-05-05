const mongoose = require("mongoose");

const categorySchema = new mongoose.Schema(
  {
    name: {
      type: String,
      required: [true, "A category must have a name!"],
      unique: true,
    },
    productCount: {
      type: Number,
      default: 0,
    },
    image: {
      type: String,
      required: [true, "A category must have an image!"],
    },
    type: {
      type: String,
      required: [true, "A category must have a type!"],
      enum: ["location", "function", "other"],
    },
    markedForDeletion: {
      type: Boolean,
      default: false,
    },
  },
  {
    toJSON: { virtuals: true },
    toObject: { virtuals: true },
    timestamps: true,
  }
);

categorySchema.virtual("products", {
  ref: "Product",
  foreignField: "category",
  localField: "_id",
});

const Category = mongoose.model("Category", categorySchema);

module.exports = Category;
