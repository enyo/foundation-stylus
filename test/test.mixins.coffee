
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
  describe "defaultFontFamily()", ->
    it "should return a valid font-family definition", (done) ->
      stylus("""
             @import "_mixins"
             body
               defaultFontFamily()
             """)
        .set("paths", [ "#{path.dirname __dirname}/foundation" ])
        .render (err, css) ->
          (err?).should.be.false
          css = helper.normalizeCss css
          css.should.eql 'body { font-family: "Helvetica Neue", "HelveticaNeue", Helvetica, Arial, "Lucida Grande", sans-serif; }'
          done();
  describe "cssTriangle()", ->
    it "should return a valid markup", (done) ->
      stylus("""
             @import "_mixins"
             body
               cssTriangle(10px, #008000, top)
             """)
        .set("paths", [ "#{path.dirname __dirname}/foundation" ])
        .render (err, css) ->
          (err?).should.be.false
          css = helper.normalizeCss css
          css.should.eql 'body { content: ""; display: block; width: 0; height: 0; border: solid 10px; border-color: #008000 transparent transparent transparent; }'
          done();
