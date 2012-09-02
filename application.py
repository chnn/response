import os
from flask import Flask, render_template, request, redirect, url_for
from datetime import datetime
import twilio.twiml
import pusher

app = Flask(__name__)

pusher.app_id = '26515'
pusher.key = 'fcae1137cc539c41993f'
pusher.secret = '53ac4bf1196b576c3ec1'
p = pusher.Pusher()

@app.route('/')
def index():
    return render_template('index.html', responders=responders)

# Will eventually be a better data store (mongo)
people = {
    '+14154976513': 'Chris Henn',
}

responders = {}

@app.route('/message', methods=['GET', 'POST'])
def receive_text_message():
    """Receive Twilio text message with caller ID"""

    responder = phone_to_name(request.values.get('From', None))
    message_content = request.values.get('Body', None)

    # Send response to Pusher (for Backbone)
    p['responses'].trigger('textresponse', {'from': responder, 'message': message_content})

    # # Reply to text, verifying response received
    # resp = twilio.twiml.Response()
    # resp.sms('Verified that ' + responder + ' responded with "' + message_content + '"')
    # return str(resp)

@app.route('/addtestmessages')
def push_test_messages():
    p['responses'].trigger('textresponse', {'from': 'Chris Henn', 'message': 'Testing messages'})
    p['responses'].trigger('textresponse', {'from': 'A Person', 'message': 'Hello'})
    p['responses'].trigger('textresponse', {'from': 'Someone Else', 'message': 'Goodbye'})
    p['responses'].trigger('textresponse', {'from': 'Test Person', 'message': 'Whats up'})
    p['responses'].trigger('textresponse', {'from': 'Name Lastname', 'message': 'This is my message'})
    p['responses'].trigger('textresponse', {'from': 'Someones Name', 'message': 'Hi'})
    return "Success"


def phone_to_name(phonenumber):
    """Return a name given a phone number, if exists in db"""

    if phonenumber in people:
        return people[phonenumber]
    else:
        return phonenumber

if __name__ == '__main__':
    port = int(os.environ.get('PORT', 5000))
    app.run(debug=True, host='0.0.0.0', port=port)
