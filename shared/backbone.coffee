Backbone = require('backbone')

if process
    Backbone.$ = require('cheerio')
else
    Backbone.$ = require('jquery')

module.exports = Backbone
