
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

    describe "box-shadow", ->
      it "should set default shadow", (done) ->
        stylus("""
               @import "css3"
               body
                 box-shadow() // should print default shadow
                 box-shadow: '1px 3px 5px #000', '1px 2px'
                 box-shadow: default, '1px 2px'
               """)
          .set("paths", [ "#{path.dirname __dirname}/foundation/compass" ])
          .render (err, css) ->
            (err?).should.be.false
            css = helper.normalizeCss css
            css.should.eql "body { -moz-box-shadow: 0px 0px 5px #333; -webkit-box-shadow: 0px 0px 5px #333; box-shadow: 0px 0px 5px #333; -moz-box-shadow: 1px 3px 5px #000, 1px 2px; -webkit-box-shadow: 1px 3px 5px #000, 1px 2px; box-shadow: 1px 3px 5px #000, 1px 2px; -moz-box-shadow: 0px 0px 5px #333, 1px 2px; -webkit-box-shadow: 0px 0px 5px #333, 1px 2px; box-shadow: 0px 0px 5px #333, 1px 2px; }"
            done();
