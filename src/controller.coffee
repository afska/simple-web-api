_ = require("lodash")

module.exports = (request, response) =>
  console.log new Date()
  console.log JSON.stringify _.omit(request, "headers")
  console.log "----------"

  respond = (code, message) =>
    response.writeHead code, { "Content-Type": "text/plain" }
    response.end message

  #---

  if request.method isnt "POST"
    return respond 404, "not found"

  respond 200, "ok"
