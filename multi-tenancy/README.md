## Prerequisites

Make sure you have [kubectl](https://kubernetes.io/docs/tasks/tools/install-kubectl/) installed.

To install Katib, start [here](https://github.com/kubeflow/katib/blob/master/scripts/v1alpha3/deploy.sh).

## Running the examples

1. Clone the contents of this directory.

2. Run the following command to set resource limits for users `user1` and `user2`:

```
kubectl apply -f compute-resources-user1.yaml
```
```
kubectl apply -f compute-resources-user2.yaml
```

3. Run the following command to start experiments for users `user1` and `user2`:

```
kubectl apply -f random-example-user1.yaml
```
```
kubectl apply -f random-example-user2.yaml
```


4. Navigate to the Katib console (see [this link](https://www.kubeflow.org/docs/components/hyperparameter-tuning/experiment/#running-the-experiment-from-the-katib-ui)) and view trial results.
