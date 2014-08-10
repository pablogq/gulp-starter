gulp = require 'gulp'
runSequence = require 'run-sequence'

gulp.task 'test', (cb) ->
  runSequence 'concat:tests', 'browserify:tests', 'watch', 'testem', cb
