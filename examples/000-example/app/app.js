"use strict";

var path = require('path'),
    BaseApplication = require('../../../client/app.coffee'),
    $ = require('jquery');

var Application = window.Application = BaseApplication.extend({

    templatesPath: path.join(__dirname) + 'templates/'

});
