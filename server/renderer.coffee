"use strict"

_ = require('underscore')
cheerio = require('cheerio')
BaseRenderer = require('../shared/renderer.coffee')

class ServerRenderer extends BaseRenderer

    getOptions: (data) ->
        _.extend {}, @options, data,
            locals:
                routes: @options.routes
                viewsPath: @options.viewsPath
                templatesPath: @options.templatesPath

    render: (viewPath, data, cb) ->
        options = @getOptions(data)
        layout = @getLayout(options)
        $ = cheerio.load(layout)
        view = @getView(viewPath, options)
        $('body').html(view.getHtml())
        cb(null, $.html())

    getView: (viewPath, options) ->
        View = require(viewPath)
        new View(options)

module.exports = ServerRenderer
