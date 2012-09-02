# Basic responder model

define ['backbone'], (Backbone) ->

  class Response extends Backbone.Model

    defaults:
      status: 1 # 1: unsorted, 2: available, 3: unsure, 4: not avaliable
