const mongoose = require("mongoose");

const tokenSchema = new mongoose.Schema({
  userId: {
    type: mongoose.Schema.Types.ObjectId,
    required: true,
    ref: "User",
  },
  refreshToken: {
    type: String,
    required: true,
  },
  accessToken: String,
  createdAt: {
    type: Date,
    default: Date.now,
    expires: 60 * 86400, // Token expires after 1 hour
  },
});

const Token = mongoose.model("Token", tokenSchema);

module.exports = Token;
