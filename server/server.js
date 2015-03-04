var express = require('express');

function Server () {
    this.expressApp = express();
}

module.exports = Server;
