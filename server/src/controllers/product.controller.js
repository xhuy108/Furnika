const Product = require("./../models/product.model");
const factory = require("./../utils/handlerFactory");
const catchAsync = require("./../utils/catchAsync");
const AppError = require("./../utils/appError");
const multer = require("multer");
const sharp = require("sharp");
const cloudinary = require("./../utils/cloudinary");
const path = require("path");

const multerStorage = multer.memoryStorage();

const multerFilter = (req, file, cb) => {
  if (file.mimetype.startsWith("image")) {
    cb(null, true);
  } else {
    cb(new AppError("Not an image! Please upload only images.", 400), false);
  }
};

const upload = multer({ storage: multerStorage, fileFilter: multerFilter });

exports.uploadProductImages = upload.fields([
  { name: "imageCover", maxCount: 1 },
  { name: "images", maxCount: 10 },
]);

exports.resizeProductImages = catchAsync(async (req, res, next) => {
  if (!req.files.imageCover || !req.files.images) return next();

  req.body.imageCover = `product-${req.params.id}-${Date.now()}-cover.jpeg`;

  await sharp(req.files.imageCover[0].buffer)
    .resize(2000, 1333)
    .toFormat("jpeg")
    .jpeg({ quality: 90 })
    .toFile(`public/products/${req.body.imageCover}`);

  req.body.images = [];

  await Promise.all(
    req.files.images.map(async (file, i) => {
      const filename = `product-${req.params.id}-${Date.now()}-${i + 1}.jpeg`;

      await sharp(file.buffer)
        .resize(2000, 1333)
        .toFormat("jpeg")
        .jpeg({ quality: 90 })
        .toFile(`public/products/${filename}`);

      req.body.images.push(filename);
    })
  );

  next();
});

exports.uploadCloudinary = catchAsync(async (req, res, next) => {
  if (!req.files.imageCover || !req.files.images) return next();

  const imageCover = req.body.imageCover;

  const imageCoverPath = path.join(
    __dirname,
    `../../public/products/${imageCover}`
  );

  try {
    const result = await cloudinary.uploader.upload(imageCoverPath, {
      folder: "products",
      use_filename: true,
    });

    req.body.imageCover = result.secure_url;

    const images = [];

    await Promise.all(
      req.body.images.map(async (file, i) => {
        const filePath = path.join(__dirname, `../../public/products/${file}`);

        const result = await cloudinary.uploader.upload(filePath, {
          folder: "products",
          use_filename: true,
        });
        images.push(result.secure_url);
      })
    );
    req.body.images = images;
  } catch (e) {
    return next(new AppError(e, 404));
  }

  next();
});

exports.getAllProducts = factory.getAll(Product);
exports.getProduct = factory.getOne(Product, { path: "reviews" });
exports.createProduct = factory.createOne(Product);
exports.updateProduct = factory.updateOne(Product);
exports.deleteProduct = factory.deleteOne(Product);

exports.addToWishlist = catchAsync(async (req, res, next) => {
  const product = await Product.findById(req.params.id);
  if (!product) {
    return next(new AppError("No product found with that ID", 404));
  }

  if (req.user.wishlist.find((e) => e.id === req.params.id)) {
    req.user.wishlist.pull(req.params.id);
  } else {
    req.user.wishlist.unshift(product);
  }

  await req.user.save({ validateBeforeSave: false });

  res.status(200).json({
    status: "success",
    data: {
      data: req.user,
    },
  });
});

exports.removeFromWishlist = catchAsync(async (req, res, next) => {
  const product = await Product.findById(req.params.id);
  if (!product) {
    return next(new AppError("No product found with that ID", 404));
  }

  if (req.user.wishlist.find((e) => e.id === req.params.id)) {
    req.user.wishlist.pull(req.params.id);
  } else {
    return next(
      new AppError("You have not added this product to wishlist", 404)
    );
  }

  await req.user.save({ validateBeforeSave: false });

  res.status(200).json({
    status: "success",
    data: {
      data: req.user,
    },
  });
});
