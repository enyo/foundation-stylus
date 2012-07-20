
stylus = require "stylus"
path = require "path"
helper = require "./helper"

describe "grid", ->
  it "should render properly", (done) ->
    stylus("""
           @import "_settings"
           @import "_functions"
           @import "_mixins"
           @import "compass/css3"
           @import "grid"
           """)
      .set("paths", [ "#{path.dirname __dirname}/foundation" ])
      .render (err, css) ->
        # console.log err
        (err?).should.be.false
        # console.log css
        # css = helper.normalizeCss css
        # console.log css
        # css.should.eql "body { -webkit-box-sizing: border-box; -moz-box-sizing: border-box; box-sizing: border-box; }"
        done();

