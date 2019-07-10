gcloud config set project james-app-dev
gcloud container clusters create "jamesk8snode" --zone "us-east1-b" --machine-type "n1-standard-1" --image-type "GCI" --disk-size "50" --scopes cloud-platform --num-nodes "1"

gcloud container clusters get-credentials jamesk8snode
gcloud container clusters --region us-east1-b get-credentials jamesk8snode

docker tag 3543cc4f9ef9 gcr.io/james-app-dev/k8snodeapi
docker push gcr.io/james-app-dev/k8snodeapi