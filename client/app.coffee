"use strict"

Backbone = require('../shared/backbone.coffee')
$ = require('jquery')
Backbone.$ = $
_ = require('underscore')
util = require('./util')
AppViewContainer = require('./app_view_container')
ClientRouter = require('./router.coffee')
Renderer = require('./renderer.coffee')

ClientApp = Backbone.Model.extend

    initialize: (options) ->
        options = _.extend
            el: 'body'
            routes: {}
        , options

        throw new Error('No Controller specified') unless @controller

        appViewContainer = new AppViewContainer options

        @renderer = new Renderer(appViewContainer, options)

        @router = new ClientRouter
            routes: options.routes
            templatesPath: options.templatesPath
            viewsPath: options.viewsPath
            controller: @controller
            renderer: @renderer

        @router.bindRoutes(options.routes)

        Backbone.history.start pushState: on

        @listenToLinks()

    listenToLinks: ->
        $(document).on('click', 'a', _.bind((event) ->
            event.preventDefault()
            @router.navigate util.stripLeadingSlash(event.target.pathname), trigger: on
        , @))

module.exports = ClientApp
