# Evaluation

## Optuna

### Local

- Not Kubernetes Native
    - Cannot set trials and other configs using YAML.
- Only supports Python
- Need to import Optuna in the code, be invasive

```
cd optuna
docker build -t gaocegege/optuna-tf-example:v1.0.0 .
kubectl apply -f ./kubernetes.yaml
```

## Katib

### Local with Parallel Trials

```
cd katib
docker build -t gaocegege/katib-tf-example:v1.0.0 .
kubectl apply -f ./kubernetes-local.yaml
```

### Distributed Training with Parallel Trials

```
katib-distributed-example-57dwtx5c-ps-0             1/1     Running     0          3m1s
katib-distributed-example-57dwtx5c-worker-0         2/2     Running     0          3m2s
katib-distributed-example-57dwtx5c-worker-1         1/1     Running     0          3m2s
katib-distributed-example-7bv7tx4v-ps-0             1/1     Running     0          2m58s
katib-distributed-example-7bv7tx4v-worker-0         2/2     Running     0          3m
katib-distributed-example-7bv7tx4v-worker-1         1/1     Running     0          3m
katib-distributed-example-7pr4jj85-ps-0             1/1     Running     0          3m16s
katib-distributed-example-7pr4jj85-worker-0         2/2     Running     0          3m15s
katib-distributed-example-7pr4jj85-worker-1         1/1     Running     0          3m15s
katib-distributed-example-7vtbztsz-ps-0             1/1     Running     0          3m6s
katib-distributed-example-7vtbztsz-worker-0         2/2     Running     0          3m6s
katib-distributed-example-7vtbztsz-worker-1         1/1     Running     0          3m5s
katib-distributed-example-d8bb5dct-ps-0             1/1     Running     0          3m3s
katib-distributed-example-d8bb5dct-worker-0         2/2     Running     0          3m4s
katib-distributed-example-d8bb5dct-worker-1         1/1     Running     0          3m4s
katib-distributed-example-hq9w84h6-ps-0             1/1     Running     0          3m8s
katib-distributed-example-hq9w84h6-worker-0         2/2     Running     0          3m8s
katib-distributed-example-hq9w84h6-worker-1         1/1     Running     0          3m8s
katib-distributed-example-rj2c4skm-ps-0             1/1     Running     0          2m57s
katib-distributed-example-rj2c4skm-worker-0         2/2     Running     0          2m56s
katib-distributed-example-rj2c4skm-worker-1         1/1     Running     0          2m56s
katib-distributed-example-rjz7t4d7-ps-0             1/1     Running     0          3m13s
katib-distributed-example-rjz7t4d7-worker-0         2/2     Running     0          3m13s
katib-distributed-example-rjz7t4d7-worker-1         1/1     Running     0          3m12s
katib-distributed-example-scv4rzzs-ps-0             1/1     Running     0          3m19s
katib-distributed-example-scv4rzzs-worker-0         2/2     Running     0          3m18s
katib-distributed-example-scv4rzzs-worker-1         1/1     Running     0          3m18s
katib-distributed-example-sjsv9hh7-ps-0             1/1     Running     0          3m11s
katib-distributed-example-sjsv9hh7-worker-0         2/2     Running     0          3m10s
katib-distributed-example-sjsv9hh7-worker-1         1/1     Running     0          3m10s
```
