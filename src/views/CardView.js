// Generated by CoffeeScript 1.8.0
var __hasProp = {}.hasOwnProperty,
  __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

window.CardView = (function(_super) {
  __extends(CardView, _super);

  function CardView() {
    return CardView.__super__.constructor.apply(this, arguments);
  }

  CardView.prototype.className = 'card';

  CardView.prototype.template = _.template('');

  CardView.prototype.initialize = function() {
    return this.render();
  };

  CardView.prototype.render = function() {
    var rankName, suitName;
    this.$el.children().detach();
    this.$el.html(this.template(this.model.attributes));
    rankName = this.model.get('rankName');
    suitName = this.model.get('suitName');
    if (this.model.get('revealed')) {
      this.$el.css('background-image', 'url(./img/cards/' + rankName + '-' + suitName + '.png)');
    }
    if (!this.model.get('revealed')) {
      return this.$el.addClass('covered');
    }
  };

  return CardView;

})(Backbone.View);
