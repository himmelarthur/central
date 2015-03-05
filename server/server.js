"use strict";

var _ = require('lodash'),
    express = require('express'),
    Router = require('./router'),
    Renderer = require('./renderer');

function Server (options) {

    var defaultOptions = {
        port: 3030,
        viewsPath: process.cwd() + '/app/views/',
        templatesPath: process.cwd() + '/app/templates/'
    };

    options = options || defaultOptions;
    this.options = _.defaults(options, defaultOptions);

    this.expressApp = express();

    this.renderer = new Renderer(this.options);

    this.expressApp.set('views', this.options.viewsPath);
    this.expressApp.set('view engine', 'js');
    this.expressApp.engine('js', this.renderer.render);

    this.router = new Router(this.options);

}

Server.prototype.configure = function (options) {
    this.router.buildRoutes(options.routes);
    this.registerRoutes();
}

Server.prototype.start = function () {
    this.expressApp.listen(this.options.port);
}

Server.prototype.registerRoutes = function () {
    this.router.routes.forEach(function (route) {
        this.expressApp.get(route.path, route.handler);
    }, this);
}

module.exports = Server;
