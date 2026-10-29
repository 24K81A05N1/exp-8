# ==============================================================================
# EXPERIMENT 8: Integrate Kubernetes and Docker
# ==============================================================================

# Step 1: Build a Docker Image
# ------------------------------------------------------------------------------
# Use Docker to build a Docker image of your application. You can use a Dockerfile
# to specify the base image, copy the application into the container, and specify
# the command to run the application.
docker build -t myimage:latest .

# Tag the image with your Docker Hub username or container registry
docker tag myimage:latest yourusername/myimage:latest

# Step 2: Push the Docker Image to a Registry
# ------------------------------------------------------------------------------
# Push the Docker image to a container registry, such as Docker Hub or Google
# Container Registry (GCR), so that it can be easily accessed by Kubernetes.
docker login
docker push yourusername/myimage:latest

# Step 3: Deploy the Docker Image to a Kubernetes Cluster
# ------------------------------------------------------------------------------
# Use Kubernetes to deploy the Docker image to a cluster.
# This creates a deployment that specifies the number of replicas and the image to be used:
kubectl create deployment myapp --image=yourusername/myimage:latest

# Expose the deployment as a service to expose it to the network:
kubectl expose deployment myapp --type=NodePort --port=80

# Step 4: Monitor and Manage the Containers
# ------------------------------------------------------------------------------
# List running pods and verify the deployment status
kubectl get pods
kubectl get deployments
kubectl get services

# Scale the number of replicas up or down
kubectl scale deployment myapp --replicas=3

# Update the image running in the deployment (rolling update)
kubectl set image deployment/myapp myapp=yourusername/myimage:v2

# Check rollout status
kubectl rollout status deployment/myapp

# Step 5: Continuously Integrate and Deploy Changes (CI/CD)
# ------------------------------------------------------------------------------
# Use a continuous integration and deployment pipeline to automatically build,
# push, and deploy changes to the Docker image and the Kubernetes cluster.
