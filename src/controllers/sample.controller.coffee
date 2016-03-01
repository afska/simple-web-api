module.exports = (app) ->

  app.get "/sample", (req, res) ->
    res.send "Hello! I'm a response."
