import os
from itertools import izip
from flask import Flask, render_template, request, redirect
import twilio.twiml

app = Flask(__name__)

@app.route('/')
def index():
    return render_template('index.html', responders=responders)

responders = {}

@app.route('/message', methods=['GET', 'POST'])
def receive_text_message():
    """Receive Twilio text message with caller ID"""

    responder = request.values.get('From', None)
    message = request.values.get('Body', None)

    responders[responder] = message

    resp = twilio.twiml.Response()
    resp.sms('Verified that ' + responder + ' responded with "' + message + '"')
    return str(resp)

def phone_to_name(phonenumber):
    """Return a name given a phone number, if exists in db"""
    
if __name__ == '__main__':
    port = int(os.environ.get('PORT', 5000))
    app.run(debug=True, host='0.0.0.0', port=port)
