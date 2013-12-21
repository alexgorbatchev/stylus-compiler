fs     = require 'fs'
path   = require 'path'
stylus = require 'stylus'

module.exports = compiler =
  fromSource: (src, opts..., callback) ->
    opts = opts[0] or {}
    opts.filename ?= 'stylus-compiler'

    stylus.render src, opts, callback

  fromFile: (filepath, opts..., callback) ->
    opts = opts[0] or {}
    opts.filename ?= filepath

    fs.readFile filepath, 'utf8', (err, src) =>
      return callback err if err?
      compiler.fromSource src, opts, callback
