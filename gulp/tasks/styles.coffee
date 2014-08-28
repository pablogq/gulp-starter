_if = require 'gulp-if'
prefix = require 'gulp-autoprefixer'
gulp = require 'gulp'
gutil = require 'gulp-util'
rename = require 'gulp-rename'
sass = require 'gulp-ruby-sass'
size = require 'gulp-size'

{styles} = require '../config/files'
{browsers} = require '../config/autoprefixer'

gulp.task 'styles', ->

  gulp.src(styles.src)
  .on('error', gutil.log)
  .on('error', gutil.beep)
  .pipe(_if '*.{sass,scss}', sass(style: 'expanded').on('error', gutil.log))
  .pipe(prefix(browsers))
  .pipe(rename(styles.bundled))
  .pipe(gulp.dest(styles.dest))
  .pipe(size(title: 'styles'))
