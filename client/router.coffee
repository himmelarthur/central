"use strict"

Backbone = require('../shared/backbone.coffee')
_ = require('underscore')
util = require('./util.coffee')

ClientRouter = Backbone.Router.extend

    initialize: (@options) ->
        @appViewContainer = @options.appView
        @controller = @options.controller
        @renderer = @options.renderer

    bindRoutes: (routes) ->
        _.each(routes, (route) ->
            path = route.path
            path = util.stripLeadingSlash(path)
            view = route.view
            @route(path, path, _.bind(@getHandler(view), @))
        , @)

    getHandler: (view) ->
        controllerHandler = @controller[view]
        renderer = @renderer
        ->
            controllerHandler (View, viewOptions) ->
                renderer.render(View, viewOptions)

module.exports = ClientRouter
