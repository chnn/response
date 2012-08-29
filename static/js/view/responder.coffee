# Single responder

define ['backbone', 'responder', 'handlebars', 'text!../template/responder.handlebars'], (Backbone, Responder, Handlebars, ResponderTemplate) ->

  class ResponderView extends Backbone.View
    tagName: "li"

    model: Responder

    template: Handlebars.compile(ResponderTemplate)

    events:
      "click .delete": "clear"

    initialize: ->
      @render()

    render: ->
      console.log("Rendering ResponderView")
      @$el.html(@template(@model.toJSON()))

    clear: ->
      @model.destroy()
