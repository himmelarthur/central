"use strict";

var _ = require('lodash');

function Renderer (options) {
    this.options = options || {};
    this.viewsPath = options.viewsPath;
    this.templatesPath = options.templatesPath;

    this.render = this.render.bind(this);
}

Renderer.prototype.render = function (viewPath, data, callback) {
    var View = require(viewPath);
    var viewOptions = _.extend(this.options, {
        viewPath: viewPath
    });
    var view = new View(this.options);
    callback(null, view.getHtml());
};

module.exports = Renderer;
