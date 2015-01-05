assert = chai.assert

describe 'AppView', ->
  deck = null
  hand = null

  beforeEach ->
    deck = new Deck()
    hand = deck.dealPlayer()

  # describe 'something', ->
    # xit 'should show up on the screen', ->