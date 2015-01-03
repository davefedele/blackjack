class window.Hand extends Backbone.Collection
  model: Card

  initialize: (array, @deck, @isDealer) ->

  hit: ->
    card = @deck.pop()
    @add(card)
    card

  playerHit: ->
    @hit()
    if @correctScore() > 21
      @trigger 'bust', @

  dealerHit: ->
    if @correctScore() < 17
      @hit()
      @dealerHit()
    else
      @trigger 'stop', @

  stand: ->
    @trigger 'stand', @
    @at(0).flip()
    @dealerHit()

  hasAce: -> @reduce (memo, card) ->
    memo or card.get('value') is 1
  , 0

  minScore: -> @reduce (score, card) ->
    score + if card.get 'revealed' then card.get 'value' else 0
  , 0

  scores: ->
    [@minScore(), @minScore() + 10 * @hasAce()]

  correctScore: ->
    scores = @scores()
    if @isDealer
      if not @at(0).get('revealed')
        if @hasAce()
          if @at(1).get('value') is 1
            11
          else
            @at(1).get 'value'
        else
          @at(1).get 'value'
    if @hasBlackjack()
      21
    else
      if @hasAce() and scores[0] <= 10 then scores[1] else scores[0]

  hasBlackjack: ->
    isBlackjack = @scores()[0] is 21 or @scores()[1] is 21
    if isBlackjack then yes else no
