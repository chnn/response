# List of responders

define ['backbone', 'responder', 'responderlist', 'responderview', 'pusher'], (Backbone, Responder, ResponderList, ResponderView, Pusher) ->

  class ResponderListView extends Backbone.View

    el: $("#responderlist")

    initialize: ->
      @collection = new ResponderList()
      @collection.on("add", @render, @)

      @initializePusher()

      @render()

    initializePusher: ->
      pusher = new Pusher('fcae1137cc539c41993f')
      channel = pusher.subscribe('responses')

      channel.bind('textresponse', (response) =>
        @addNewResponse(response.name, response.message)
      )

    render: ->
      @$el.empty()
      _.each(@collection.models, (responder) ->
        view = new ResponderView({model: responder})
        @$el.append(view.render().el)
      , @)
      @

    addNewResponse: (name, message) ->
      @collection.add(new Responder({name: name, message: message}))
