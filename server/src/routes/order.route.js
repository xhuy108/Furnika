const express = require("express");
const orderController = require("./../controllers/order.controller");
const authController = require("./../controllers/auth.controller");

const router = express.Router();

router
  .route("/")
  .get(authController.protect, orderController.getAllOrders)
  .post(
    authController.protect,
    authController.restrictTo("customer"),
    orderController.setOrderUserIds,
    orderController.createOrder
  );

router.route("/payment").post(orderController.payment);

router
  .route("/:id")
  .get(orderController.getOrder)
  .patch(
    authController.protect,
    authController.restrictTo("admin", "customer"),
    orderController.updateOrder
  )
  .delete(
    authController.protect,
    authController.restrictTo("admin"),
    orderController.deleteOrder
  );

module.exports = router;
