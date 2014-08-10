pkg = require "../../package.json"

module.exports =
  scripts:
    namespace: 'osg.testing'
    src: ['./src/scripts/app.coffee']
    dest: './dist/js'
    bundled: "#{pkg.name}.js"
    minified: "#{pkg.name}.min.js"

  tests:
    src: ['./tests/**/*.coffee', '!./tests/setup/**']
    setup: ['./tests/setup/**/*.coffee']
    dest: './tests/build/'
    bundled: 'tests.bundled.js'
