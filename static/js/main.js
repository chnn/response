requirejs.config({
    paths: {
        bootstrap: 'lib/bootstrap'
    },
    modules: [
        {
            name: "main"
        }
    ]
})

require(["jquery", "bootstrap"], function($) {
    $('#incident-tabs a:first').tab('show');
});
