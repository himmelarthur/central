"use strict"

path = require('path')
requireJade = require('require-jade')

class Renderer

    constructor: (options) ->
        @options = options
        @render = @render.bind(@)

    getOptions: -> {}

    getLayout: (data) ->
        layout = require(path.join(@options.templatesPath, 'layout.jade'))
        layout(data)

    getView: (viewPath, options) ->
        View = require(viewPath)
        new View(options)

module.exports = Renderer
