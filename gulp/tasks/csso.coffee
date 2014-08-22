csso = require 'gulp-csso'
gulp = require 'gulp'
gutil = require 'gulp-util'
rename = require 'gulp-rename'
size = require 'gulp-size'

{styles} = require '../config/files'

gulp.task 'csso', ->

  bundle = "#{styles.dest}/#{styles.bundled}"

  gulp.src(bundle)
  .on('error', gutil.log)
  .on('error', gutil.beep)
  .pipe(csso())
  .pipe(rename(styles.minified))
  .pipe(gulp.dest(styles.dest))
  .pipe(size(title: 'csso'))
