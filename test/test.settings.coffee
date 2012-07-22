
stylus = require "stylus"
path = require "path"
helper = require "./helper"

describe "settings", ->
  it "should compile", (done) ->
    stylus("""
           @import "_settings"
           """)
      .set("paths", [ "#{path.dirname __dirname}/foundation" ])
      .render (err, css) ->
        (err?).should.be.false
        done();
  it "shouldn't overwrite already existing properties", (done) ->
    stylus("""
           $mainColor = #f00
           @import "_settings"
           body {
             background $mainColor
             color $txtColor
           }
           """)
      .set("paths", [ "#{path.dirname __dirname}/foundation" ])
      .render (err, css) ->
        (err?).should.be.false
        css = helper.normalizeCss css
        css.should.eql 'body { background: #f00; color: #222; }'
        done();
