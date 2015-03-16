"use strict"

Backbone = require('backbone')
_ = require('underscore')
$ = require('jquery')
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

        @appViewContainer = new AppViewContainer options

        @renderer = new Renderer(options)

        @router = new ClientRouter
            appView: @appViewContainer
            routes: options.routes
            renderer: @renderer
            templatesPath: options.templatesPath
            viewsPath: options.viewsPath

        Backbone.history.start pushState: on

        @listenToLinks()

    listenToLinks: ->
        $(document).on('click', 'a', _.bind((event) ->
            event.preventDefault()
            @router.navigate util.stripLeadingSlash(event.target.pathname), trigger: on
        , @))

module.exports = ClientApp
