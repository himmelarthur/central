"use strict";

var _ = require('lodash'),
    fs = require('fs'),
    path = require('path'),
    jade = require('jade'),
    View = require('../../server/backbone').View;

module.exports = View.extend({

    constructor: function (options) {
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
