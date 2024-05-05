const mongoose = require("mongoose");
const crypto = require("crypto");
const validator = require("validator");
const bcrypt = require("bcryptjs");

const userSchema = mongoose.Schema(
  {
    username: {
      type: String,
      required: [true, "Please provide a username!"],
      trim: true,
      unique: true,
      minLength: [3, "Username must be at least 3 characters!"],
      maxLength: [100, "Username must be at most 100 characters!"],
    },
    phone_number: {
      type: String,
      trim: true,
      unique: false,
    },
    email: {
      type: String,
      required: [true, "Please provide an email!"],
      trim: true,
      unique: true,
      lowercase: true,
      validate: [validator.isEmail, "Please provide a valid email!"],
    },
    password: {
      type: String,
      required: [true, "Please provide a password!"],
      minLength: [8, "Password must be at least 8 characters!"],
      trim: true,
      select: false,
    },
    email_verified_token: String,
    password_reset_token: String,
    password_reset_expires: Date,
    password_changed_at: {
      type: Date,
      default: Date.now(),
    },
    day_of_birth: String,
    wishlist: [
      {
        productId: {
          type: mongoose.Schema.ObjectId,
          ref: "Product",
        },
        productName: {
          type: String,
          required: true,
        },
        productImage: {
          type: String,
          required: true,
        },
        productPrice: {
          type: Number,
          required: true,
        },
      },
    ],
    avatar: {
      type: String,
      default:
        "https://www.testhouse.net/wp-content/uploads/2021/11/default-avatar.jpg",
    },
    gender: {
      type: String,
      enum: ["male", "female"],
    },
    addresses: [
      {
        street: String,
        district: String,
        city: String,
        country: String,
      },
    ],
    activation_otp: {
      type: Number,
    },
    verify: {
      type: String,
      enum: ["unverified", "verified", "banned"],
      default: "unverified",
    },
    is_active: {
      type: Boolean,
      default: true,
      select: false,
    },
    role: {
      type: String,
      enum: ["customer", "admin"],
      default: "customer",
    },
  },
  { toJSON: { virtuals: true }, toObject: { virtuals: true }, timestamps: true }
);

userSchema.index({ email: 1 });

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
