## Prerequisites

Make sure you have [kubectl](https://kubernetes.io/docs/tasks/tools/install-kubectl/) installed.

For local installation of Kubeflow, follow instructions [here](https://www.kubeflow.org/docs/started/workstation/).

For GCP installation, start [here](https://www.kubeflow.org/docs/gke/deploy/).

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

