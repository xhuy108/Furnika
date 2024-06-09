const mongoose = require("mongoose");

const orderSchema = new mongoose.Schema(
  {
    user: {
      type: mongoose.Schema.Types.ObjectId,
      ref: "User",
      required: true,
    },
    orderItems: [
      {
        type: mongoose.Schema.Types.ObjectId,
        ref: "OrderItem",
        required: true,
      },
    ],
    totalQuantity: {
      type: Number,
      required: true,
    },
    shippingAddress: {
      type: String,
      required: true,
    },
    phoneNumber: {
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
    paymentId: String,
    paymentMethod: {
      type: String,
      default: "Cash On Delivery",
    },
    shippingPrice: {
      type: Number,
      default: 0,
    },
    status: {
      type: String,
      default: "active",
      enum: [
        "active",
        "pending",
        "processed",
        "shipped",
        "out-for-delivery",
        "delivered",
        "cancelled",
        "on-hold",
        "expired",
      ],
    },
    statusHistory: {
      type: [
        {
          status: {
            type: String,
            enum: [
              "active",
              "pending",
              "processed",
              "shipped",
              "out-for-delivery",
              "delivered",
              "cancelled",
              "on-hold",
              "expired",
            ],
          },
          createdAt: {
            type: Date,
            default: Date.now,
          },
        },
      ],
      default: [
        {
          status: "pending",
          createdAt: Date.now(),
        },
      ],
      required: true,
    },
    totalPrice: Number,
    dateOrdered: {
      type: Date,
      default: Date.now,
    },
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
