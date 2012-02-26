util = require('util')
rl = require('readline')
Unmo = require('unmo').Unmo

prompt = (unmo) -> unmo.name + ":" + unmo.emotion.mood + ":" + unmo.responder_name() + "> "

util.print("Unmo System prototype : proto")
proto = new Unmo "proto"

i = rl.createInterface(process.stdin, process.stdout, null)

qloop = (input) ->
  if input is ''
    i.close()
    process.stdin.destroy()
  else
    proto.dialogue input, (err, response) ->
      util.print(prompt(proto) + response)
      i.question "> ", qloop

i.question "> ", qloop
