# Use Red Hat UBI9 as the base image
FROM registry.redhat.io/openshift4/ose-cli:latest as ose-cli

FROM registry.access.redhat.com/ubi9:latest

# Install necessary tools
RUN dnf install -y \
    git ansible-core python3-pip

RUN curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 && \
    chmod 700 get_helm.sh && \
    ./get_helm.sh

COPY --from=ose-cli /usr/bin/kubectl /usr/bin/
COPY --from=ose-cli /usr/bin/oc /usr/bin/

COPY ansible/requirements.yml /requirements.yml

RUN ansible-galaxy collection install -r /requirements.yml

RUN pip3 install kubernetes
