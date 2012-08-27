# Collection (list) of responders

define ['backbone', 'responder', 'pusher'], (Backbone, Responder, Pusher) ->

  class ResponderList extends Backbone.Collection

    pusher = new Pusher('fcae1137cc539c41993f')
    channel = pusher.subscribe('responses')

    that = @
    channel.bind('textresponse', (response) =>
      model = new Responder({name: response.from, message: response.message})
      that.add([model])
    )
