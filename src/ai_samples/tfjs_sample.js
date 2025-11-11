// TensorFlow.js sample: simple linear regression
import * as tf from '@tensorflow/tfjs';

const xs = tf.tensor1d([1, 2, 3, 4]);
const ys = tf.tensor1d([1, 3, 5, 7]);

const model = tf.sequential();
model.add(tf.layers.dense({units: 1, inputShape: [1]}));
model.compile({loss: 'meanSquaredError', optimizer: 'sgd'});

async function train() {
  await model.fit(xs, ys, {epochs: 250});
  const output = model.predict(tf.tensor2d([5], [1, 1]));
  output.print();
}
train();