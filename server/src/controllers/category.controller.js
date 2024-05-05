const catchAsync = require("../utils/catchAsync");
const Category = require("./../models/category.model");
const factory = require("./../utils/handlerFactory");
const multer = require("multer");
const sharp = require("sharp");
const cloudinary = require("../utils/cloudinary");

exports.getAllCategories = factory.getAll(Category);
exports.createCategory = factory.createOne(Category);
exports.getCategory = factory.getOne(Category);
exports.updateCategory = factory.updateOne(Category);
exports.deleteCategory = factory.deleteOne(Category);

const path = require("path");

const multerStorage = multer.diskStorage({
  destination: (req, file, cb) => {
    cb(null, "public/categories");
  },
  filename: (req, file, cb) => {
    const ext = file.mimetype.split("/")[1];
    cb(null, `category-${req.body.name}-${Date.now()}.${ext}`);
  },
});

const multerFilter = (req, file, cb) => {
  if (file.mimetype.startsWith("image")) {
    cb(null, true);
  } else {
    cb(new AppError("Not an image! Please upload only images.", 400), false);
  }
};

const upload = multer({ storage: multerStorage, fileFilter: multerFilter });

exports.uploadCategoryIcon = upload.single("image");

exports.uploadCloudinary = catchAsync(async (req, res, next) => {
  if (!req.file) return next();

  const filePath = path.join(
    __dirname,
    `../../public/categories/${req.file.filename}`
  );

  try {
    const result = await cloudinary.uploader.upload(filePath, {
      folder: "categories",
      use_filename: true,
    });
    req.file.filename = result.secure_url;
    req.body.image = result.secure_url;
  } catch (e) {
    return next(new AppError(e, 404));
  }

  next();
});

exports.getPopularCategories = catchAsync(async (req, res, next) => {
  const categories = await Category.find().limit(7);
  const allCategory = await Category.find({ name: "All" });
  categories.push(allCategory[0]);

  res.status(200).json({
    status: "success",
    results: categories.length,
    data: categories,
  });
});

exports.getOtherCategories = catchAsync(async (req, res, next) => {
  const categories = await Category.find();

  const filteredCategories = categories.filter((category) => {
    return category.type !== "other";
  });

  res.status(200).json({
    status: "success",
    results: filteredCategories.length,
    data: filteredCategories,
  });
});
