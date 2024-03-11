const User = require("./../models/user.model");
const catchAsync = require("./../utils/catchAsync");
const AppError = require("./../utils/appError");
const factory = require("./../utils/handlerFactory");
const multer = require("multer");
const sharp = require("sharp");
// const cloudinary = require("../utils/cloudinary");
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

exports.uploadUserPhoto = upload.single("avatar");
exports.resizeUserPhoto = catchAsync(async (req, res, next) => {
  if (!req.file) return next();

  req.file.filename = `user-${req.user.id}-${Date.now()}.jpeg`;

  await sharp(req.file.buffer)
    .resize(500, 500)
    .toFormat("jpeg")
    .jpeg({ quality: 90 })
    .toFile(`public/img/users/${req.file.filename}`);

  next();
});

// exports.uploadCloudinary = catchAsync(async (req, res, next) => {
//   if (!req.file) return next();

//   const filePath = path.join(
//     __dirname,
//     `../public/img/users/${req.file.filename}`
//   );

//   try {
//     const result = await cloudinary.uploader.upload(filePath, {
//       folder: "users",
//       use_filename: true,
//     });
//     req.file.filename = result.secure_url;
//   } catch (e) {
//     console.log(e);
//   }

//   next();
// });

const filterObject = (obj, ...allowedFields) => {
  const newObj = {};
  Object.keys(obj).forEach((el) => {
    if (allowedFields.includes(el)) {
      newObj[el] = obj[el];
    }
  });
  return newObj;
};

exports.getMe = (req, res, next) => {
  req.params.id = req.user.id;
  next();
};

exports.updateMe = catchAsync(async (req, res, next) => {
  // 1) Create error if user POSTs password data
  if (req.body.password) {
    return next(
      new AppError(
        "This route is not for password updates. Please use /updateMyPassword.",
        400
      )
    );
  }

  // 2) Filtered out unwanted fields names that are not allowed to be updated
  const filteredBody = filterObject(
    req.body,
    "username",
    "email",
    "phoneNumber",
    "gender",
    "birthday"
  );
  if (req.file) filteredBody.avatar = req.file.filename;

  // 3) Update user document
  const updatedUser = await User.findByIdAndUpdate(req.user.id, filteredBody, {
    new: true,
    runValidators: true,
  });

  res.status(200).json({
    status: "success",
    data: {
      data: updatedUser,
    },
  });
});

exports.deleteMe = catchAsync(async (req, res, next) => {
  await User.findByIdAndUpdate(req.user.id, { isActive: false });

  res.status(204).json({
    status: "success",
    data: null,
  });
});

exports.getAllUsers = factory.getAll(User);
exports.getUser = factory.getOne(User);
exports.updatedUser = factory.updateOne(User);
exports.deleteUser = factory.deleteOne(User);

exports.getWishlist = catchAsync(async (req, res, next) => {
  const user = await User.findById(req.user.id).populate({
    path: "wishlist",
  });
  res.status(200).json({
    status: "success",
    result: user.wishlist.length,
    data: {
      wishlist: user.wishlist,
    },
  });
});
