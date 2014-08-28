gulp = require 'gulp'
sequence = require 'run-sequence'
watch = require 'gulp-watch'

{scripts, styles, tests} = require '../config/files'

gulp.task 'watch', ->
  scriptsOptions = glob: scripts.watch, name: 'scripts', emitOnGlob: false
  stylesOptions = glob: styles.watch, name: 'styles', emitOnGlob: false
  watch scriptsOptions, -> sequence 'browserify:scripts', 'uglify'
  watch stylesOptions, -> sequence 'styles', 'csso'

gulp.task 'watch:tests', ->
  testsOptions = glob: tests.watch, silent: true, emitOnGlob: false
  watch testsOptions, -> sequence 'concat:tests', 'browserify:tests'
