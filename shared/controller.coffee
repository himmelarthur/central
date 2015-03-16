"use strict"

class Controller

    renderView: (View) ->
        throw new Error('No Renderer defined') unless @renderer
        view = new View()
        @renderer.render(view)

module.exports = Controller
