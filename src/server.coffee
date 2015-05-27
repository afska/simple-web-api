http = require("http")
controller = require("./controller")

module.exports = =>
  port = process.env.PORT || 8081

  http
    .createServer (request, response) =>
      data = ""
      request.on "data", (chunk) => data += chunk
      request.on "end", =>
        req =
          method: request.method
          resource: request.url
          headers: request.headers
          body: data

        response.with = (code, message) =>
          response.writeHead code, { "Content-Type": "text/plain" }
          response.end message
        response.ok = => response.with 200, "ok"
        response.notFound = => response.with 404, "not found"

        controller req, response
    .listen port

  console.log "[!] Listening in port #{port}"
