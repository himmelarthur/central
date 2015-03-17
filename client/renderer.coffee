"use strict"

BaseRenderer = require('../shared/renderer.coffee')

class ClientRenderer extends BaseRenderer

    constructor: (@appViewContainer, options) ->
        super options

    render: (view, data, cb = ->) ->
        html = view.getHtml()
        @appViewContainer.$el.html(html)
        view.setElement(@appViewContainer.$el)
        cb(null, html)


module.exports = ClientRenderer
