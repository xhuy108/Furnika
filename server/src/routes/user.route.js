const express = require("express");

const authController = require("../controllers/auth.controller");
const userController = require("../controllers/user.controller");

const router = express.Router();

router.post("/signup", authController.signup);
router.post("/login", authController.login);
router.post("/forgotPassword", authController.forgotPassword);
router.patch("/resetPassword/:token", authController.resetPassword);

router.use(authController.protect);

router.patch("/updateMyPassword", authController.updatePassword);
router.get("/me", userController.getMe, userController.getUser);
router.patch(
  "/updateMe",
  userController.uploadUserPhoto,
  userController.resizeUserPhoto,
  // userController.uploadCloudinary,
  userController.updateMe
);
router.delete("/deleteMe", userController.deleteMe);
router.get("/wishlist", userController.getWishlist);

router.use(authController.restrictTo("admin"));

router.route("/").get(userController.getAllUsers);
router
  .route("/:id")
  .delete(userController.deleteUser)
  .patch(userController.updatedUser);

module.exports = router;
