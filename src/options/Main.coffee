import React, { Component } from 'react'
import L from 'react-dom-factories'
L_ = React.createElement
import '../App.css'

export default class Settings extends React.Component
  constructor:(props)->
    super(props)
    console.log 'set const',props
  render: ->
    L.div className:"settings",
      "Settings Page"

