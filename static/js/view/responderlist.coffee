# List of responders

define ['backbone', 'responderlist', 'responderview'], (Backbone, ResponderList, ResponderView) ->

  class ResponderListView extends Backbone.View

    el: $("#responderlist")

    initialize: ->
      @collection = new ResponderList()
      @collection.on("add", @render, @)
      @render()

    render: ->
      @$el.empty()
      _.each(@collection.models, (responder) ->
        view = new ResponderView({model: responder})
        @$el.append(view.render().el)
      , @)
      @
