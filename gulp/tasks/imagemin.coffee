cache = require 'gulp-cache'
gulp = require 'gulp'
imagemin = require 'gulp-imagemin'
size = require 'gulp-size'

{images} = require '../config/files'

gulp.task 'imagemin', ->
  options = progressive: true, interlaced: true
  gulp.src(images.src)
  .pipe(cache(imagemin(options)))
  .pipe(gulp.dest(images.dest))
  .pipe(size(title: 'images'))
