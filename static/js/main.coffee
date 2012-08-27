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

require(['backbone', '../view/responderlist'], (Backbone, ResponderListView) ->
  new ResponderListView()
)
