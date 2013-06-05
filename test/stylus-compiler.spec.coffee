chai    = require 'chai'
stylus  = require '../stylus-compiler'

expect = chai.expect

describe 'stylus-compiler', ->
  describe '.fromSource', ->
    it 'compiles with debug', (done) ->
      stylus.fromSource "body\n  font 12px Helvetica, Arial, sans-serif", "filename.styl", true, (err, css) ->
        expect(err).to.be.null
        expect(css).to.equal 'body {\n  font: 12px Helvetica, Arial, sans-serif;\n}\n'
        done()

    it 'compiles without debug', (done) ->
      stylus.fromSource "body\n  font 12px Helvetica, Arial, sans-serif", "filename.styl", false, (err, css) ->
        expect(err).to.be.null
        expect(css).to.equal 'body{font:12px Helvetica,Arial,sans-serif}\n'
        done()

  describe '.fromFile', ->
    it 'compiles with debug', (done) ->
      stylus.fromFile "#{__dirname}/fixture.styl", true, (err, css) ->
        expect(err).to.be.null
        expect(css).to.equal 'body {\n  font: 12px Helvetica, Arial, sans-serif;\n}\n'
        done()

    it 'compiles without debug', (done) ->
      stylus.fromFile "#{__dirname}/fixture.styl", false, (err, css) ->
        expect(err).to.be.null
        expect(css).to.equal 'body{font:12px Helvetica,Arial,sans-serif}\n'
        done()

