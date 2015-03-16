"use strict";

var _ = require('lodash'),
    fs = require('fs'),
    path = require('path'),
    jade = require('jade'),
    View = require('../../server/backbone').View;

module.exports = View.extend({

    constructor: function (options) {
        this.options = _.extend(this.options || {}, options || {});
        this.locals = options.locals;
    },

    template: null,

    getHtml: function () {
        var data = this.getData();
        var template = this.getTemplatePath();
        var fn = jade.compile(fs.readFileSync(template, 'utf-8'), {
            filename: template
        });
        return fn(data);
    },

    getHtmlClient: function () {
        var data = this.getData();
        var template = this.getTemplatePath();
        var fn = require(template);
        return fn(data);
    },

    getData: function () {
        var data = _.extend({}, this.locals);
        if (!this.model) {
            return data;
        }
        return _.extend(data, this.model.toJSON());
    },

    getTemplatePath: function () {
        console.log(this.options.templatesPath, this.template)
        return path.join(this.options.templatesPath, this.template);
    }

});
