/*global describe, it */
'use strict';
var assert = require('assert');
var central = require('../');

describe('central node module', function () {
  it('must have at least one test', function () {
    central();
    assert(false, 'I was too lazy to write any tests. Shame on me.');
  });
});
