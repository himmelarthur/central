#!/usr/bin/env node

var program = require('commander'),
    resolve = require('path').resolve,
    ncp = require('ncp').ncp;

program
    .version('0.1.0')
    .usage('[dir]')
    .parse(process.argv);

var path = program.args[0] || '.';
var src = resolve(__dirname, '../bootstrap');

ncp(src, path, function (err) {
    if (err) {
        return console.log(err);
    }
    console.log('Central App initialized!');
    console.log('');
    console.log('Install dependencies with: ');
    console.log('$ npm install');
    console.log('');
    console.log('Build project with: ');
    console.log('$ grunt');
    console.log('');
});
