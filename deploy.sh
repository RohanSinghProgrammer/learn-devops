set -e

NAME="kubernetes-demo-api"
USERNAME="rohansinghdeveloper"
IMAGE="$USERNAME/$NAME:latest"

echo "Building Docker image..."
docker build -t $IMAGE .

echo "Pushing image to Docker Hub..."
docker push $IMAGE

echo "Applying Kubernetes manifests..."
kubectl apply -f k8s/deployment.sh
kubectl apply -f k8s/service.sh

echo "Getting pods..."
kubectl get pods

echo "Getting services..."
kubectl get services

echo "Fetchig the main service..."
kubectl get service $NAME-service