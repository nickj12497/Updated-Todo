# Dependencies
gulp = require('gulp')
webpack = require('webpack')
jade = require('gulp-jade')

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
    .pipe jade {}
    .pipe gulp.dest './dist'
#  gulp.src './src/*.jade', base: 'src'
#    .pipe jade pretty: true, locals: { web: true }
#    .pipe gulp.dest './dist'

gulp.task 'webpack', (done) ->
  webpack webpackConfig, (error, stats) ->
    if error
      console.log "[ERROR] ", error

  done()


###
So you're not ggetting anything different because all you're doing is taking the input and putting it into ./dist.

If you look at my code, you'll see after gulp.src is a line like this:
.pipe jade
Do I need the pretty: true {web: true}?

Not necessaarily. Not for now.Save this and gulp jade
jade is not defined. npm install gulp-jade?
###