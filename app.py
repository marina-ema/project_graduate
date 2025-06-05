from flask import Flask, request, jsonify
from flask_cors import CORS
import numpy as np
import cv2
import tensorflow as tf
import os

# إنشاء التطبيق وتفعيل CORS
app = Flask(__name__)
CORS(app)

# تحميل النموذج
model = tf.keras.models.load_model(r"C:/Users/CS/VGG16_skin_disease_model.keras")

# أسماء الأمراض الجلدية
classes = ['Cellulitis', 'Impetigo', 'Athlete-foot', 'Nail Fungus', 'Ringworm',
           'Cutaneous Larva Migrans', 'Chickenpox', 'Shingles']

# دالة معالجة الصورة
def preprocess(img):
    img = cv2.resize(img, (128, 128)) 
    img = img.astype('float32') / 255.0  
    return img

# الصفحة الرئيسية
@app.route('/')
def home():
    return '''
        <h2>خادم التشخيص يعمل بنجاح ✅</h2>
        <p>استخدم <code>/predict</code> لإرسال صورة وتشخيص المرض الجلدي.</p>
        <p>الطريقة: أرسل طلب POST مع صورة باستخدام المفتاح <code>image</code>.</p>
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

    # إعداد النتيجة مع جميع الاحتمالات
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
    app.run(host='192.168.1.3', port=5000)
