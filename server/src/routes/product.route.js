const express = require("express");
const productController = require("./../controllers/product.controller");
const authController = require("./../controllers/auth.controller");
// const reviewRouter = require("./../routes/reviewRoute");

const router = express.Router({ mergeParams: true });

router
  .route("/")
  .get(productController.getAllProducts)
  .post(
    authController.protect,
    authController.restrictTo("admin"),
    productController.uploadProductImages,
    productController.resizeProductImages,
    productController.uploadCloudinary,
    productController.createProduct
  );

router
  .route("/:id")
  .get(productController.getProduct)
  .patch(
    authController.protect,
    authController.restrictTo("admin"),
    productController.updateProduct
  )
  .delete(
    authController.protect,
    authController.restrictTo("admin"),
    productController.deleteProduct
  );

router
  .route("/:id/wishlist")
  .patch(
    authController.protect,
    authController.restrictTo("user"),
    productController.addToWishlist
  );

router
  .route("/:id/deleteFromWishlist")
  .patch(
    authController.protect,
    authController.restrictTo("user"),
    productController.removeFromWishlist
  );

// router.use("/:productId/reviews", reviewRouter);

module.exports = router;
