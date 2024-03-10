const mongoose = require("mongoose");
const crypto = require("crypto");
const validator = require("validator");
const bcrypt = require("bcryptjs");

const userSchema = mongoose.Schema(
  {
    username: {
      type: String,
      trim: true,
      unique: [true, "Username already exists!"],
    },
    phoneNumber: {
      type: String,
    },
    email: {
      type: String,
      required: [true, "Please provide an email!"],
      trim: true,
      unique: true,
      lowercase: true,
      validate: [validator.isEmail, "Please provide a valid email!"],
    },
    emailVerifiedAt: {
      type: Date,
      default: Date.now(),
    },
    password: {
      type: String,
      required: [true, "Please provide a password!"],
      minLength: [8, "Password must be at least 8 characters!"],
      trim: true,
      select: false,
    },
    passwordChangedAt: {
      type: Date,
      default: Date.now(),
    },
    passwordResetToken: String,
    passwordResetExpires: Date,
    birthday: String,
    wishlist: [
      {
        type: mongoose.Schema.ObjectId,
        ref: "Product",
      },
    ],
    avatar: {
      type: String,
      default:
        "https://www.testhouse.net/wp-content/uploads/2021/11/default-avatar.jpg",
    },
    gender: {
      type: String,
      enum: ["MALE", "FEMALE"],
    },
    activationOTP: {
      type: Number,
    },
    isActive: {
      type: Boolean,
      default: false,
      select: false,
    },
    role: {
      type: String,
      enum: ["customer", "admin"],
      default: "customer",
    },
  },
  { timestamps: true }
);

userSchema.pre("save", async function (next) {
  if (!this.isModified("password")) return next();

  this.password = await bcrypt.hash(this.password, 12);
  next();
});

userSchema.pre("save", async function (next) {
  if (!this.isModified("password") || this.isNew) return next();

  this.passwordChangedAt = Date.now() - 1000;
  next();
});

userSchema.pre(/^find/, function (next) {
  // this points to the current query
  this.find({ isActive: { $ne: false } });
  next();
});

userSchema.pre(/^find/, function (next) {
  // this points to the current query
  this.populate({ path: "wishlist" });
  next();
});

userSchema.methods.correctPassword = async function (
  candidatePassword,
  userPassword
) {
  return await bcrypt.compare(candidatePassword, userPassword);
};

userSchema.methods.isPasswordChanged = function (JWTTimestamp) {
  if (this.passwordChangedAt) {
    const changedTimestamp = parseInt(
      this.passwordChangedAt.getTime() / 1000,
      10
    );
    return JWTTimestamp < changedTimestamp;
  }
  return false;
};

userSchema.methods.createPasswordResetToken = function () {
  const resetToken = crypto.randomBytes(32).toString("hex");

  this.passwordResetToken = crypto
    .createHash("sha256")
    .update(resetToken)
    .digest("hex");

  this.passwordResetExpires = Date.now() + 10 * 60 * 1000;

  return resetToken;
};

const User = mongoose.model("User", userSchema);
module.exports = User;
