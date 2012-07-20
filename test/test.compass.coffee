
stylus = require "stylus"
path = require "path"
helper = require "./helper"

describe "compass", ->
  describe "css3", ->
    describe "box-sizing", ->
      it "should set all properties", (done) ->
        stylus("""
               @import "css3"
               body
                 box-sizing border-box
               """)
          .set("paths", [ "#{path.dirname __dirname}/foundation/compass" ])
          .render (err, css) ->
            (err?).should.be.false
            css = helper.normalizeCss css
            css.should.eql "body { -moz-box-sizing: border-box; -webkit-box-sizing: border-box; box-sizing: border-box; }"
            done();
