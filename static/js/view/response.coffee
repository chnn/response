# Single responder

define ['backbone', 'response', 'handlebars', 'text!../template/response.handlebars'], (Backbone, Response, Handlebars, ResponseTemplate) ->

  class ResponseView extends Backbone.View
    tagName: "tr"

    model: Response

    template: Handlebars.compile(ResponseTemplate)

    events:
      "click .response-available": "setStatusAvailable"
      "click .response-unavailable": "setStatusUnavailable"
      "click .response-unsure": "setStatusUnsure"
      "click .response-delete": "remove"

    initialize: ->
      @render()

    render: ->
      console.log("Rendering ResponseView")
      @$el.html(@template(@model.toJSON()))
      @$el.addClass(@model.get("statusClass"))

    setStatus: (to) ->
      @model.set("status", to)

    setStatusAvailable: ->
      @setStatus(2)
      @model.set("statusClass", "success")
      @model.collection.sort()

    setStatusUnavailable: ->
      @setStatus(4)
      @model.set("statusClass", "error")
      @model.collection.sort()

    setStatusUnsure: ->
      @setStatus(3)
      @model.set("statusClass", "caution")
      @model.collection.sort()

    remove: ->
      @unbind()
      super
