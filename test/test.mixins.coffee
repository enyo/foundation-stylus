
stylus = require "stylus"
path = require "path"
helper = require "./helper"

describe "mixins", ->
  describe "fontSize()", ->
    it "should return the right font size", (done) ->
      stylus("""
             @import "_mixins"
             body
               fontSize(10)
               fontSize(10, true)
             """)
        .set("paths", [ "#{path.dirname __dirname}/foundation" ])
        .render (err, css) ->
          (err?).should.be.false
          css = helper.normalizeCss css
          css.should.eql "body { font-size: 10px; font-size: 1rem; font-size: 10px !important; font-size: 1rem !important; }"
          done();
