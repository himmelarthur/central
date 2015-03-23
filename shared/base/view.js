"use strict";

var _ = require('underscore'),
    View = require('../backbone.coffee').View;

module.exports = View.extend({

    initialize: function (options) {
        this.options = _.extend(this.options || {}, options || {});
        this.locals = this.options.locals;
    },

    template: null,

    getHtml: function () {
        var data = this.getData(),
            template = this.getTemplate();
        return template(data);
    },

    getData: function () {
        var data,
            modelData,
            collectionData;
        data = _.extend({}, this.locals);
        modelData = this.model ? {model: this.model.toJSON()} : {};
        collectionData = this.collection ? {collection: this.collection.toJSON()} : {};
        return _.extend(data, modelData, collectionData);
    },

    getTemplate: function () {
        return this.template;
    }

});
