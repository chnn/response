requirejs.config
    baseUrl: 'static/js/lib'

    paths:
      bootstrap: 'bootstrap'
      text: 'text'
      responder: '../model/responder'
      responderlist: '../model/responderlist'
      responderview: '../view/responder'
      responderlistview: '../view/responderlist'

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
