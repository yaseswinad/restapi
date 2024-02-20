from flask import Flask, jsonify

app = Flask(__name__)

@app.route('/health', methods=['GET'])
def health():
    return jsonify({'result': 'Healthy', 'error': False})

if __name__ == '__main__':
    app.run(debug=True)
