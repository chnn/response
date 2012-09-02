# List of responders

define ['backbone', 'response', 'responselist', 'responseview', 'pusher'], (Backbone, Response, ResponseList, ResponseView, Pusher) ->

  class ResponseListView extends Backbone.View

    tagName: "tbody"

    el: $("#responselist")

    initialize: =>
      @collection = new ResponseList()
      @collection.on('reset', @render)

      @views = new Array()
      
      @initializePusher()

    initializePusher: ->
      pusher = new Pusher('fcae1137cc539c41993f')
      channel = pusher.subscribe('responses')

      channel.bind('textresponse', (response) =>
        @addNewResponse(response.from, response.message)
      )

    render: =>
      @$el.empty()
      # Remove old view from DOM
      _.each(@views, (view) ->
        view.remove()
        @views = []
      , @)
      _.each(@collection.models, (response) ->
        view = new ResponseView({model: response})
        @$el.append(view.el)
        @views.push(view)
      , @)
      @

    addNewResponse: (name, message) ->
      # Will trigger @collection.comparator, @collection 'reset' event, @render
      response = new Response({name: name, message: message})
      view = new ResponseView({model: response})
      @collection.add(response)
      @views.push(view)
      @$el.prepend(view.el)
