from flask import Flask,request,jsonify
import tensorflow as tf
import librosa
import numpy as np

app = Flask(__name__)

model = tf.keras.models.load_model('s_model')

d = {0: 'air_conditioner', 1: 'car_horn', 2: 'children_playing', 3: 'dog_bark', 4: 'drilling', 5: 'engine_idling', 6:'gun_shot', 7: 'jackhammer', 8: 'siren', 9: 'street_music'}

def func(filename):
    audio, sample_rate = librosa.load(filename)
    mfccs_features = librosa.feature.mfcc(y=audio, sr=sample_rate, n_mfcc=40)
    mfccs_scaled_features = np.mean(mfccs_features.T,axis=0)
    mfccs_scaled_features=mfccs_scaled_features.reshape(1,-1)
    predicted_label=np.argmax(model.predict(mfccs_scaled_features),axis=1)
    return d[predicted_label[0]]

@app.route('/predict',methods=['POST'])
def predict():
    if 'audio' not in request.files:
        return 'No file provided', 400

    audio_file = request.files['audio']
    if not audio_file.filename.lower().endswith('.wav'):
        return 'Invalid file type, must be .wav', 400
    preditction = func(audio_file)
    print(preditction)
    return preditction



if __name__ == '__main__':
    app.run(debug=True)



"""# Example code for setting up a Flask API for audio classification
from flask import Flask, request, jsonify
from tensorflow import keras
import librosa
import numpy as np

app = Flask(__name__)

# Define the endpoint for audio file classification
@app.route('/classify_audio', methods=['POST'])
def classify_audio():
    # Retrieve uploaded audio file from Flutter
    audio_file = request.files['audio'].read()

    # Load the trained deep learning model
    model = keras.models.load_model('audio_model.h5')

    # Preprocess the audio file
    # For example, you can use librosa library to convert the audio file to spectrogram
    spectrogram = librosa.stft(np.frombuffer(audio_file, dtype=np.int16))

    # Make predictions
    predictions = model.predict(spectrogram)

    # Format and send response back to Flutter
    response = {'predictions': predictions.tolist()}
    return jsonify(response)

if __name__ == '__main__':
    app.run(debug=True)

"""