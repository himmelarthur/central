var central = require('../../index'),
    routes = require('./app/routes');

if (require.main === module) {
    var server = central.createServer();
    server.configure({
        routes: routes
    });
    server.start();
}
