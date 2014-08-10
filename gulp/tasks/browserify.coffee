_ = require 'lodash'
browserify = require 'browserify'
coffeeify = require 'coffeeify'
exorcist = require 'exorcist'
fs = require 'fs-extra'
gulp = require 'gulp'
gutil = require 'gulp-util'
source = require 'vinyl-source-stream'


# Boundles the target source code using browserify.
# It also generates the sourcemap in a different file.
#
# target - A {Object} that has the options for browserify.
#          It has the following properties.
#            src: An {Array} of strings with the entry files of the bundle.
#            [namespace]: A {String} name to generate a UMD bundle. This
#                         property is optional, if is not provided, the
#                         UMD bundle will not be generated.
#                         (See --standalone option of browserify)
#            dest: A {String} path where the output file will be placed.
#            bundled: A {String} name of the output file.
bundle = (target) ->
  sourcemap = "#{target.dest}/#{target.bundled}.map"

  # ensures the existence of the destination directory
  # if the directory doesn't exist, exorcist fails.
  fs.ensureDirSync target.dest

  browserify(entries: target.src, extensions: ['.coffee'])
  .transform(coffeeify)
  .bundle(debug: true, standalone: target.namespace)
  .on('error', gutil.log)
  .on('error', gutil.beep)
  .pipe(exorcist(sourcemap))
  .pipe(source(target.bundled))
  .pipe(gulp.dest(target.dest))

# bundles the app source code.
gulp.task 'browserify:scripts', ->
  {scripts} = require '../config/files'
  target = _.clone scripts, true
  bundle target

# bundles the tests source code.
gulp.task 'browserify:tests', ->
  {tests} = require '../config/files'
  target = _.clone tests, true
  target.src = ["#{tests.dest}/tests.js", "#{tests.dest}/setup.js"]
  bundle target
