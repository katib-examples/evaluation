## Prerequisites

Make sure you have [kubectl](https://kubernetes.io/docs/tasks/tools/install-kubectl/) installed.

To install Katib, start [here](https://github.com/kubeflow/katib/blob/master/scripts/v1alpha3/deploy.sh).

## Running the examples

1. Clone the contents of this directory.

2. Run the following command to create an experiment:

```
kubectl apply -f random-example-user1.yaml
```

3.  Once the trials start running, run the following command to collect the results.

```
sh test-autoscalability.sh
```

4. Graphs are plotted with the collected data(Pending Trial CPUs, Running Trial CPUs and Total Cluster CPUs). A sample graph is given below.

<img src="https://github.com/katib-examples/evaluation/blob/master/images/autoscale.png" width="400" height="400">
