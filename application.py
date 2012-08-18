import os
from flask import Flask, render_template, request, redirect
import twilio.twiml

app = Flask(__name__)

@app.route('/')
def index():
    return render_template('index.html')

responders = {
        "+14154976513": "Chris Henn"
}

messages = {
}

@app.route('/message', methods=['GET', 'POST'])
def receive_text_message():
    """Receive Twilio text message with caller ID"""

    responder = responders[request.values.get('From', None)]
    message = request.values.get('Body', None)
    messages[responder] = message

    resp = twilio.twiml.Response()
    resp.sms('Verified that ' + responder + 'responded with "' + message + '"')
    return str(resp)

    
if __name__ == '__main__':
    port = int(os.environ.get('PORT', 5000))
    app.run(debug=True, host='0.0.0.0', port=port)
