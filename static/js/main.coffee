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

require(['../view/responderlist'], (ResponderListView) ->
  view = new ResponderListView()
)
