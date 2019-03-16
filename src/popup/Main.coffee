import React, { Component } from 'react'
import L from 'react-dom-factories'
L_ = React.createElement

export default class Popup extends React.Component
  constructor:(props)->
    super(props)
    console.log 'Popup props', props
  render: ->
    L.div className:"Popup",
      "Poph!"

