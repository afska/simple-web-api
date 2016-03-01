express = require("express")
_ = require("lodash")

###
A http server that listen to connections and delegates requests to the controller.
###
module.exports = =>
  _.assign process.env, try require("./config/env")
  port = process.env.PORT || 8081

  # configure pretty-error...
  require('pretty-error').start();

  # configure express...
  app = express()
  app.use require("body-parser").json limit: "50mb" # json parser
  app.use require("morgan") "dev" # logger
  app.use express.static("views") # serve client side
  app.engine "html", require("ejs").renderFile # rendering engine
  app.set "view engine", "html" # view engine
  require("./routes") app

  # ensure the blobs directories exist...
  mkdirp = require("mkdirp")
  mkdirp "#{__dirname}/../blobs/uploads"

  # listen...
  app.listen port
  console.log "[!] Listening in port #{port}..."
