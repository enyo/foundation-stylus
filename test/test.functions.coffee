
stylus = require "stylus"
path = require "path"

describe "functions", ->
  describe "convertNumberToWord()", ->
    it "should properly convert numbers to words", (done) ->
      stylus("""
             @import "_functions"
             convertNumberToWord(0)
             convertNumberToWord(1)
             convertNumberToWord(6)
             convertNumberToWord(12)
             convertNumberToWord(24)
             convertNumberToWord(25)
             """)
        .set("paths", [ "#{path.dirname __dirname}/foundation" ])
        .render (err, css) ->
          (err?).should.be.false
          css.should.eql "invalid\none\nsix\ntwelve\ntwentyfour\ninvalid\n"
          done();
