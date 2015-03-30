"use strict"

BaseController = require('central/shared/controller.coffee')
IndexView = require('./views/index')
CallView = require('./views/call')
Articles = require('./collections/articles')


class Controller extends BaseController

    index: @::view(IndexView) (params) ->
        articles = new Articles([
            {name: 1}
            {name: 2}
            {name: 3}
            {name: 12}
        ])
        collection: articles

    call: @::viewWithCallback(CallView) (params, callback) ->
        articles = new Articles([
            {name: 1}
            {name: 2}
            {name: 3}
            {name: 12}
        ])
        articles.fetch
            success: ->
                callback(collection: articles)
            error: ->
                callback(collection: articles)


module.exports = Controller
