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

## Volums
```text
gcloud compute disks create core-data --size 200GB --type pd-standard --zone europe-west1-d
```

## Secrets
Create a service account with `Cloud SQL Client` role. Store json-file with private key localy (e.g. in `stellar-sql-client-key.json`)

Deploy database client credentials (the same credentials are used to send archives to buckets by gsutil):
```text
kubectl create secret generic cloudsql-instance-credentials --from-file=credentials.json=./stellar-sql-client-key.json
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
Pod cannot be launched if disk `core-data` is attached to any compute. To detach run in console:
```text
for i in `gcloud compute instances list | gawk 'NR>1 {print $1}'`; do gcloud compute instances detach-disk $i --zone europe-west1-d --disk=core-da
ta; done
```

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
