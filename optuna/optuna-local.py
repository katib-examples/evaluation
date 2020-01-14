"""
Optuna example that optimizes multi-layer perceptrons using Tensorflow (Estimator API).
In this example, we optimize the validation accuracy of hand-written digit recognition using
Tensorflow and MNIST. We optimize the neural network architecture as well as the optimizer
configuration. As it is too time consuming to use the whole MNIST dataset, we here use a small
subset of it.
We have the following two ways to execute this example:
(1) Execute this code directly.
    $ python tensorflow_estimator_simple.py
(2) Execute through CLI.
    $ STUDY_NAME=`optuna create-study --direction maximize --storage sqlite:///example.db`
    $ optuna study optimize tensorflow_estimator_simple.py objective --n-trials=100 \
      --study $STUDY_NAME --storage sqlite:///example.db
"""

import tensorflow as tf
import datetime, os
import argparse
import sys

import optuna

fashion_mnist = tf.keras.datasets.fashion_mnist

(x_train, y_train),(x_test, y_test) = fashion_mnist.load_data()
x_train, x_test = x_train / 255.0, x_test / 255.0

def create_model(trial):
  return tf.keras.models.Sequential([
    tf.keras.layers.Flatten(input_shape=(28, 28)),
    tf.keras.layers.Dense(trial.suggest_int('units', 1, 1024), activation='relu'),
    tf.keras.layers.Dropout(trial.suggest_loguniform('dropout', 0.1, 1)),
    tf.keras.layers.Dense(10, activation='softmax')
  ])

def objective(trial):
  
  model = create_model(trial)
  model.compile(optimizer=trial.suggest_categorical('optimizer', ['adam', 'sgd']),
                loss='sparse_categorical_crossentropy',
                metrics=['accuracy'])

  logdir = os.path.join("logs", datetime.datetime.now().strftime("%Y%m%d-%H%M%S"))

  history = model.fit(x=x_train, 
            y=y_train, 
            epochs=1, 
            validation_data=(x_test, y_test))
  print(history.history)
  return history.history['val_acc'][0]

def main():
  study = optuna.create_study(direction='maximize')
  study.optimize(objective, n_trials=int(sys.argv[1]))

  print('Number of finished trials: ', len(study.trials))

  print('Best trial:')
  trial = study.best_trial

  print('  Value: ', trial.value)

  print('  Params: ')
  for key, value in trial.params.items():
    print('    {}: {}'.format(key, value))

if __name__ == "__main__":
    main()