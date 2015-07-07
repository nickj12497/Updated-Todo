# Dependencies
gulp = require('gulp')
webpack = require('gulp-webpack')

webpackConfig = require './webpack.config.coffee'

# Watcher
gulp.task 'watch', ['build'], (done) ->
  gulp.watch './src/**/*.jade', ['jade']

  # Webpack
  gulp.watch '.src/**/*.coffee', ['webpack']
  gulp.watch '.src/**/*.sass', ['webpack']

# Build
gulp.task 'build', ['webpack', 'jade']

# Jade
gulp.task 'jade', (done) ->
  gulp.src './src/*.jade', base: 'src'
  .pipe gulp.dest './dist'

gulp.task 'webpack', (done) ->
  webpack webpackConfig, (error, stats) ->
    if error
      console.log "[ERROR] ", error

  done()