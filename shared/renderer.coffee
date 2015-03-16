"use strict"

_ = require('lodash')

class Renderer

    constructor: (options) ->
        @options = options
        @render = @render.bind(@)

    getOptions: -> {}

    render: (viewPath, data, cb) ->
        cb(null, @getView(viewPath, @getOptions(data)).getHtml())

    getView: (viewPath, options) ->
        View = require(viewPath)
        new View(options)

module.exports = Renderer
