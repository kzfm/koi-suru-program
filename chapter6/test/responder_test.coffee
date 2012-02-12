vows = require('vows')
assert = require('assert')
responder = require('responder')
dictionary = require('dictionary')

Dictionary = dictionary.Dictionary
WhatResponder = responder.WhatResponder
RandomResponder = responder.RandomResponder
PatternResponder = responder.PatternResponder

d = new Dictionary

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
      topic: -> new RandomResponder("kzfm", d)
      'should have a name': (responder) ->
        assert.equal(responder.name, "kzfm")
      'should be a `RandomResponder`': (responder) ->
        assert.instanceOf(responder, RandomResponder)
      'should have a dictionary': (responder) ->
        assert.instanceOf(responder.dictionary, Dictionary)
      'can response': (responder) ->
        assert.equal(typeof responder.response, 'function')
      'should returns a response in the random-list': (responder) ->
        assert.ok(
          responder.dictionary.random.indexOf(responder.response('質問')) > -1
        )
    }
  }

  'A PatternResponder': {
    'with no name': {
      topic: -> new PatternResponder
      'should have no name': (responder) ->
        assert.equal(responder.name, undefined)
    }
    'with a name': {
      topic: -> new PatternResponder("kzfm", d)
      'should have a name': (responder) ->
        assert.equal(responder.name, "kzfm")
      'should be a `PatternResponder`': (responder) ->
        assert.instanceOf(responder, PatternResponder)
      'should have a dictionary': (responder) ->
        assert.instanceOf(responder.dictionary, Dictionary)
      'can return randomWord': (responder) ->
        assert.ok(
          responder.dictionary.random.indexOf(responder.response('randomtest')) > -1
        )
    }
  }

}).export(module)