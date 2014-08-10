gulp = require 'gulp'

{scripts} = require '../config/files'

gulp.task 'watch', ->
  gulp.watch './src/scripts/**/*.coffee', ['browserify:scripts', 'uglify']
  gulp.watch ['./tests/**/*.coffee', './src/scripts/**/*.coffee'], ['concat:tests', 'browserify:tests']
