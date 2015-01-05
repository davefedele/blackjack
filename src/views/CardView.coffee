class window.CardView extends Backbone.View
  className: 'card'

  template: _.template ''

  initialize: -> @render()

  render: ->
    @$el.children().detach()
    @$el.html @template @model.attributes
    rankName = @model.get 'rankName'
    suitName = @model.get 'suitName'
    @$el.css('background-image', 'url(./img/cards/' + rankName + '-' + suitName + '.png)') if @model.get 'revealed'
    @$el.addClass 'covered' unless @model.get 'revealed'

