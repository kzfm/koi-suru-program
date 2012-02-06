vows = require('vows')
assert = require('assert')

responder = require('responder')

WhatResponder = responder.WhatResponder
RandomResponder = responder.RandomResponder

vows.describe('Responder').addBatch({
  'A WhatResponder': {
    'with no name': {
      topic: -> new WhatResponder
      'should have no name': (responder) ->
        assert.equal(responder.name, undefined)
    }
    'with a name': {
      topic: -> new WhatResponder "kzfm"
      'should have a name': (responder) ->
        assert.equal(responder.name, "kzfm")
      'should be a `WhatResponder`': (responder) ->
        assert.instanceOf(responder, WhatResponder)
      'shoud returns a `Question`': (responder) ->
        assert.equal(responder.response('質問'), '質問ってなに？')
    }
  }

  'A RandomResponder': {
    'with no name': {
      topic: -> new RandomResponder
      'should have no name': (responder) ->
        assert.equal(responder.name, undefined)
    }
    'with a name': {
      topic: -> new RandomResponder "kzfm"
      'should have a name': (responder) ->
        assert.equal(responder.name, "kzfm")
      'should be a `RandomResponder`': (responder) ->
        assert.instanceOf(responder, RandomResponder)
      'shoud returns a response in the response-list': (responder) ->
        assert.ok(responder.responses.indexOf(responder.response('質問')) > -1)
    }
  }

}).export(module)