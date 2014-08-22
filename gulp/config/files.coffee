pkg = require '../../package.json'

dest = './dist'
src = './src'
tests = './tests'

module.exports =
  root:
    dest: dest
    src: src
    tests: tests

  scripts:
    namespace: ''
    src: ["#{src}/scripts/app.coffee"]
    dest: "#{dest}/js"
    bundled: "#{pkg.name}.js"
    minified: "#{pkg.name}.min.js"

  styles:
    src: ["#{src}/styles/**/*.{sass,scss}", "#{src}/styles/**/*.css"]
    dest: "#{dest}/css"
    bundled: "#{pkg.name}.css"
    minified: "#{pkg.name}.min.css"

  tests:
    src: ["#{tests}/**/*.coffee", "!#{tests}/setup/**"]
    setup: ["#{tests}/setup/**/*.coffee"]
    dest: "#{tests}/build/"
    bundled: 'tests.bundled.js'
