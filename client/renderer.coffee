"use strict"

BaseRenderer = require('../shared/renderer.coffee')

class ClientRenderer extends BaseRenderer

    constructor: (@appViewContainer, options) ->
        super options

    render: (view, data, cb) ->
        template = view.getTemplate()
        html = template(data)
        @appViewContainer.$el.html(html)


module.exports = ClientRenderer
