"use strict"

BaseRenderer = require('../shared/renderer.coffee')

class ClientRenderer extends BaseRenderer

    constructor: (@appViewContainer, options) ->
        super options

    render: (view, data, cb = ->) ->
        html = view.getHtml()
        @appViewContainer.$el.html(html)
        @attachView(view)
        cb(null, html)

    attachView: (view) ->
        view.setElement(@appViewContainer.$el)


module.exports = ClientRenderer
