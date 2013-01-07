import os
from flask import Flask, render_template, request, Response, json
from mongokit import Connection, Document
import twilio.twiml
import pusher

# Mongo setup
MONGODB_HOST = 'localhost'
MONGODB_PORT = 27017

# Pusher setup
pusher.app_id = ''
pusher.key = ''
pusher.secret = ''
p = pusher.Pusher()

app = Flask(__name__)
app.config.from_object(__name__)

connection = Connection(app.config['MONGODB_HOST'],
                        app.config['MONGODB_PORT'])


# Mongo document schema for a response
@connection.register
class Message(Document):
    def __repr__(self):
        return '<Message from %r>' % (self.name)
    __collection__ = 'responses'
    __database__ = 'dev'
    structure = {
        'name': str,
        'message': unicode
    }
    use_dot_notation = True

# Will eventually be a better data store (mongo)
people = {
    '+14154976513': 'Chris Henn',
}

responders = {}


@app.route('/')
def index():
    return render_template('index.html', responders=responders)


@app.route('/message', methods=['POST'])
def receive_text_message():
    """Receive Twilio text message with caller ID"""

    responder = phone_to_name(request.values.get('From', None))
    message_content = request.values.get('Body', None)

    # Send response to Pusher (for Backbone)
    p['responses'].trigger('textresponse', {
        'from': responder,
        'message': message_content
    })

    # Save to Database
    response = connection.Message()
    response.name = responder
    response.message = message_content
    response.save()

    # Reply to text, verifying response received
    resp = twilio.twiml.Response()
    resp.sms('Verified that ' + responder + ' responded with "' + message_content + '"')
    return str(resp)


@app.route('/responses', methods=['GET'])
def return_responses():
    responses = []
    i = 0
    for response in connection.Message.find():
        i += 1
        temp = {}
        temp['id'] = i
        temp['name'] = response['name']
        temp['message'] = response['message']
        responses.append(temp)

    data = json.dumps(responses)
    app.logger.debug(data)

    resp = Response(data, status=200, mimetype='application/json')
    return resp


def phone_to_name(phonenumber):
    """Return a name given a phone number, if exists in db"""

    if phonenumber in people:
        return people[phonenumber]
    else:
        return phonenumber

if __name__ == '__main__':
    port = int(os.environ.get('PORT', 5000))
    app.run(debug=True, host='0.0.0.0', port=port)
