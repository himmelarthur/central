'use strict';

var Server = require('./server/server');

exports.Server = Server;

exports.createServer = function () {
    return new Server();
};
