chai.should()

describe 'deck', ->
  deck = null
  hand = null

  beforeEach ->
    deck = new Deck()

  describe 'hit', ->
    it 'should give the last card from the deck', ->
      hand = deck.dealPlayer()
      deck.length.should.equal 50
      deck.last().should.equal hand.hit()
      deck.length.should.equal 49

  describe 'playerHit', ->
    it 'should give a new card', ->
      hand = deck.dealPlayer()
      hand.playerHit();
      hand.models.length.should.equal 3
    it 'should trigger a bust if hit score exceeds 21', ->
      hand=deck.dealPlayer()
      hand.hit()
      hand.hit()
      hand.should.trigger 'bust'


  describe 'dealerHit', ->
    it 'should hit if the dealer\s score is below 17', ->
      hand = deck.dealDealer()
      while hand.correctScore() < 17
        hand.dealerHit();
      hand.correctScore().should.to.be.above 16
    it 'should trigger a stop event when done hitting', ->
      hand = deck.dealDealer()
      while hand.correctScore() < 17
        hand.dealerHit();
      if hand.correctScore() >= 17 then hand.should.trigger 'stop'

  describe 'stand', ->
    it 'should trigger a stand event', ->
      hand = deck.dealPlayer()
      hand.stand
      hand.should.trigger 'stand'
    it 'should flip the dealer\'s hidden card', ->
      dealer = deck.dealDealer()
      dealer.stand()
      dealer.at(0).get('revealed').should.equal true
    it 'should start the dealer\s turn', ->
      dealer = deck.dealDealer()
      dealer.stand()
      dealer.models.length.should.be.above 0

  # xdescribe 'hasAce', ->
  #   xit 'should return true/false if the hand has an ace', ->

  # xdescribe 'minScore', ->
    # xit 'should return the minimum possible score', ->

  # xdescribe 'scores', ->
    # xit 'should return an array with the min and max possible scores', ->

  describe 'correctScore', ->
    it 'should give the score of the dealer\'s hand with a hidden card', ->
    it 'should give the score of the dealer\'s hand with a revealed card', ->
    it 'should give the score of the dealer\'s hand that has an ace', ->
    it 'should give the score of the player\'s hand', ->
    it 'should give the score of the player\'s hand that has an ace', ->

  # describe 'hasBlackjack', ->
  #   xit 'should return true/false if the player has a blackjack score of 21', ->