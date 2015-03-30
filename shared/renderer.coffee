"use strict"

_ = require('underscore')


class Renderer

    constructor: (options) ->
        @options = options
        @render = @render.bind(@)

    getOptions: (viewOptions) ->
        _.extend {}, @options, viewOptions

    getView: (View, viewOptions) ->
        new View(viewOptions)

module.exports = Renderer
