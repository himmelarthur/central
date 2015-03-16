"use strict"

BaseController = require('../../../shared/controller.coffee')

class Controller extends BaseController

    index: (params) ->
        IndexView = require('./views/index')
        indexView = new IndexView()
        @renderer.render(indexView)

    login: (params) ->
        LoginView = require('./views/login')
        loginView = new LoginView()
        @renderer.render(loginView)

module.exports = Controller
