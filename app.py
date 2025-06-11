from flask import Flask, request, jsonify
from flask_cors import CORS
import numpy as np
import cv2
import tensorflow as tf
import os

app = Flask(__name__)
CORS(app)

model = tf.keras.models.load_model(r"C:/Users/CS/efficientnet_skin_disease_model.keras")

classes = ['Cellulitis', 'Impetigo', 'Athlete-foot', 'Nail Fungus', 'Ringworm',
           'Cutaneous Larva Migrans', 'Chickenpox', 'Shingles']

def preprocess(img):
    img = cv2.resize(img, (128, 128)) 
    img = img.astype('float32') / 255.0  
    return img

@app.route('/')
def home():
    return '''
        <h2>The diagnostic server is running successfully</h2>
    '''
@app.route('/predict', methods=['POST'])
def predict():
    if 'image' not in request.files:
        return jsonify({'error': 'No image file provided'}), 400

    file = request.files['image']
    img = cv2.imdecode(np.frombuffer(file.read(), np.uint8), cv2.IMREAD_COLOR)
    
    print(f"Image received with shape: {img.shape}")
    print(f"Image dtype: {img.dtype}")

    img = preprocess(img)
    print(f"Processed image shape: {img.shape}")

    pred = model.predict(np.expand_dims(img, axis=0))[0]
    predicted_index = np.argmax(pred)
    predicted_class = classes[predicted_index]


    prediction_details = [
        {"disease": classes[i], "probability": float(pred[i])}
        for i in range(len(classes))
    ]

    return jsonify({
        "most_likely": predicted_class,
        "confidence": float(pred[predicted_index]),
        "predictions": prediction_details
    })

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)
