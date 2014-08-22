gulp = require 'gulp'
sequence = require 'run-sequence'

gulp.task 'default', ['clean'], (cb) ->
  build = ['browserify:scripts', 'styles', 'html', 'copy']
  optimize = ['uglify']
  sequence build, optimize, 'watch', cb
