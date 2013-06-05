path   = require 'path'
fs     = require 'fs'
stylus = require 'stylus'

module.exports = compiler =
  fromSource : (src, filename, debug, callback) ->
    opts =
      compress : !debug
      filename : filename

    stylus.render src, opts, callback

  fromFile : (filepath, debug, callback) ->
    fs.readFile filepath, 'utf8', (err, src) ->
      return callback err if err?
      compiler.fromSource src, filepath, debug, callback
