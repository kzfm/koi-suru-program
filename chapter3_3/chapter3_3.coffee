rl = require('readline')
util = require('util')

class Responder
 constructor: (@name) ->
 response: (input) -> input + 'ってなに？'

class Unmo
 constructor: (@name) ->
   @responder = new Responder('what')
   @responder_name = @responder.name
 dialogue: (input) -> @responder.response(input)

util.print "Unmo System prototype : proto"

u = new Unmo('proto')

i = rl.createInterface(process.stdin, process.stdout, null)

qloop = (answer) ->
  if answer is ''
    i.close()
    process.stdin.destroy()
  else
    util.print u.dialogue answer
    i.question "> ", qloop

i.question "> ", qloop
