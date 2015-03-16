"use strict";

var _ = require('lodash');

function Router (options) {
    this.options = options;
    this.routes = [];
}

Router.prototype.buildRoutes = function (routes) {
    routes = _.isArray(routes) ? routes : [];
    this.addRoutes(routes);
};

Router.prototype.addRoutes = function (routes) {
    this.routes = routes.map(function (route) {
        route.handler = this.getHandler(route);
        return route;
    }, this);
};

Router.prototype.getHandler = function (route) {
    return function (req, res, next) {
        console.log(route.view);
        res.render(route.view, {}, function (err, html) {
            if (err) return next(err);
            res.type('html').end(html);
        });
    };
};

module.exports = Router;
