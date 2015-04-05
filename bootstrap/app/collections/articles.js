var BaseCollection = require('central/shared/base').Collection;

var Articles = BaseCollection.extend({

    model: require('../models/article'),

    url: 'http://jsonplaceholder.typicode.com/comments',

});

module.exports = Articles;
