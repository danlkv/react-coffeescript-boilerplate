import React, { Component } from 'react'
import ReactDOM from 'react-dom'
import Main from './Main.coffee'
import '../../icons/webext-48.png'

import '../App.css'

if module.hot
  module.hot.accept './Main.coffee', () =>
    NextApp = require('./Main.coffee').default
    ReactDOM.render <NextApp />, document.getElementById('root')

ReactDOM.render <Main />, document.getElementById 'root'
