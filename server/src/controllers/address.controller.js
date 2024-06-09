const Address = require("./../models/address.model");
const factory = require("../utils/handlerFactory");
const APIFeatures = require("../utils/apiFeatures");
const catchAsync = require("../utils/catchAsync");

exports.setAddressUserIds = (req, res, next) => {
  // Allow nested routes
  if (!req.body.user) req.body.user = req.user.id;
  next();
};

exports.getAllAddresses = factory.getAll(Address);
exports.createAddress = factory.createOne(Address);
exports.getAddress = factory.getOne(Address);
exports.updateAddress = factory.updateOne(Address);
exports.deleteAddress = factory.deleteOne(Address);

exports.getAllAddresses = catchAsync(async (req, res, next) => {
  //To allow for nested route (hack)
  let filter = {};
  if (req.user.role === "user") filter = { user: req.user.id };

  //Execute query
  const features = new APIFeatures(Address.find(filter), req.query)
    .filter()
    .sort()
    .limitFields()
    .search()
    .paginate();
  const doc = await features.query;

  //Send response
  res.status(200).json({
    status: "success",
    results: doc.length,
    data: {
      data: doc,
    },
  });
});

exports.createAddress = catchAsync(async (req, res, next) => {
  //Address created first time
  const address = await Address.findOne({ user: req.user.id });
  if (!address) {
    req.body.isDefault = true;
  }

  const newDoc = await Address.create(req.body);

  res.status(201).json({
    status: "success",
    data: {
      data: newDoc,
    },
  });
});
