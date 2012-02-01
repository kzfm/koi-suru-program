(function() {
  var RandomResponder, WhatResponder, assert, responder, vows;

  vows = require('vows');

  assert = require('assert');

  responder = require('responder');

  WhatResponder = responder.WhatResponder;

  RandomResponder = responder.RandomResponder;

  vows.describe('Responder').addBatch({
    'A WhatResponder': {
      topic: new WhatResponder,
      'returns a `WhatResponder`': function(responder) {
        return assert.instanceOf(responder, WhatResponder);
      },
      'returns a `Question`': function(responder) {
        return assert.equal(responder.response('質問'), '質問ってなに？');
      }
    }
  })["export"](module);

}).call(this);
