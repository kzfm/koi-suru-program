vows = require('vows')
assert = require('assert')
http = require('http')
morph = require('morph')
Morph = morph.Morph

vows.describe('Morph').addBatch({
  'A Morph': {
    topic: -> new Morph
    'should be a `Morph`': (morph) ->
      assert.instanceOf(morph, Morph)
    'can analyze': (morph) ->
      assert.equal(typeof morph.analyze, "function")
    'After analyze': {
      topic: (morph) -> morph.analyze('桜', this.callback)
      'should return a object': (err, result) ->
        assert.isObject(result)
      'returned object have a word': (err, result) ->
        assert.equal(result.word.surface, "桜")
    }
    'After analyze a sentence': {
      topic: (morph) -> morph.analyze('あたしはプログラムの女の子です', this.callback)
      'should return a object': (err, result) ->
        assert.isObject(result)
    }
  }
}).export(module)