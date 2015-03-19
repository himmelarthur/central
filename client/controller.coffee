BaseController = require('../shared/controller.coffee')

class ClientController extends BaseController

    constructor: (options) ->
        @firstRender = on

    renderView: (View) ->
        throw new Error('No Renderer defined') unless @renderer
        view = new View()
        if @firstRender
            @firstRender = off
            @renderer.attachView(view)
        else
            @renderer.render(view)

module.exports = ClientController
