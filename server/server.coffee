"use strict"

_ = require('underscore')
express = require('express')
jade = require('jade')
CoffeeScript = require('coffee-script/register')
Router = require('./router.coffee')
Renderer = require('./renderer.coffee')

class Server

    constructor: (options) ->

        defaultOptions =
            port: 3030
            viewsPath: process.cwd() + '/app/views/'
            templatesPath: process.cwd() + '/app/templates/'
            templateAdapter: jade

        @options = _.extend(defaultOptions, options)

        @expressApp = express()

        @expressApp.set('views', @options.viewsPath)
        @expressApp.set('view engine', '.js')

    configure: (options) ->

        defaultOptions =
            routes: []
            staticFolder: null

        options = _.extend(defaultOptions, options)

        @options.routes = options.routes

        throw new Error('Missing static folder') unless options.staticFolder
        throw new Error('Missing controller') unless options.controller

        @expressApp.use(express.static(options.staticFolder))

        @controller = options.controller

        @renderer = new Renderer(_.extend(@options, options))
        @expressApp.engine('js', @renderer.render)

        @router = new Router(_.extend(@options, controller: @controller))

        @router.buildRoutes(options.routes)
        @registerRoutes()

    start: ->
        @expressApp.listen @options.port
        console.info("Central Server good to go, listening on port", this.options.port)

    registerRoutes: ->
        @router.routes.forEach((route) ->
            @expressApp.get(route.path, route.handler)
        , @)

module.exports = Server
