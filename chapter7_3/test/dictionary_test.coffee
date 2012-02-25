vows = require('vows')
assert = require('assert')
dictionary = require('dictionary')

Dictionary  = dictionary.Dictionary
PatternItem = dictionary.PatternItem

vows.describe('Dictionary').addBatch({
  'A Dictinary': {
    topic: -> new Dictionary
    'should be a `Dictionary`': (dict) ->
      assert.instanceOf(dict, Dictionary)
    'should have a random_word': (dict) ->
      assert.ok(dict.random.indexOf('今日は寒いね') > -1)
    'should have a pattern': (dict) ->
      assert.equal(dict.pattern[0]['pattern'],"javascript")
    'shoud have a accesor(random)': (dict) ->
      assert.equal(typeof dict.random, 'object')
    'should have a accesor(pattern)': (dict) ->
      assert.equal(typeof dict.pattern, 'object')
    'can study': (dict) ->
      assert.equal(typeof dict.study, 'function')
    'can study_random': (dict) ->
      assert.equal(typeof dict.study_random, 'function')
    'can study_pattern': (dict) ->
      assert.equal(typeof dict.study_pattern, 'function')
    'can learn a input': (dict) ->
      dict.study_random("インフルうつすぞ")
      assert.ok(dict.random.indexOf('インフルうつすぞ') > -1)
  }
  'A PatternItem': {
    topic: -> new PatternItem("-10##javascript", "3##coffee使えよ|6##Node.jsサイコー")
    'should be a `PatternItem`': (ptn) ->
      assert.instanceOf(ptn, PatternItem)
    'should have a modify_number': (ptn) ->
      assert.equal(ptn.modify, -10)
    'should have a response pattern': (ptn) ->
      assert.equal(ptn.pattern, "javascript")
    'can check suitable conditon(0)': (ptn) ->
      assert.equal(ptn.issuitable(0,5), true)
    'can check suitable pos conditon(need < mood)': (ptn) ->
      assert.equal(ptn.issuitable(3,5), true)
    'can check suitable pos conditon(need > mood)': (ptn) ->
      assert.equal(ptn.issuitable(7,5), false)
    'can check suitable neg conditon(need < mood)': (ptn) ->
      assert.equal(ptn.issuitable(-2,5), false)
    'can check suitable neg conditon(need > mood)': (ptn) ->
      assert.equal(ptn.issuitable(-2,-3), true)
    'can add_phrase': (dict) ->
      assert.equal(typeof dict.add_phrase, 'function')
    'can make_line': (dict) ->
      assert.equal(typeof dict.make_line, 'function')
    'make_line should return text': (dict) ->
      assert.equal(dict.make_line(), '-10##javascript\0113##coffee使えよ|6##Node.jsサイコー')
    'After adding phrase': {
      'can add_phrase': (dict) ->
        nphrase = "フレーズ足した"
        dict.add_phrase(nphrase)
        assert.equal(dict.phrases.length,3)
    }
  }
}).export(module)