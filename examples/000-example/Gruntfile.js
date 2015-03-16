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
      },
      views: {
        src: [ 'app/views/**/*.{js,coffee}' ],
        dest: 'public/views.js'
      }
    },
    watch: {
      js: {
        files: ['./**/*.js'],
        tasks: ['default'],
        options: {
          livereload: true
        }
      }
    }
  });

  grunt.loadNpmTasks('grunt-contrib-watch');
  grunt.loadNpmTasks('grunt-browserify');

  grunt.registerTask('default', ['browserify']);

};
