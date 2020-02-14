## Prerequisites

Make sure you have [kubectl](https://kubernetes.io/docs/tasks/tools/install-kubectl/) installed.

To install Minikube on your local machine, follow instructions [here](https://kubernetes.io/docs/tasks/tools/install-minikube/).

To install Katib, start [here](https://github.com/kubeflow/katib/blob/master/scripts/v1alpha3/deploy.sh).

## Running the examples

1. Clone the contents of this directory.

2. Run the following command:
```
kubectl apply -f portability-local.yaml
```
or
```
kubectl apply -f portability-cloud.yaml
```

3. Navigate to the Katib console (see [this link](https://www.kubeflow.org/docs/components/hyperparameter-tuning/experiment/#running-the-experiment-from-the-katib-ui)) and view results.

