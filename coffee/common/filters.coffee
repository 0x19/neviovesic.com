app.filter 'toRange', ->
  (input) ->
    switch (input.length)
      when 1
        [lowBound, highBound] = [0, +input[0] - 1]
      when 2
        [lowBound, highBound] = [+input[0], +input[1]]
    i = lowBound
    result = []
    while i <= highBound
      result.push i
      i++
    result