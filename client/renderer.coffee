"use strict"

BaseRenderer = require('../shared/renderer.coffee')

class ClientRenderer extends BaseRenderer

    constructor: (@appViewContainer, options) ->
        @firstRender = on
        super options

    render: (View, viewOptions) ->
        view = @getView(View, viewOptions)
        if @firstRender
            @firstRender = off
        else
            html = view.getHtml()
            @appViewContainer.$el.html(html)
        @attachView(view)

    attachView: (view) ->
        view.setElement(@appViewContainer.$el)

module.exports = ClientRenderer
