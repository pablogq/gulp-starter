gulp = require 'gulp'
sequence = require 'run-sequence'

gulp.task 'default', ['clean'], (cb) ->
  build = ['browserify:scripts', 'styles', 'html', 'copy']
  optimize = ['uglify', 'csso']
  sequence build, optimize, 'watch', cb
