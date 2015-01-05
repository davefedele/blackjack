// Generated by CoffeeScript 1.8.0
var __hasProp = {}.hasOwnProperty,
  __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

window.Hand = (function(_super) {
  __extends(Hand, _super);

  function Hand() {
    return Hand.__super__.constructor.apply(this, arguments);
  }

  Hand.prototype.model = Card;

  Hand.prototype.initialize = function(array, deck, isDealer) {
    this.deck = deck;
    this.isDealer = isDealer;
  };

  Hand.prototype.hit = function() {
    var card;
    card = this.deck.pop();
    this.add(card);
    return card;
  };

  Hand.prototype.playerHit = function() {
    this.hit();
    if (this.correctScore() > 21) {
      return this.trigger('bust', this);
    }
  };

  Hand.prototype.dealerHit = function() {
    if (this.correctScore() < 17) {
      this.hit();
      return this.dealerHit();
    } else {
      return this.trigger('stop', this);
    }
  };

  Hand.prototype.stand = function() {
    this.trigger('stand', this);
    this.at(0).flip();
    return this.dealerHit();
  };

  Hand.prototype.hasAce = function() {
    return this.reduce(function(memo, card) {
      return memo || card.get('value') === 1;
    }, 0);
  };

  Hand.prototype.minScore = function() {
    return this.reduce(function(score, card) {
      return score + (card.get('revealed') ? card.get('value') : 0);
    }, 0);
  };

  Hand.prototype.scores = function() {
    return [this.minScore(), this.minScore() + 10 * this.hasAce()];
  };

  Hand.prototype.correctScore = function() {
    var scores;
    scores = this.scores();
    if (this.isDealer) {
      if (!this.at(0).get('revealed')) {
        if (this.hasAce()) {
          if (this.at(1).get('value') === 1) {
            11;
          } else {
            this.at(1).get('value');
          }
        } else {
          this.at(1).get('value');
        }
      }
    }
    if (this.hasBlackjack()) {
      return 21;
    } else {
      if (this.hasAce() && scores[0] <= 10) {
        return scores[1];
      } else {
        return scores[0];
      }
    }
  };

  Hand.prototype.hasBlackjack = function() {
    var isBlackjack;
    isBlackjack = this.scores()[0] === 21 || this.scores()[1] === 21;
    if (isBlackjack) {
      return true;
    } else {
      return false;
    }
  };

  return Hand;

})(Backbone.Collection);
