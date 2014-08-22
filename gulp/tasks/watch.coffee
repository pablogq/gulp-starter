gulp = require 'gulp'

{scripts, styles, tests} = require '../config/files'

gulp.task 'watch', ->
  gulp.watch scripts.watch, ['browserify:scripts', 'uglify']
  gulp.watch styles.watch, ['styles', 'csso']

gulp.task 'watch:tests', ->
  gulp.watch tests.watch, ['concat:tests', 'browserify:tests']
