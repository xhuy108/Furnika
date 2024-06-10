const Order = require("./../models/order.model");
const factory = require("../utils/handlerFactory");
const APIFeatures = require("../utils/apiFeatures");
const catchAsync = require("../utils/catchAsync");
const Stripe = require("stripe");
const key =
  "sk_test_51OIwCIGJQyVtA8BL2TjbFA1j1xJFEJsi3KIEbArRbgsOtMsZV26HYXCrHBnExg5qPxgc6YEVzNHplL7fzdiEsg3m0035DCltQt";

const stripe = new Stripe(key);

exports.setOrderUserIds = (req, res, next) => {
  // Allow nested routes
  if (!req.body.user) req.body.user = req.user.id;
  next();
};

// exports.getAllOrders = factory.getAll(Order);
// exports.createOrder = factory.createOne(Order);
exports.getOrder = factory.getOne(Order);
exports.updateOrder = factory.updateOne(Order);
exports.deleteOrder = factory.deleteOne(Order);

exports.getAllOrders = catchAsync(async (req, res, next) => {
  let filter = { user: req.user.id };

  //Execute query
  const features = new APIFeatures(Order.find(filter), req.query)
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

exports.createOrder = catchAsync(async (req, res, next) => {
  const { items } = req.body;

  req.body.totalQuantity = items.reduce((a, b) => a + b.quantity, 0);
  if (!req.body.totalPrice) {
    req.body.totalPrice = items.reduce((a, b) => a + b.price * b.quantity, 0);
  }
  req.body.totalPrice += req.body.shippingPrice;

  if (req.body.paymentMethod !== "Cash On Delivery") {
    req.body.isPaid = true;
    req.body.paidAt = Date.now();
    req.body.orderStatus = "To Ship";
  }

  const newDoc = await Order.create(req.body);

  res.status(201).json({
    status: "success",
    data: {
      data: newDoc,
    },
  });
});

exports.payment = catchAsync(async (req, res, next) => {
  const { body } = req;

  try {
    const paymentIntent = await stripe.paymentIntents.create({
      amount: body?.amount,
      currency: body?.currency,
    });

    if (paymentIntent?.status !== "completed") {
      console.log("Payment failed");
      return res.status(400).json({
        message: "Payment failed",
        client_secret: paymentIntent.client_secret,
      });
    }
    return res.status(200).json({
      message: "Payment successful",
      client_secret: paymentIntent?.client_secret,
    });
  } catch (error) {
    console.log(error);
  }
});
