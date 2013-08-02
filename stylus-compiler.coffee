fs     = require 'fs'
path   = require 'path'
stylus = require 'stylus'
eco    = require 'eco'

module.exports = compiler =
  fromSource : (src, filename, debug, callback) ->
    src = eco.render src, @

    opts =
      compress : !debug
      filename : filename

    stylus.render src, opts, callback

  fromFile : (filepath, debug, callback) ->
    fs.readFile filepath, 'utf8', (err, src) =>
      return callback err if err?
      compiler.fromSource.apply @, [ src, filepath, debug, callback ]
