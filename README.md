# Deployment
## Configurations
Copy `./config.template.sh` to `config.sh` and give values to all variables listed there

Run:
```text
source ./config.sh
```

After that config settings can be used in commands mentioned below.

Code like
```text
envsubst < resource.yaml | command
```
will read `resource.yaml`, substitute environment variables that we have just set and pass the result to the pipe.

## Secrets
Create a service account with `Cloud SQL Client` role. Store json-file with private key localy (e.g. in `stellar-sql-client-key.json`)

Deploy database client credentials:
```text
kubectl create secret generic cloudsql-instance-credentials --from-file=credentials.json=./stellar-sql-client-key.json
```
Deploy gsutil credentials secret:
```
kubectl create secret generic gs-access-key \
    --from-literal=PROJECT="${PROJECT}" \
    --from-literal=GS_ACCESS_KEY_ID="${GS_ACCESS_KEY_ID}" \
    --from-literal=GS_SECRET_ACCESS_KEY="${GS_SECRET_ACCESS_KEY}"
```
Deploy database credentials secret:
```
kubectl create secret generic stellar-database-credentials \
    --from-literal=STELLAR_CORE_DATABASE_URL="${STELLAR_CORE_DATABASE_URL}" \
    --from-literal=STELLAR_HORIZON_DATABASE_URL="${STELLAR_HORIZON_DATABASE_URL}"
```
## Service
Deploy Stellar node application's service:
```
envsubst < resources/service.yaml | kubectl create -f -
```
## Deployment
Deploy Stellar node application's pod:
```
envsubst < resources/deployment.yaml | kubectl create -f -
```
#Maintenance
To modify the deployment:
```
kubectl edit deployment/stellar --save-config
```
To see logs (stellar core):
```
kubectl log deployment/stellar -c core -f
```
To see logs (stellar horizon):
```
kubectl log deployment/stellar -c horizon -f
```
Delete the deployment:
```text
kubectl delete deployment stellar
```
Delete the service:
```text
kubectl delete service stellar
```
Launch bash in Stellar core container:
```text
kubectl exec -it <pod name something like stellar-885092335-xc8sr, can be found in `kubectl get pods` output> -c core /bin/bash
```
