vows = require('vows')
assert = require('assert')
responder = require('responder')
dictionary = require('dictionary')

Dictionary = dictionary.Dictionary
WhatResponder = responder.WhatResponder
RandomResponder = responder.RandomResponder
PatternResponder = responder.PatternResponder
TemplateResponder = responder.TemplateResponder

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
      'should returns a response in the random-list': (responder) ->
        assert.ok(
          responder.dictionary.random.indexOf(responder.response('質問')) > -1
        )
    }
  }

  'A TemplateResponder': {
    'with no name': {
      topic: -> new TemplateResponder
      'should have no name': (responder) ->
        assert.equal(responder.name, undefined)
    }
    'with a name': {
      topic: -> new TemplateResponder("kzfm", d)
      'should have a name': (responder) ->
        assert.equal(responder.name, "kzfm")
      'should be a `TemplateResponder`': (responder) ->
        assert.instanceOf(responder, TemplateResponder)
      'can response': (responder) ->
        assert.equal(typeof responder.response, 'function')
      'should return a Text': (responder) ->
        parts = { word:
                  [ { surface: 'あたし', reading: 'あたし', pos: '名詞' },
                    { surface: 'は', reading: 'は', pos: '助詞' },
                    { surface: 'プログラム', reading: 'ぷろぐらむ', pos: '名詞' }
                  ]}
        assert.isString(responder.response('あたしはプログラム', parts, 0))
    }
  }

}).export(module)