'use strict';

var Server = require('./server/server');

exports.Server = Server;

exports.createServer = function () {
    console.log('created server');
    return new Server();
};
