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
    }
  }
}).export(module)