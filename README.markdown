Response is a prototype web app for coordinating emergency responders to incident.

<a href="./response_screen.png"><img src="./response_screen_thumb.png" /></a>

Text your response to a Twilio phone number, and it will be pushed to the list in the web app. The list can be sorted edited to give the incident coordinator a quick overview of who is available. Data is persisted to a Mongo data store. 

This prototype was born out of frustration with current solutions to the same problem (iamresponding.com). It also provided an opportunity to explore the Twilio and Pusher APIs, and implement a Backbone.js based interface.

### Technologies

The code is simple, but there are quite a few interactions between technologies that make the whole thing work.

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

### Possible improvements to be made

There is a [development board on Trello](https://trello.com/b/RmoQCeN3) with some ideas for further improving the app.
