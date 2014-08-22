gulp = require 'gulp'
gutil = require 'gulp-util'
size = require 'gulp-size'

{root} = require '../config/files'

gulp.task 'copy', ->
  src = [
    "./#{root.src}/**"
    "!./#{root.src}/**/*.html"
    "!./#{root.src}/{images,scripts,styles,pages}/"
    "!./#{root.src}/{images/**,scripts/**,styles/**,pages/**}"
  ]
  gulp.src(src, dot: true)
  .pipe(gulp.dest(root.dest))
  .pipe(size(title: 'copy'))
