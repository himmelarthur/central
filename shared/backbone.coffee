Backbone = require('backbone')
_ = require('underscore')

cheerio = require('cheerio')
stubbedMethods = ['on', 'off', 'bind', 'unbind', 'delegate', 'undelegate', 'live', 'die', 'trigger']

_.each stubbedMethods, (method) ->
    cheerio.prototype[method] = -> @

if process
    Backbone.$ = cheerio
else
    Backbone.$ = require('jquery')

module.exports = Backbone
