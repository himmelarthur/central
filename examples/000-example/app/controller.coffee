"use strict"

BaseController = require('../../../shared/controller.coffee')
IndexView = require('./views/index')
LoginView = require('./views/login')


class Controller extends BaseController

    index: (params) ->
        @renderView(IndexView)

    login: (params) ->
        @renderView(LoginView)

module.exports = Controller
