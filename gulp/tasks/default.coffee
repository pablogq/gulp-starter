gulp = require 'gulp'
runSequence = require 'run-sequence'

gulp.task 'default', ['clean'], (cb) ->
  runSequence 'browserify:scripts', 'uglify', 'copy', 'watch', cb
