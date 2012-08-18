from flask import Flask, render_template
import twilio

app = Flask(__name__)

@app.route('/')
def index():
    return render_template('index.html')

responders = {
}

@app.route('/message')
def receive_text_message():
    """Receive Twilio text message with caller ID"""

    

if __name__ == '__main__':
    port = int(os.environ.get('PORT', 5000))
    app.run(host='0.0.0.0', port=port)
