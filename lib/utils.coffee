

# ----------------------------------------------------------------------------
# Like Object.assign

extend = exports.extend = (dest, sources...) ->
  for src in sources
    dest[k] = v for k, v of src
  dest


# ----------------------------------------------------------------------------
# Standalone version of Array.reduce for CS syntax
reduce = exports.reduce = (array, base, combine) ->
  [base, combine] = [array.shift(), base] unless combine?
  array.reduce combine, base


# ----------------------------------------------------------------------------
# Turn [ [k, v], [k, v], [k, v] ... ] into an object

dict = exports.dict = (items) ->
  return {} unless items

  reduce items, {}, (d, c) ->
    [k, v] = c
    d[k] = v
    d
