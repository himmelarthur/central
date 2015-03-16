"use strict"

BaseRenderer = require('../shared/renderer.coffee')

class ClientRenderer extends BaseRenderer

    render: (viewPath, data, cb) ->
        cb(null, @getView(viewPath, @getOptions(data)).getInnerHtml())


module.exports = ClientRenderer
