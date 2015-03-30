'use strict'

_ = require('underscore')
BaseController = require('../shared/controller.coffee')

class Router

    constructor: (@options) ->
        throw new Error('No controller specified') unless @options.controller
        @controller = @options.controller
        @routes = []

    buildRoutes: (routes) ->
        routes = if _.isArray(routes) then routes else []
        @addRoutes routes

    addRoutes: (routes) ->
        @routes = routes.map (route) =>
            route.handler = @getHandler(route)
            route

    getHandler: (route) ->
        controllerHandler = @controller[route.view]
        (req, res, next) =>
            controllerHandler (View, viewOptions) ->
                res.render route.view, viewOptions, (err, html) ->
                    if err then next(err)
                    else res.type('html').end(html)

module.exports = Router
