"use strict"

BaseController = require('central/client/controller.coffee')
IndexView = require('./views/index')


class Controller extends BaseController

    index: (params) ->
        @renderView(IndexView)

module.exports = Controller
