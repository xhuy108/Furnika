const express = require("express");
const categoryController = require("./../controllers/category.controller");
const authController = require("./../controllers/auth.controller");
const productRouter = require("./../routes/product.route");

const router = express.Router();

router
  .route("/")
  .get(categoryController.getAllCategories)
  .post(
    authController.protect,
    authController.restrictTo("admin"),
    categoryController.createCategory
  );

router
  .route("/:id")
  .get(categoryController.getCategory)
  .patch(
    authController.protect,
    authController.restrictTo("admin"),
    categoryController.updateCategory
  )
  .delete(
    authController.protect,
    authController.restrictTo("admin"),
    categoryController.deleteCategory
  );

router.use("/:categoryId/products", productRouter);

module.exports = router;
