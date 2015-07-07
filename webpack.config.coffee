webpack = require('webpack')

module.exports =
  entry: './src/todo'
  output:
    path: './dist'
    filename: "todo.js"
  module:
    loaders: [
      test: /\.jade$/, loader: 'jade'
    ,
      test: /\.coffee$/, loader: 'coffee'
    ,
      test: /\.sass$/, loader: 'style!css!sass?indentedSyntax&sourceMap'
    ]
  resolve:
    moduleDirectories: ['src', 'node_modules', 'bower_components']
    extensions: ['', '.coffee', '.sass']