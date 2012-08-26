# List of responders

define ['backbone', '../view/responder', '../model/responderlist', 'handlebars', 'text!../template/responderlist.handlebars'], (Backbone, Responder, ResponderList, Handlebars, ResponderListTemplate) ->

  class ResponderListView extends Backbone.View

    el: $("#responderlist")

    template: Handlebars.compile(ResponderListTemplate)

    initialize: ->
      @collection = new ResponderList()
      @collection.on("add", @render, @)
      @render()

    render: ->
      @$el.empty()
      _.each(@collection.models, (responder) ->
        view = new ResponderView({model: responder})
        @$el.append(view.render().el)
      , @)
