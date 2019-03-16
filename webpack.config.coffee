path = require 'path'
webpack = require 'webpack'
webExtPlugin = require 'webpack-webextension-plugin'
CleanWebpackPlugin = require "clean-webpack-plugin"
WriteFilePlugin = require "write-file-webpack-plugin"
CopyWebpackPlugin = require "copy-webpack-plugin"

HtmlWebpackPlugin = require 'html-webpack-plugin'
ExtractTextPlugin = require 'extract-text-webpack-plugin'

fileExtensions = ["jpg", "jpeg", "png", "gif", "eot", "otf", "svg", "ttf", "woff", "woff2"]

isProduction = process.env.NODE_ENV is 'production'


module.exports =
  mode: process.env.NODE_ENV || "development",
  entry:
    popup: path.join(__dirname, "src", "popup", "popup.coffee"),
    options: path.join(__dirname, "src", "options", "options.coffee"),
    background: path.join(__dirname, "src", "background", "background.coffee")
    content: path.join(__dirname, "src", "content", "content.coffee")
  output:
    path: path.join(__dirname, "build"),
    filename: "[name].bundle.js"
  module:
    rules: [
      {
        test: /\.coffee$/,
        use: [
          {
            loader: 'babel-loader'
            options:
              presets: ['env', 'react']
          }
          'coffee-loader'
        ],
        exclude: /node_modules/
      },
      {
        test: /\.(css|less)$/,
        loader: ExtractTextPlugin.extract
          fallback: 'style-loader'
          use: ['css-loader','less-loader']
          publicPath: '/build'
        exclude: /node_modules/
      },
      {
        test: new RegExp('\.(' + fileExtensions.join('|') + ')$'),
        loader: "file-loader?name=[path][name].[ext]",
        exclude: /node_modules/
      },

    ]
  plugins: [
    new CleanWebpackPlugin(["build"]),
    new ExtractTextPlugin(
      filename: 'app.css'
      allChunks: true
    ),
    # The following lines insert a link to produced [module].bundle.js into a [module].html file
    new CopyWebpackPlugin([
      from: "src/manifest.json",
    ]),
    new HtmlWebpackPlugin({
      template: path.join(__dirname, "src", "popup.html"),
      filename: "popup.html",
      chunks: ["popup"]
    }),
    new HtmlWebpackPlugin({
      template: path.join(__dirname, "src", "options.html"),
      filename: "options.html",
      chunks: ["options"]
    }),
    new HtmlWebpackPlugin({
      template: path.join(__dirname, "src", "background.html"),
      filename: "background.html",
      chunks: ["background"]
    }),
    new WriteFilePlugin()
  ]

