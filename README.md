# Deploy kubernetes workshop

This repo can be used to automate deployment of multiple student environments for the k8s basics workshop.

## Prerequisities

Laptop with podman installed and running.

## Deploying the workshop

Clone this repo onto your laptop:

```
git clone https://github.com/pharriso/k8s-workshop-deploy.git
```

Edit deploy.sh script variables:

| Name                      | Default value         |                                                                                  |
|---------------------------|-----------------------|----------------------------------------------------------------------------------|
| NUM_USERS                 |                       | Number of students for the workshop                                              |
| GUID                      |                       | Workshop GUID                                                                    |
| WORKSHOP_PASSWORD         |                       | Student password for the workshop - gets rendered in lab guide                   |
| OCP_PASSWORD              |                       | admin password for the OCP cluster so we can deploy the lab                      |
| OCP_USERNAME              | admin                 | admin username for the OCP cluster so we can deploy the lab                      |
| OCP_HOST                  | https://api.cluster-$GUID.dynamic.redhatworkshops.io:6443 | API for OCP cluster so we can deploy the lab |

Run the script:

```
./deploy_workshop.sh
```

## Rebuilding the container

Edit Containerfile as needed. Rebuild has dependency on image in registry.redhat.io, so log into that registry first:

```
podman login registry.redhat.io
podman build -t quay.io/pharriso/k8s-workshop-install:<tag> -f Containerfile
```
