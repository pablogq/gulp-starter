fork = require('child_process').fork

gulp = require 'gulp'
gutil = require 'gulp-util'

gulp.task 'testem', ['testem:config'], ->

  try
    args = [
      '-g'
      '-f'
      './tests/build/testem.json'
    ]
    child = fork './node_modules/testem/testem.js', args
    child.on 'exit', (code, signal) ->
      if code isnt 0
        gutil.log 'Testem execution failed with exit code #{code}'
      process.exit code
  catch e
    gutil.log e
    throw e
