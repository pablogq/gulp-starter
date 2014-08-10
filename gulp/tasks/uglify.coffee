gulp = require 'gulp'
gutil = require 'gulp-util'
rename = require 'gulp-rename'
size = require 'gulp-size'
streamify = require 'gulp-streamify'
uglify = require 'gulp-uglify'

{scripts} = require '../config/files'

gulp.task 'uglify', ->

  bundle = "#{scripts.dest}/#{scripts.bundled}"

  gulp.src(bundle)
  .on('error', gutil.log)
  .on('error', gutil.beep)
  .pipe(streamify(uglify()))
  .pipe(rename(scripts.minified))
  .pipe(gulp.dest(scripts.dest))
  .pipe(size(title: 'uglified'))
