
stylus = require "stylus"
path = require "path"
helper = require "./helper"

describe "semantic-grid", ->
  it "should compile", (done) ->
    stylus("""
            @import "_settings"
            @import "_functions"
            @import "_semantic-grid"
            """)
      .set("paths", [ "#{path.dirname __dirname}/foundation" ])
      .render (err, css) ->
        (err?).should.be.false
        done();

  describe "outerRow()", ->
    it "should properly return content", (done) ->
      stylus("""
            @import "_settings"
            @import "_functions"
            @import "_semantic-grid"
            .test
              outerRow()
            """)
      .set("paths", [ "#{path.dirname __dirname}/foundation" ])
      .render (err, css) ->
        (err?).should.be.false
        css = helper.normalizeCss css
        css.should.eql '.test { width: 1000px; max-width: 100%; min-width: 768px; margin: 0 auto; *zoom: 1; } .test:before, .test:after { content: ""; display: table; } .test:after { clear: both; }'
        done();