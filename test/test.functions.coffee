
stylus = require "stylus"
path = require "path"
helper = require "./helper"

describe "functions", ->
  describe "convertNumberToWord()", ->
    it "should properly convert numbers to words", (done) ->
      stylus("""
             @import "_functions"
             convertNumberToWord(1)
             convertNumberToWord(6)
             convertNumberToWord(12)
             convertNumberToWord(24)
             """)
        .set("paths", [ "#{path.dirname __dirname}/foundation" ])
        .render (err, css) ->
          (err?).should.be.false
          css.should.eql "one\nsix\ntwelve\ntwentyfour\n"
          done();
    it "should error on invalid numbers (0)", (done) ->
      stylus("""
             @import "_functions"
             convertNumberToWord(0)
             """)
        .set("paths", [ "#{path.dirname __dirname}/foundation" ])
        .render (err, css) ->
          (err?).should.be.true
          done();
    it "should error on invalid numbers (25)", (done) ->
      stylus("""
             @import "_functions"
             convertNumberToWord(25)
             """)
        .set("paths", [ "#{path.dirname __dirname}/foundation" ])
        .render (err, css) ->
          (err?).should.be.true
          done();

  describe "gridCalc()", ->
    it "should return the percentage", (done) ->
      stylus("""
             @import "_functions"
             body
               width: gridCalc(2, 4)
               width: gridCalc(1, 3)
               width: gridCalc(1, 1)
             """)
        .set("paths", [ "#{path.dirname __dirname}/foundation" ])
        .render (err, css) ->
          (err?).should.be.false
          css = helper.normalizeCss css
          css.should.eql "body { width: 50%; width: 33.333333333333336%; width: 100%; }"
          done();
