# Collection (list) of responders

define ['backbone'], (Backbone) ->

  class ResponseList extends Backbone.Collection

    comparator: (response) ->
      response.get("status")
