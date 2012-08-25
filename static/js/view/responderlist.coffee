# List of responders

define ['backbone', '../model/responderlist', 'handlebars', 'text!../templates/responderlist.handlebars', 'bootstrap'], (Backbone, ResponderList, Handlebars, ResponderListTemplate) ->

  class ResponderList extends Backbone.View

    el: "#responderlist"

    template: Handlebars.compile(ResponderListTemplate)

    initialize: ->
      @collection = new ResponderList()

    render: ->
      @$el.empty()
      @$el.html(@template(@collection.toJSON))
