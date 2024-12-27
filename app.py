from flask import Flask, request, jsonify
from nltk.tokenize import word_tokenize

app = Flask(__name__)


@app.route("/chat", methods=["POST"])
def chat():
    user_input = request.json.get("message")
    response = generate_response(user_input)
    return jsonify({"response": response})


def generate_response(user_input):
    tokens = word_tokenize(user_input.lower())
    # Simple logic for demonstration purposes
    if "book" in tokens:
        return "I can help you with booking a room. What dates are you interested in?"
    elif "amenities" in tokens:
        return "We offer a pool, gym, spa, and free WiFi."
    else:
        return "I'm here to help with any questions you have about our hotel."


if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000, debug=True)
