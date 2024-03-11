const mongoose = require("mongoose");

const cartSchema = new mongoose.Schema(
  {
    user: {
      type: mongoose.Schema.Types.ObjectId,
      ref: "User",
      required: true,
    },
    items: [
      {
        product: {
          type: mongoose.Schema.Types.ObjectId,
          ref: "Product",
          required: true,
        },
        quantity: {
          type: Number,
          required: true,
          default: 1,
        },
        color: String,
        price: Number,
      },
    ],
    cartTotalQuantity: Number,
    cartTotalPrice: Number,
    totalPriceAfterDiscount: Number,
  },
  {
    toJSON: { virtuals: true },
    toObject: { virtuals: true },
    timestamps: true,
  }
);

cartSchema.pre(/^find/, function (next) {
  this.populate({
    path: "items.product",
  });
  next();
});

const Cart = mongoose.model("Cart", cartSchema);

module.exports = Cart;
