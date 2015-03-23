"use strict"

class Controller

    renderView: (View, viewOptions) ->
        throw new Error('No Renderer defined') unless @renderer
        view = new View(viewOptions)
        @renderer.render(view)

module.exports = Controller
