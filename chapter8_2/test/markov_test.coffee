vows = require('vows')
assert = require('assert')

markov = require('markov')

Markov = markov.Markov

vows.describe('Markov').addBatch({
  'A Markov': {
    topic: -> new Markov
    'should be a Markov': (mrkv) ->
      assert.instanceOf(mrkv, Markov)
    'can add_sentence': (mrkv) ->
      assert.equal(typeof mrkv.add_sentence, 'function')
    'should have a dic': (mrkv) ->
      assert.deepEqual(mrkv.dic, {})
    'should have a starts': (mrkv) ->
      assert.deepEqual(mrkv.starts, {})
    'After add_sentence': {
      topic: (mrkv) ->
        parts = { word: [ { surface: 'あたし', reading: 'あたし', pos: '名詞' },
                          { surface: 'は', reading: 'は', pos: '助詞' },
                          { surface: 'プログラム', reading: 'ぷろぐらむ', pos: '名詞' },
                          { surface: 'の', reading: 'の', pos: '助詞' },
                          { surface: '女の子', reading: 'おんなのこ', pos: '名詞' },
                          { surface: 'です', reading: 'です', pos: '助動詞' } ] }
        mrkv.add_sentence parts
        mrkv
      'should be a Markov': (mrkv) ->
        assert.instanceOf(mrkv, Markov)
      'should have a dic': (mrkv) ->
        assert.deepEqual(mrkv.dic, { あたし: { は: [ 'プログラム' ]},の: { 女の子: [ 'です' ]},は: { プログラム: [ 'の' ]}, 女の子: { です: [ '%END%' ]}, プログラム: { の: [ '女の子' ]}})
    }
  }
}).export(module)