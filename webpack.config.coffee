webpack = require('webpack')

module.exports =
    entry: 'src/todo',
    output:
        path: './dist',
        filename: "todo.js"
    module:
        loaders: [
             test: /\.jade$/, loader: 'jade' 
            ,
             test: /\.coffee$/, loader: 'coffee'
            ,
             test: /\.json$/, loader: 'html?name=assets/data/[name].[ext]'
            ,
             test: /\.sass$/, loader: 'sass'
        ]