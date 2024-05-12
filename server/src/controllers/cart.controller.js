const Cart = require("./../models/cart.model");
const Product = require("./../models/product.model");
const factory = require("./../utils/handlerFactory");
const catchAsync = require("./../utils/catchAsync");
const APIFeatures = require("./../utils/apiFeatures");
const AppError = require("./../utils/appError");

// exports.getAllCartItems = factory.getAll(Cart);
// exports.addToCart = factory.createOne(Cart);
exports.getCart = factory.getOne(Cart);
// exports.updateCart = factory.updateOne(Cart);
exports.deleteCart = factory.deleteOne(Cart);

exports.getAllCartItems = catchAsync(async (req, res, next) => {
  try {
    let filter = { user: req.user.id };

    //Execute query
    const features = new APIFeatures(Cart.find(filter), req.query)
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
  } catch (e) {
    res.status(400).json({
      status: "fail",
      message: e.message,
    });
  }
});

exports.addToCart = catchAsync(async (req, res, next) => {
  try {
    const productPrice = await Product.findById(req.body.product)
      .select("price")
      .exec();

    req.body.price = productPrice.price;

    const cart = await Cart.findOne({ user: req.user.id });
    if (!cart) {
      req.body.user = req.user.id;
      const newCart = await new Cart({
        items: [req.body],
        cartTotalPrice: req.body.price * req.body.quantity,
        cartTotalQuantity: req.body.quantity,
        totalPriceAfterDiscount: req.body.price,
        user: req.user.id,
      }).save();
      res.status(201).json({
        status: "success",
        data: {
          data: newCart,
        },
      });
    } else {
      const cartItem = cart.items.find(
        (item) =>
          item.product.id.toString() === req.body.product &&
          item.color === req.body.color
      );

      if (cartItem) {
        cartItem.quantity += req.body.quantity;
      } else {
        cart.items.unshift(req.body);
      }

      cart.cartTotalQuantity += req.body.quantity;
      cart.cartTotalPrice += req.body.price * req.body.quantity;
      cart.totalPriceAfterDiscount = cart.cartTotalPrice;

      await cart.save();

      res.status(201).json({
        status: "success",
        data: {
          data: cart,
        },
      });
    }
  } catch (e) {
    res.status(400).json({
      status: "fail",
      message: e.message,
    });
  }
});

exports.updateCart = catchAsync(async (req, res, next) => {
  try {
    const productPrice = await Product.findById(req.body.product)
      .select("price")
      .exec();

    req.body.price = productPrice.price;

    const cart = await Cart.findOne({ user: req.user.id });
    if (!cart) {
      return next(new AppError("No cart found with that ID", 404));
    }

    const cartItem = cart.items.find(
      (item) =>
        item.product.toString() === req.body.product &&
        item.color === req.body.color
    );

    if (!cartItem) {
      return next(new AppError("No cart item found with that ID", 404));
    }

    cartItem.quantity = req.body.quantity;
    cartItem.price = req.body.price;

    cart.cartTotalQuantity = 0;
    cart.cartTotalPrice = 0;
    cart.totalPriceAfterDiscount = 0;

    cart.items.forEach((item) => {
      cart.cartTotalQuantity += item.quantity;
      cart.cartTotalPrice += item.price;
    });

    cart.totalPriceAfterDiscount = cart.cartTotalPrice;

    await cart.save();

    res.status(200).json({
      status: "success",
      data: {
        data: cart,
      },
    });
  } catch (e) {
    res.status(400).json({
      status: "fail",
      message: e.message,
    });
  }
});

exports.increaseCartQuantity = catchAsync(async (req, res, next) => {
  try {
    const cart = await Cart.findOne({ user: req.user.id });
    if (!cart) {
      return next(new AppError("No cart found with that ID", 404));
    }

    const cartItem = cart.items.find(
      (item) => item.product.id.toString() === req.body.product
    );

    if (!cartItem) {
      return next(new AppError("No cart item found with that ID", 404));
    }

    cartItem.quantity += 1;

    cart.cartTotalQuantity += 1;
    cart.cartTotalPrice += cartItem.price;
    cart.totalPriceAfterDiscount = cart.cartTotalPrice;

    await cart.save();

    res.status(200).json({
      status: "success",
      data: {
        data: cart,
      },
    });
  } catch (e) {
    res.status(400).json({
      status: "fail",
      message: e.message,
    });
  }
});

exports.decreaseCartQuantity = catchAsync(async (req, res, next) => {
  try {
    const cart = await Cart.findOne({ user: req.user.id });
    if (!cart) {
      return next(new AppError("No cart found with that ID", 404));
    }

    const cartItem = cart.items.find(
      (item) => item.product.id.toString() === req.body.product
    );

    if (!cartItem) {
      return next(new AppError("No cart item found with that ID", 404));
    }

    cartItem.quantity -= 1;

    cart.cartTotalQuantity -= 1;
    cart.cartTotalPrice -= cartItem.price;
    cart.totalPriceAfterDiscount = cart.cartTotalPrice;

    await cart.save();

    res.status(200).json({
      status: "success",
      data: {
        data: cart,
      },
    });
  } catch (e) {
    res.status(400).json({
      status: "fail",
      message: e.message,
    });
  }
});

exports.deleteCartItem = catchAsync(async (req, res, next) => {
  try {
    const cart = await Cart.findOne({ user: req.user.id });
    if (!cart) {
      return next(new AppError("No cart found with that ID", 404));
    }

    const cartItem = cart.items.find(
      (item) => item.product.id.toString() === req.body.product
    );

    if (!cartItem) {
      return next(new AppError("No cart item found with that ID", 404));
    }

    cart.items = cart.items.filter(
      (item) => item.product.id.toString() !== req.body.product
    );

    cart.cartTotalQuantity -= cartItem.quantity;
    cart.cartTotalPrice -= cartItem.price * cartItem.quantity;
    cart.totalPriceAfterDiscount = cart.cartTotalPrice;

    await cart.save();

    res.status(204).json({
      status: "success",
      data: null,
    });
  } catch (e) {
    res.status(400).json({
      status: "fail",
      message: e.message,
    });
  }
});

exports.emptyCart = catchAsync(async (req, res, next) => {
  try {
    const cart = await Cart.findOne({ user: req.user.id });
    if (!cart) {
      return next(new AppError("No cart found with that ID", 404));
    }

    cart.items = [];
    cart.cartTotalQuantity = 0;
    cart.cartTotalPrice = 0;
    cart.totalPriceAfterDiscount = 0;

    await cart.save();

    res.status(204).json({
      status: "success",
      data: null,
    });
  } catch (e) {
    res.status(400).json({
      status: "fail",
      message: e.message,
    });
  }
});
