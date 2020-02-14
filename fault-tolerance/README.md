## Prerequisites

Make sure you have [kubectl](https://kubernetes.io/docs/tasks/tools/install-kubectl/) installed.

To install Katib, start [here](https://github.com/kubeflow/katib/blob/master/scripts/v1alpha3/deploy.sh).

To install Chaos Mesh, start [here](https://github.com/pingcap/chaos-mesh#install-chaos-mesh)

## Running the examples

1. Clone the contents of this directory.

2.  Run the following command to build and execute Optuna example 

```bash
cd optuna
docker build -t gaocegege/optuna-tf-example:v1.0.0 .
kubectl apply -f ./kubernetes.yaml
```

3.  Run the following command to build and execute Katib distributed tensorflow example

```
docker build -t gaocegege/katib-tf-example:v1.0.0 .
kubectl apply -f ./kubernetes-distributed.yaml
```

4. Once all experiments are started, start chaos engineering.

For Trial failure experiment, 
```bash
cd chaos
kubectl apply -f ./pod-failures.yaml
```

For Trail kill experiment,
```bash
cd chaos
kubectl apply -f ./pod-failures.yaml
```
5. Plot the graph with objective metric values collected over varying failure and kill rates. Sample graphs are given below

<p float="left">
<img src="https://github.com/katib-examples/evaluation/blob/master/docs/chaos-1.png" width="300" height="300">
<img src="https://github.com/katib-examples/evaluation/blob/master/docs/chaos-2.png" width="300" height="300">
<img src="https://github.com/katib-examples/evaluation/blob/master/docs/chaos-kill.png" width="300" height="300">
</p>
