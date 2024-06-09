const mongoose = require("mongoose");

const addressSchema = mongoose.Schema(
  {
    user: {
      type: mongoose.Schema.Types.ObjectId,
      ref: "User",
      required: [true, "Address must belong to a user!"],
    },
    customer: {
      type: String,
      required: [true, "Address must have a customer name!"],
    },
    phoneNumber: {
      type: String,
      required: [true, "Address must have a phone number!"],
    },
    detailedAddress: {
      type: String,
      required: [true, "Address must have a detailed address!"],
    },
    district: {
      type: String,
      required: [true, "Address must have district!"],
    },
    city: {
      type: String,
      required: [true, "Address must have city!"],
    },
    country: {
      type: String,
      required: [true, "Address must have country!"],
    },
    isDefault: {
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

const Address = mongoose.model("Address", addressSchema);
module.exports = Address;
