util = require('util')
rl = require('readline')
unmo = require('unmo')

prompt = (unmo) -> unmo.name + ":" + unmo.responder_name() + "> "

util.print("Unmo System prototype : proto")
proto = new unmo.Unmo "proto"

i = rl.createInterface(process.stdin, process.stdout, null)

qloop = (input) ->
  if input is ''
    i.close()
    process.stdin.destroy()
  else
    response = proto.dialogue input
    util.print(prompt(proto) + response)
    i.question "> ", qloop

i.question "> ", qloop
