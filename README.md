# Web Extension + React + Coffeescript + Hot reload = <3

libraries included:

 - coffeescript
 - less, css
 - react-router

Created using
[WebExtensionToolbox](https://github.com/webextension-toolbox/webextension-toolbox)

To install `npm install -g webextension-toolbox`
```
 webextension-toolbox dev --help
 webextension-toolbox dev chrome
 webextension-toolbox dev firefox
 webextension-toolbox dev opera
 webextension-toolbox dev edge
```

Browsers:
    -  Firefox >48

Also, webpack configured to serve for all ip, work with react-router and use CORS

Use this repo to set up your development for web apps in coffeescript.

# Why coffeescript?

because it's less verbose. I personally love to use this style of syntax:

```coffeescript
import React, { Component } from 'react'
import L from 'react-dom-factories'
L_ = React.createElement

Greeting = ()->
  L.div className:'greeting',
	L.h2 style:textAlign:'center', 'Hello World'

export default class App extends React.Component
  constructor:->
    super()
     
  render: ->
    L.div className:'app',
      L_ Greeting, null

ReactDOM.render <App />, document.getElementById 'root'

```
