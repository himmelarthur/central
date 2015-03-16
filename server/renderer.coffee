"use strict"

_ = require('lodash')
BaseRenderer = require('../shared/renderer.coffee')

class ServerRenderer extends BaseRenderer

    getOptions: (data) ->
        _.extend {}, @options, data,
            locals:
                routes: @options.routes
                viewsPath: @options.viewsPath
                templatesPath: @options.templatesPath

module.exports = ServerRenderer
