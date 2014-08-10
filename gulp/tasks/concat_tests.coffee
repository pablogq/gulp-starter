coffee = require 'gulp-coffee'
concat = require 'gulp-concat'
gulp = require 'gulp'
gutil = require 'gulp-util'

{tests} = require '../config/files'

compileAndConcat = (output, src, dest) ->
  gulp.src(src)
  .pipe(coffee bare: true)
  .pipe(concat output)
  .pipe(gulp.dest dest)
  .on('error', gutil.log)
  .on('error', gutil.beep)

gulp.task 'concat:tests', ->
  compileAndConcat 'setup.js', tests.setup, tests.dest
  compileAndConcat 'tests.js', tests.src, tests.dest
