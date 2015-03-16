"use strict";

var Backbone = require('./backbone');

var AppViewContainer = Backbone.View.extend({

    render: function () {
        this.$el.html('hello');
        return this;
    }

});

module.exports = AppViewContainer;
