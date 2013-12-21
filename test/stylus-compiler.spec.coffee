chai    = require 'chai'
fibrous = require 'fibrous'
stylus  = require '../stylus-compiler'

expect = chai.expect

SOURCE = """
body
  font 12px Helvetica, Arial, sans-serif
"""

describe 'stylus-compiler', ->
  describe '::fromSource', ->
    it 'compiles', fibrous ->
      results = stylus.sync.fromSource SOURCE
      expect(results).to.equal 'body {\n  font: 12px Helvetica, Arial, sans-serif;\n}\n'

    it 'compiles with options', fibrous ->
      results = stylus.sync.fromSource SOURCE, compress: yes
      expect(results).to.equal 'body{font:12px Helvetica,Arial,sans-serif}\n'

  describe '::fromFile', ->
    it 'compiles', fibrous ->
      results = stylus.sync.fromFile "#{__dirname}/fixture.styl"
      expect(results).to.equal 'body {\n  font: 12px Helvetica, Arial, sans-serif;\n}\n'

    it 'compiles without options', fibrous ->
      results = stylus.sync.fromFile "#{__dirname}/fixture.styl", compress: yes
      expect(results).to.equal 'body{font:12px Helvetica,Arial,sans-serif}\n'
