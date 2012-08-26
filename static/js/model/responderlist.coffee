# Collection (list) of responders

define ['backbone', './responder'], (Backbone, Responder) ->

  class Responder extends Backbone.Collection
    model: Responder
