requirejs.config
    paths:
      bootstrap: 'lib/bootstrap'
      text: 'lib/text'

    shim:
      underscore:
        path: 'lib/underscore'
        exports: '_'
      
      backbone:
        path: 'lib/backbone'
        deps: ['underscore', 'jquery']
        exports: 'Backbone'

      handlebars:
        path: 'lib/handlebars'
        exports: 'Handlebars'

require(["jquery", "bootstrap"], ($) ->
    $('#incident-tabs a:first').tab('show')
)
