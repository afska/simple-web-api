_ = require("lodash")

module.exports = (request, respond) =>
  console.log new Date()
  console.log JSON.stringify _.omit(request, "headers")
  console.log "----------"

  if request.method isnt "POST"
    return respond.notFound()

  respond.ok()
