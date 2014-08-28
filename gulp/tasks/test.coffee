gulp = require 'gulp'
sequence = require 'run-sequence'

gulp.task 'test', (cb) ->
  sequence 'concat:tests', 'browserify:tests', 'testem', 'watch:tests', cb
