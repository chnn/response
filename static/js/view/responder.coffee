# Single responder

define ['backbone', 'responder', 'handlebars', 'text!../template/responder.handlebars'], (Backbone, Responder, Handlebars, ResponderTemplate) ->

  class ResponderView extends Backbone.View

    model: Responder

    template: Handlebars.compile(ResponderTemplate)

    initialize: ->
      @render()

    render: ->
      console.log("Rendering ResponderView")
      @$el.html(@template(@model.toJSON()))