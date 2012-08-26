requirejs.config
    baseUrl: 'static/js/lib'

    paths:
      bootstrap: 'bootstrap'
      text: 'text'

    shim:
      underscore:
        exports: '_'
      
      backbone:
        deps: ['underscore', 'jquery']
        exports: 'Backbone'

      handlebars:
        exports: 'Handlebars'

      pusher:
        exports: 'Pusher'

require(['../view/responderlist'], (ResponderListView) ->
  view = new ResponderListView()
)
