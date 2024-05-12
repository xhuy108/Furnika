const express = require("express");
const cartController = require("./../controllers/cart.controller");
const authController = require("./../controllers/auth.controller");
const productRouter = require("./../routes/product.route");

const router = express.Router();

router.use(authController.protect);

router
  .route("/")
  .get(cartController.getAllCartItems)
  .post(authController.restrictTo("customer"), cartController.addToCart)
  .patch(authController.restrictTo("customer"), cartController.updateCart);

router
  .route("/:id")
  .get(cartController.getCart)
  .delete(
    authController.protect,
    authController.restrictTo("admin"),
    cartController.deleteCart
  );

router
  .route("/increase")
  .patch(
    authController.restrictTo("customer"),
    cartController.increaseCartQuantity
  );

router
  .route("/decrease")
  .patch(
    authController.restrictTo("customer"),
    cartController.decreaseCartQuantity
  );

router
  .route("/delete")
  .patch(authController.restrictTo("customer"), cartController.deleteCartItem);

router
  .route("/empty")
  .patch(authController.restrictTo("customer"), cartController.emptyCart);

module.exports = router;
