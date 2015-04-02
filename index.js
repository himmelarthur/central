'use strict';

require('coffee-script/register');
var Server = require('./server/server.coffee');

exports.Server = Server;

exports.createServer = function (options) {
    return new Server(options);
};
