"use strict"

require("coffee-script/register")
#[^] last version of coffee

module.exports = (grunt) ->
  #-------
  #Plugins
  #-------
  require("load-grunt-tasks") grunt

  #-----
  #Tasks
  #-----
  grunt.registerTask "default", "serve"
  grunt.registerTask "serve", "nodemon"
  grunt.registerTask "test", "mochaTest"

  #------
  #Config
  #------
  grunt.initConfig
    # Run server and watch for changes
    nodemon:
      dev:
        script: "main.js"
        options:
          ext: "js,coffee"

    # Run tests
    mochaTest:
      options:
        reporter: "spec"
      src: ["src/**/*.spec.coffee"]
