"""Simple Hugging Face sample service.
Run locally: python src/hf_service.py --test
"""
import sys
from transformers import pipeline

def run_test():
    classifier = pipeline('sentiment-analysis')
    res = classifier('MindX AI is changing the world!')
    print('HF sample result:', res)

if __name__ == '__main__':
    if '--test' in sys.argv:
        run_test()
    else:
        from flask import Flask, request, jsonify
        app = Flask(__name__)
        classifier = pipeline('sentiment-analysis')

        @app.route('/predict', methods=['POST'])
        def predict():
            data = request.json or {}
            text = data.get('text', '')
            if not text:
                return jsonify({'error':'no text provided'}), 400
            result = classifier(text)
            return jsonify(result)

        app.run(host='0.0.0.0', port=5000)
