# Dependencies
gulp = require('gulp')
webpack = require('webpack')
jade = require('gulp-jade')
gutil = require('gulp-util')

webpackConfig = require './webpack.config.coffee'

# Watcher
gulp.task 'watch', ['build'], (done) ->
  gulp.watch './src/**/*.jade', ['jade']

  # Webpack
  gulp.watch './src/**/*.coffee', ['webpack']
  gulp.watch './src/**/*.sass', ['webpack']

# Build
gulp.task 'build', ['webpack', 'jade']

# Jade
gulp.task 'jade', (done) ->
  gulp.src './src/*.jade', base: 'src'
    .pipe jade {}
    .pipe gulp.dest './dist'


gulp.task 'webpack', (done) ->
  webpack webpackConfig, (error, stats) ->
    if error
      throw new gutil.PluginError 'webpack', error

    gutil.log '[webpack]', stats.toString()

  done()
