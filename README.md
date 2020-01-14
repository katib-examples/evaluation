# Evaluation

## Optuna

- Not Kubernetes Native
    - Cannot set trials and other configs using YAML.
- Only supports Python
- Need to import optuna in the code, be invasive

```
cd optuna
docker build -t gaocegege/optuna-tf-example:v1.0.0 .

```