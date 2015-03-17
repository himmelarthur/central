"use strict";

var BaseView = require('../../../../shared/base/view'),
    User = require('../models/user.coffee');

module.exports = BaseView.extend({

    template: require('../templates/login.jade'),

    events: {
        'submit form': 'onFormSubmit'
    },

    initialize: function () {
        this.user = new User();
    },

    onFormSubmit: function (evt) {
        evt.preventDefault();
        this.user.login(this.$('.js-login').val(), this.$('.js-password').val());
    }

});
