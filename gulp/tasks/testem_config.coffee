_ = require 'lodash'
cson = require 'gulp-cson'
gulp = require 'gulp'
gutil = require 'gulp-util'
template = require 'gulp-template'

{tests} = require '../config/files'

gulp.task 'testem:config', ->

  context =
    serve: "#{tests.dest}/#{tests.bundled}"
    dest: tests.dest
    tests: "#{tests.dest}/tests.js"
    setup: "#{tests.dest}/setup.js"

  gulp.src('./gulp/config/testem.cson')
  .pipe(template(context))
  .pipe(cson())
  .pipe(gulp.dest tests.dest)
  .on('error', gutil.log)
  .on('error', gutil.beep)
