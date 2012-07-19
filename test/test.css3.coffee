
stylus = require "stylus"
path = require "path"
helper = require "./helper"

describe "css3", ->
  describe "boxSizing", ->
    it "should set all properties", (done) ->
      stylus("""
             @import "_css3"
             body
               boxSizing(border-box)
             """)
        .set("paths", [ "#{path.dirname __dirname}/foundation" ])
        .render (err, css) ->
          (err?).should.be.false
          css = helper.normalizeCss css
          css.should.eql "body { -webkit-box-sizing: border-box; -moz-box-sizing: border-box; box-sizing: border-box; }"
          done();
