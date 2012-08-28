# List of responders

define ['backbone', 'responder', 'responderlist', 'responderview', 'pusher'], (Backbone, Responder, ResponderList, ResponderView, Pusher) ->

  class ResponderListView extends Backbone.View

    el: $("#responderlist")

    initialize: ->
      @collection = new ResponderList()
      window.collection = @collection

      @initializePusher()

    initializePusher: ->
      pusher = new Pusher('fcae1137cc539c41993f')
      channel = pusher.subscribe('responses')

      channel.bind('textresponse', (response) =>
        @addNewResponse(response.from, response.message)
      )

    render: ->
      console.log("Rendering ResponderListView")
      @$el.empty()
      _.each(@collection.models, (responder) ->
        @renderResponder(responder)
      , @)
      @

    addNewResponse: (name, message) ->
      @collection.add(new Responder({name: name, message: message}))
      @render()

    renderResponder: (responder) ->
      view = new ResponderView({model: responder})
      console.log("Created new ResponderView")
      console.log(view)
      @$el.append(view.el)
      console.log(@$el)
