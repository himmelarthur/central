var central = require('central'),
    routes = require('./app/routes'),
    Controller = require('./app/controller.coffee'),
    server = central.createServer();

server.configure({
    routes: routes,
    staticFolder: __dirname + '/public',
    controller: new Controller(),
    rootEl: '.content'
});
server.start();
