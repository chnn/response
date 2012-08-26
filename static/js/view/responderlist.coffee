# List of responders

define ['backbone', '../model/responderlist', 'handlebars', 'text!../template/responderlist.handlebars'], (Backbone, ResponderList, Handlebars, ResponderListTemplate) ->

  class ResponderList extends Backbone.View

    el: $("#responderlist")

    template: Handlebars.compile(ResponderListTemplate)

    initialize: ->
      # @collection.on("sync", @render, @)
      @render()

    render: ->
      @$el.html(@template)
