const mongoose = require("mongoose");
const dotenv = require("dotenv");

process.on("uncaughtException", (err) => {
  console.log("UNCAUGHT EXCEPTION! SHUTTING DOWN...");
  console.log(err.name, err.message);
  process.exit(1);
});

dotenv.config({ path: "./.env" });
const app = require("./app");

const DB = process.env.DATABASE_URL;

mongoose.connect(DB).then(() => {
  console.log("Connection Successful");
});

const port = process.env.PORT || 3000;
const server = app.listen(port, "0.0.0.0", () => {
  console.log(`Connected at port ${port}`);
});

process.on("unhandledRejection", (err) => {
  console.log("UNHANDLED REJECTION! SHUTTING DOWN...");
  console.log(err.name, err.message);
  server.close(() => {
    process.exit(1);
  });
});
