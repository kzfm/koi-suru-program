vows = require('vows')
assert = require('assert')

unmo = require('unmo')

Unmo = unmo.Unmo

vows.describe('Unmo').addBatch({
  'A Unmo': {
    'with no name': {
      topic: -> new Unmo
      'should have no name': (responder) ->
        assert.equal(responder.name, undefined)
    }
    'with a name': {
      topic: -> new Unmo "proto"
      'should have a name': (responder) ->
        assert.equal(responder.name, "proto")
      'should be a `Unmo`': (responder) ->
        assert.instanceOf(responder, Unmo)
      'can dialogue': (unmo) ->
        assert.equal(typeof unmo.dialogue, 'function')
      'should return a response in the response-list': (unmo) ->
        assert.ok(unmo.responder.responses.indexOf(unmo.dialogue('質問')) > -1)
      'should return a responder_name': (unmo) ->
        assert.equal(unmo.responder_name, "Random")
      'should return a name': (unmo) ->
        assert.equal(unmo.name, "proto")
    }
  }
}).export(module)