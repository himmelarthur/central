"use strict"

Backbone = require('../shared/backbone.coffee')
_ = require('underscore')
util = require('./util')

ClientRouter = Backbone.Router.extend

    initialize: (@options) ->
        @appViewContainer = @options.appView
        @controller = @options.controller

    bindRoutes: (routes) ->
        _.each(routes, (route) ->
            path = route.path
            path = util.stripLeadingSlash(path)
            view = route.view
            @route(path, path, _.bind(@getHandler(view), @))
        , @)

    getHandler: (view) ->
        -> @controller[view]()

module.exports = ClientRouter
