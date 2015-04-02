"use strict"

_ = require('underscore')
Backbone = require('../backbone.coffee')

module.exports = Backbone.View.extend

    initialize: (@options = {}) ->
        @locals = @options.locals

    template: null

    getHtml: ->
        data = @getData()
        template = @getTemplate()
        template(data)

    getData: ->
        data = _.extend({}, @locals)
        modelData = if @model then model: @model.toJSON() else {}
        collectionData = if @collection then collection: @collection.toJSON() else {}
        _.extend(data, modelData, collectionData)

    getTemplate: ->
        @template
