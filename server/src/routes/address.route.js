const express = require("express");
const addressController = require("./../controllers/address.controller");
const authController = require("./../controllers/auth.controller");

const router = express.Router();

router.use(authController.protect);
router.use(authController.restrictTo("customer", "admin"));

router
  .route("/")
  .get(addressController.getAllAddresses)
  .post(addressController.setAddressUserIds, addressController.createAddress);

router
  .route("/:id")
  .get(addressController.getAddress)
  .patch(addressController.updateAddress)
  .delete(addressController.deleteAddress);

module.exports = router;
