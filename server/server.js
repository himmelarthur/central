"use strict";

var _ = require('underscore'),
    express = require('express'),
    jade = require('jade'),
    CoffeeScript = require('coffee-script/register'),
    Router = require('./router'),
    Renderer = require('./renderer.coffee');

function Server (options) {

    var defaultOptions = {
        port: 3030,
        viewsPath: process.cwd() + '/app/views/',
        templatesPath: process.cwd() + '/app/templates/',
        templateAdapter: jade
    };

    this.options = _.extend(defaultOptions, options);

    this.expressApp = express();

    this.expressApp.set('views', this.options.viewsPath);
    this.expressApp.set('view engine', 'js');

}

Server.prototype.configure = function (options) {

    var defaultOptions = {
        routes: [],
        staticFolder: null
    };

    options = _.extend(defaultOptions, options);

    this.options.routes = options.routes

    if (!options.staticFolder) {
        throw new Error('Missing static Folder');
    }
    this.expressApp.use(express.static(options.staticFolder));

    this.renderer = new Renderer(this.options);
    this.expressApp.engine('js', this.renderer.render);

    if (!options.controller) {
        throw new Error('Missing controller');
    }

    this.controller = new options.controller();

    this.router = new Router(_.extend(this.options, {controller: this.controller}));

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
