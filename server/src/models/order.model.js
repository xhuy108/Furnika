const mongoose = require("mongoose");

const orderSchema = new mongoose.Schema(
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
    totalQuantity: {
      type: Number,
      required: true,
    },
    totalPrice: {
      type: Number,
      required: true,
    },
    shippingAddress: {
      customer: {
        type: String,
        required: true,
      },
      phoneNumber: {
        type: String,
        required: true,
      },
      detailedAddress: {
        type: String,
        required: true,
      },
      district: {
        type: String,
        required: true,
      },
      city: {
        type: String,
        required: true,
      },
      country: {
        type: String,
        required: true,
      },
    },
    paymentMethod: {
      type: String,
      default: "Cash On Delivery",
    },
    shippingPrice: {
      type: Number,
      default: 0,
    },
    orderStatus: {
      type: String,
      default: "To Pay",
      enum: ["To Pay", "To Ship", "To Receive", "To Rate", "Completed"],
    },
    isPaid: {
      type: Boolean,
      default: false,
    },
    paidAt: Date,
  },
  {
    toJSON: { virtuals: true },
    toObject: { virtuals: true },
    timestamps: true,
  }
);

orderSchema.pre(/^find/, function (next) {
  this.populate({ path: "items.product" });
  next();
});

const Order = mongoose.model("Order", orderSchema);

module.exports = Order;
