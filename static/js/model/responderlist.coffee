# Collection (list) of responders

define ['backbone', './responder', 'pusher'], (Backbone, Responder, Pusher) ->

  class ResponderList extends Backbone.Collection
    model: Responder

    @add(new Responder())

    pusher = new Pusher('fcae1137cc539c41993f')
    channel = pusher.subscribe('responses')

    that = @
    channel.bind('textresponse', (response) =>
      model = new Responder({name: response.from, message: response.message})
      that.add([model])
    )
