# Config:
# 
#   * `save-on-blur` - `Array` of `String`
#     If `true`, everything matches.
# 
stratus  = require 'stratus'
bundles  = window.data.config["save-on-blur"]
bundles ?= true

if bundles == true
  MATCH = /./
else
  MATCH = new RegExp "^#{ bundles.join("|") }\\b"

stratus.on "fractus.blur", (editor) ->
  syntax = editor.syntax?.name
  return unless syntax && MATCH.test(syntax)
  editor.save()
