vows = require('vows')
assert = require('assert')

unmo = require('unmo')
emotion = require('emotion')

Unmo = unmo.Unmo
Emotion = emotion.Emotion

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
      'should have a `Emotion`': (unmo) ->
        assert.instanceOf(unmo.emotion, Emotion)
      'can emotional adjust_mood': (unmo) ->
        assert.equal(typeof unmo.emotion.adjust_mood, 'function')
      'can emotional adjust': (unmo) ->
        unmo.emotion.adjust_mood(10)
        assert.equal(unmo.emotion.mood, 10)
    }
  }
  'A Emotion': {
    topic: -> new Emotion
    'should be a `Emotion`': (em) ->
      assert.instanceOf(em, Emotion)
    'should have a mood': (em) ->
      assert.equal(em.mood, 0)
    'can update': (em) ->
      assert.equal(typeof em.update, 'function')
    'can adjust mood': (em) ->
      em.adjust_mood(5)
      assert.equal(em.mood, 5)
    'should have a max_mood': (em) ->
      em.adjust_mood(20)
      assert.equal(em.mood, 15)
    'can have a minimum_mood': (em) ->
      em.adjust_mood(-30)
      assert.equal(em.mood, -15)
  }
  }).export(module)