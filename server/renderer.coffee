"use strict"

_ = require('underscore')
cheerio = require('cheerio')
path = require('path')
requireJade = require('require-jade')
BaseRenderer = require('../shared/renderer.coffee')

class ServerRenderer extends BaseRenderer

    getOptions: (viewOptions) ->
        _.extend super(viewOptions),
            locals:
                routes: @options.routes
                viewsPath: @options.viewsPath
                templatesPath: @options.templatesPath

    render: (viewPath, viewOptions, cb) ->
        options = @getOptions(viewOptions)
        layout = @getLayout(options)
        $ = cheerio.load(layout)
        view = @getView(viewPath, options)
        $(@options.rootEl).html(view.getHtml())
        cb(null, $.html())

    getView: (viewPath, options) ->
        View = require(viewPath)
        new View(options)

    getLayout: (data) ->
        layout = require(path.join(@options.templatesPath, 'layout.jade'))
        layout(data)


module.exports = ServerRenderer
