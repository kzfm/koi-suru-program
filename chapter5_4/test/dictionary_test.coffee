vows = require('vows')
assert = require('assert')

dictionary = require('dictionary')

Dictionary = dictionary.Dictionary

vows.describe('Dictionary').addBatch({
  'A Dictinary': {
    topic: -> new Dictionary
    'should be a `Dictionary`': (dict) ->
      assert.instanceOf(dict, Dictionary)
    'should have a random_word': (dict) ->
      assert.ok(dict.random.indexOf('今日は寒いね') > -1)
    'should have a pattern': (dict) ->
      assert.deepEqual(dict.pattern,[{pattern:'java',phrases:'coffee'}])
    'shoud have a accesor(random)': (dict) ->
        assert.equal(typeof dict.random, 'object')
    'should have a accesor(pattern)': (dict) ->
        assert.equal(typeof dict.pattern, 'object')
  }
}).export(module)