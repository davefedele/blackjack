// Generated by CoffeeScript 1.8.0
var assert;

assert = chai.assert;

describe('AppView', function() {
  var deck, hand;
  deck = null;
  hand = null;
  return beforeEach(function() {
    deck = new Deck();
    return hand = deck.dealPlayer();
  });
});