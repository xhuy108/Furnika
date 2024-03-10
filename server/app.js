const express = require("express");
const rateLimit = require("express-rate-limit");
const helmet = require("helmet");
const mongoSanitize = require("express-mongo-sanitize");
const xss = require("xss-clean");
const hpp = require("hpp");

const AppError = require("./utils/appError");
// const globalErrorHandler = require("./controllers/errorController");

// const userRouter = require("./routes/userRoute");
// const addressRouter = require("./routes/addressRoute");
// const productRouter = require("./routes/productRoute");
// const reviewRouter = require("./routes/reviewRoute");
// const brandRouter = require("./routes/brandRoute");
// const categoryRouter = require("./routes/categoryRoute");
// const couponRouter = require("./routes/couponRoute");
// const cartRouter = require("./routes/cartRoute");
// const orderRouter = require("./routes/orderRoute");

const app = express();

app.use(helmet());

const limiter = rateLimit({
  max: 1000,
  windowMs: 60 * 60 * 1000,
  message: "Too many requests from this IP, please try again in an hour!",
});

app.use("/api", limiter);

app.use(express.json());

app.use(mongoSanitize());

app.use(xss());

app.use(
  hpp({
    whitelist: [
      "name",
      "regularPrice",
      "description",
      "summary",
      "ratingsAverage",
      "ratingsQuantity",
      "images",
      "createdAt",
      "updatedAt",
    ],
  })
);

// app.use("/api/v1/users", userRouter);
// app.use("/api/v1/addresses", addressRouter);
// app.use("/api/v1/products", productRouter);
// app.use("/api/v1/reviews", reviewRouter);
// app.use("/api/v1/brands", brandRouter);
// app.use("/api/v1/categories", categoryRouter);
// app.use("/api/v1/coupons", couponRouter);
// app.use("/api/v1/carts", cartRouter);
// app.use("/api/v1/orders", orderRouter);

app.all("*", (req, res, next) => {
  next(new AppError(`Can't find ${req.originalUrl} on this server!`, 404));
});

// app.use(globalErrorHandler);

module.exports = app;
