'use strict';

var _ = require('underscore');

function Router (options) {
    this.options = options;
    if (!options.controller) {
        throw new Error('No controller specified');
    }
    this.controller = this.options.controller;
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
    var controllerHandler = this.controller[route.view];
    return function (req, res, next) {
        controllerHandler(function (data) {
            res.render(route.view, data, function (err, html) {
                if (err) return next(err);
                res.type('html').end(html);
            });
        });
    };
};

module.exports = Router;
