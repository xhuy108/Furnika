const catchAsync = require("../utils/catchAsync");
const Category = require("./../models/category.model");
const factory = require("./../utils/handlerFactory");

exports.getAllCategories = factory.getAll(Category);
exports.createCategory = factory.createOne(Category);
exports.getCategory = factory.getOne(Category);
exports.updateCategory = factory.updateOne(Category);
exports.deleteCategory = factory.deleteOne(Category);
