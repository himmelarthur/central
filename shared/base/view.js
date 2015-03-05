"use strict";

var _ = require('lodash'),
    View = require('../backbone').View;

module.exports = View.extend({

    constructor: function (options) {
        this.options = _.extend(this.options || {}, options || {});
    },

    template: null,

    getHtml: function () {
        var template = this.getTemplate();
        var data = this.getData();
        return template(data);
    },

    getData: function () {
        if (!this.model) {
            return {};
        }
        return this.model.toJSON();
    },

    getTemplate: function () {
        return require(this.options.templatesPath + this.template);
    }

});
