# List of responders

define ['backbone', 'responder', 'responderlist', 'responderview', 'pusher'], (Backbone, Responder, ResponderList, ResponderView, Pusher) ->

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

    pusher = new Pusher('fcae1137cc539c41993f')
    channel = pusher.subscribe('responses')

    that = @
    channel.bind('textresponse', (response) =>
      model = new Responder({name: response.from, message: response.message})
      that.collection.add(model)
    )
