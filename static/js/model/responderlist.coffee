# Collection (list) of responders

define ['backbone', './responder', 'pusher'], (Backbone, Responder, Pusher) ->

  class Responder extends Backbone.Collection
    model: Responder

    pusher = new Pusher('26515')
    channel = pusher.subscribe('responses')

    channel.bind('textresponse', (response) ->
      @add([{name: response.name, message: response.message}])
    )
