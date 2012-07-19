


exports.normalizeCss = (css) ->
  css.replace(/(\s+)/g, " ").replace(/^\s*|\s*$/g, "")
