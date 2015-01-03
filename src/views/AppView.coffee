class window.AppView extends Backbone.View

  template: _.template '
    <button class="hit-button button">Hit</button> <button class="stand-button button">Stand</button>
    <div class="winner"></div>
    <div class="player-hand-container"></div>
    <div class="dealer-hand-container"></div>
  '

  events:
    'click .hit-button': -> @model.get('playerHand').playerHit()
    'click .stand-button': -> @model.get('dealerHand').stand()

  initialize: ->
    @model.get('dealerHand').on 'stand': =>
      @$el.find('.button').attr('disabled', 'true')
    @model.get('playerHand').on 'bust': =>
      @$el.find('.button').attr('disabled', 'true')
      @model.winner()
      @renderWinner()
    @model.get('dealerHand').on 'stop': (hand) =>
      console.log hand
    @render()

  render: ->
    @$el.children().detach()
    @$el.html @template()
    @$('.player-hand-container').html new HandView(collection: @model.get 'playerHand').el
    @$('.dealer-hand-container').html new HandView(collection: @model.get 'dealerHand').el

  renderWinner: ->
    @$el.find('.winner').text("Winner is #{@model.get('winner')}")