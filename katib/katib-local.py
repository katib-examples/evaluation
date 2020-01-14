import tensorflow as tf
import datetime, os
import argparse

parser = argparse.ArgumentParser()
parser.add_argument('--units', type=int, default=512,
                    help='')
parser.add_argument('--epoch', type=int, default=1,
                    help='')
parser.add_argument('--optimizer', default='adam',
                    help='')
parser.add_argument('--dropout', type=float, default=0.2,
                    help='Keep probability for training dropout.')
FLAGS, unparsed = parser.parse_known_args()

fashion_mnist = tf.keras.datasets.fashion_mnist

(x_train, y_train),(x_test, y_test) = fashion_mnist.load_data()
x_train, x_test = x_train / 255.0, x_test / 255.0

def create_model():
  return tf.keras.models.Sequential([
    tf.keras.layers.Flatten(input_shape=(28, 28)),
    tf.keras.layers.Dense(FLAGS.units, activation='relu'),
    tf.keras.layers.Dropout(FLAGS.dropout),
    tf.keras.layers.Dense(10, activation='softmax')
  ])

def train_model():
  
  model = create_model()
  model.compile(optimizer=FLAGS.optimizer,
                loss='sparse_categorical_crossentropy',
                metrics=['accuracy'])

  logdir = os.path.join("logs", datetime.datetime.now().strftime("%Y%m%d-%H%M%S"))
  tensorboard_callback = tf.keras.callbacks.TensorBoard(logdir, histogram_freq=1)

  history = model.fit(x=x_train, 
            y=y_train, 
            epochs=1, 
            validation_data=(x_test, y_test), 
            callbacks=[tensorboard_callback])
  print("val_acc=", history.history['val_acc'][0])

if __name__ == "__main__":
  train_model()