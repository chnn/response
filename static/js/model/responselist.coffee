# Collection (list) of responders

define ['backbone'], (Backbone) ->

  class ResponseList extends Backbone.Collection

    url: '/responses'

    comparator: (response) ->
      response.get("status")
