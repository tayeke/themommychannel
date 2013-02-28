class MommyChannel
  constructor: (_options = {}) ->
    @[key] = val for key, val of _options 
  init: ->
    console.log 'mommychannel app ready'

@mommyChannel = new MommyChannel(globals)

$(mommyChannel.init)
