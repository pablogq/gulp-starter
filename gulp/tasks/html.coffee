gulp = require 'gulp'
size = require 'gulp-size'
template = require 'gulp-template'

pkg = require '../../package.json'
{root} = require '../config/files'

gulp.task 'html', ->
  gulp.src("./#{root.src}/**/*.html")
  .pipe(template(package: pkg))
  .pipe(gulp.dest(root.dest))
  .pipe(size(title: 'copy'))
