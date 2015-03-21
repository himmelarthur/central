"use strict";

var _ = require('undescore'),
    View = require('../backbone.coffee').View;

module.exports = View.extend({

    initialize: function (options) {
        this.options = _.extend(this.options || {}, options || {});
        this.locals = this.options.locals;
    },

    template: null,

    getHtml: function () {
        var data = this.getData();
        var template = this.getTemplate();
        return template(data);
    },

    getData: function () {
        var data = _.extend({}, this.locals);
        if (!this.model) {
            return data;
        }
        return _.extend(data, this.model.toJSON());
    },

    getTemplate: function () {
        return this.template;
    }

});
