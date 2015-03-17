"use strict";

var remapify = require('remapify');

module.exports = function(grunt) {
  // Project configuration.
  grunt.initConfig({
    pkg: grunt.file.readJSON('../../package.json'),
    browserify: {
      options: {
        browserifyOptions: {
          debug: true
        },
        transform: ['coffeeify', 'jadeify']
      },
      app: {
        src: [ 'app/app.js' ],
        dest: 'public/script.js'
      }
    },
    watch: {
      js: {
        files: [ 'app/**/*.{js,coffee}' ],
        tasks: ['browserify:app']
      }
    }
  });

  grunt.loadNpmTasks('grunt-contrib-watch');
  grunt.loadNpmTasks('grunt-browserify');

  grunt.registerTask('default', ['browserify']);

};
