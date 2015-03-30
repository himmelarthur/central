"use strict"


class Controller

    renderView: (View, viewOptions) ->
        throw new Error('No Renderer defined') unless @renderer
        view = new View(viewOptions)
        @renderer.render(view)

Controller::view = (View) -> (control) -> ->
    [params, next] = arguments
    if typeof params is 'function' then next = params
    viewOptions = control.apply @, [params] || {}
    next(View, viewOptions)

Controller::viewWithCallback = (View) -> (control) -> ->
    [params, next] = arguments
    callback = (viewOptions) ->
        next(View, viewOptions)
    if typeof params is 'function' then next = params
    viewOptions = control.apply @, [params, callback] || {}


module.exports = Controller
