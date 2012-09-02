Response is a web app for handling the response to an incident (similar to iamresponding.com). The goal is to make it very simple and effective to use.

Response is incomplete, untested, and in no way ready for production.

### Technologies

* Flask 
    * Serves the index.html template and static assets (backbone, styles)
    * Handles saving and retrieving from the database
    * Receives messages using Twilio api
    * Pushes messages to Backbone using the Pusher api
* RequireJS
    * Keeps JS in modules, loads them asynchronously
* Backbone
    * Renders the important parts of the application without page refresh
    * Seperates JS into more maintainable parts

### What's planned 

Check out the [development board on Trello](https://trello.com/b/RmoQCeN3)
