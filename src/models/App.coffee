class window.App extends Backbone.Model
  initialize: ->
    @set 'deck', deck = new Deck()
    @set 'playerHand', deck.dealPlayer()
    @set 'dealerHand', deck.dealDealer()

  winner: ->
    playerHand = @get('playerHand').correctScore()
    dealerHand = @get('dealerHand').correctScore()

    if dealerHand > 21 or dealerHand < playerHand < 21 or @get('playerHand').hasBlackjack()
      winner = "player"
    else if playerHand is dealerHand
      winner = "push"
    else
      winner = "dealer"
    @set 'winner', winner
