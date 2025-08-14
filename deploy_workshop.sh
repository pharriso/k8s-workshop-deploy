# variables for the workshop
NUM_USERS=20
GUID=
WORKSHOP_PASSWORD=
# Variables to authenticate to the cluster
# Use admin credentials for the cluster
OCP_PASSWORD=
# You shouldn't need to change these variables unless something changes in the RHPDS workshop
OCP_HOST=https://api.cluster-$GUID.dynamic.redhatworkshops.io:6443
OCP_USERNAME=admin

podman run --rm -it --name showroom \
  --env OCP_PASSWORD=$OCP_PASSWORD \
  --env OCP_HOST=$OCP_HOST \
  --env OCP_USERNAME=$OCP_USERNAME \
  quay.io/pharriso/k8s-workshop-install:1.0 \
  bash -c "git clone https://github.com/pharriso/k8s-workshop-deploy.git && \
           ansible-playbook /k8s-workshop-deploy/ansible/install_playbook.yml \
           -e num_users=$NUM_USERS -e guid=$GUID \
           -e workshop_password=$WORKSHOP_PASSWORD"
