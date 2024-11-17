# ATCProject Clear Document

Step1. Environment Setup
  Pre-requisites
  Azure CLI installed. Install Azure CLI.
  Terraform installed. Install Terraform.
  Docker installed. Install Docker.
  A working Azure subscription.

Step2.AZ login Using Bash
 1. az login command or az login --use-device-code
  Set your default Azure subscription:
    az account set --subscription "<Your Subscription ID>"
 2. Prepare Azure Resource Group:
     az group create --name myResourceGroup --location westus2 #location you can choose as per your
     
  
3. Containerize the Application with Docker
    Index.html:
      <!DOCTYPE html>
<html>
<head>
    <title>Welcome</title>
</head>
<body>
    <h1>Hello, Kubernetes on Azure!</h1>
</body>
</html>
4.Write a Dockerfile:
    FROM nginx:latest
    COPY index.html /usr/share/nginx/html

5.  Build and tag the Docker image:
      docker build -t my-web-app:latest .
6.Test the image locally:
      docker run -p 8081:80 my-web-app:latest
             # Access at http://localhost:8081
 7.Push the image to Azure Container Registry (ACR):
     az acr create --resource-group myrg-group --name mysairegistry --sku Basic
8.Log Into AcR:
   az acr login --name myContainerRegistry
9.Tag and push the image:
   docker tag my-web-app:latest mysairegistry.azurecr.io/my-web-app:latest
   docker push mysairegistry.azurecr.io/my-web-app:latest

 Step 3: Provision Infrastructure with Terraform

  1. Write a Terraform script for AKS: Create a file named main.tf:
   2.Initialize,plan and apply Terraform:
      terraform init
      terraform plan
      terraform apply
   3.Configure kubectl to connect to AKS:
       az aks get-credentials --resource-group myrg-group --name myAKSCluster
Step4: Deploy the Application on AKS
      - Write Kubernetes deployment files:
           - deployment.yaml
           - service.yaml
       -Deploy to Aks
          -        kubectl apply -f deployment.yaml
                   kubectl apply -f service.yaml
      -Access the Application: Get the external IP:
                 kubectl get service my-web-app-service

Step5: Install helm
   Install Helm Using the Script:
       Download the Helm binary:
           -  curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3
        Make the script executable:
          -  chmod +x get_helm.sh
        Run the installation script:
          - ./get_helm.sh
        Verify installation:
          -  helm version

         
Step 6: Configure Monitoring with Prometheus
  1.  Install Prometheus on AKS: Use Helm to deploy Prometheus:
       -  helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
          helm repo update
            helm install prometheus prometheus-community/prometheus

   2.   Access Prometheus: Forward the Prometheus UI to localhost:
         -  kubectl port-forward deployment/prometheus-server 9090
                    # Access at http://localhost:9090
   3. Add application metrics: Expose metrics from the application using a library like prometheus-client if needed, or configure 
      Kubernetes-specific metrics.   



Final File Structure:

  .
├── Dockerfile
├── index.html
├── main.tf
├── deployment.yaml
├── service.yaml
├── README.md

  Imges: succesfully created

  ![image](https://github.com/user-attachments/assets/2c0cf3e8-e130-4d91-9dbe-46cf32b26a19)
  ![image](https://github.com/user-attachments/assets/e5fa7c15-f4de-4773-b2b4-485b16d0d4f6)

  ![image](https://github.com/user-attachments/assets/4cf5b3a7-3c2b-4d5e-b789-6e57f38bf55d)

  ![image](https://github.com/user-attachments/assets/369eae75-ddb6-40d4-9767-4cb5c1db9fa0)
  ![image](https://github.com/user-attachments/assets/f70216c9-b5ad-433e-86cc-5669a3d00f25)
  ![image](https://github.com/user-attachments/assets/3ecf4fce-6a7d-46d4-a09b-4345245b7996)
  ![image](https://github.com/user-attachments/assets/0c6ce0d7-e435-4509-b7d4-d7e37d02ea6f)

  ![image](https://github.com/user-attachments/assets/456880f6-6236-4ee9-b6e4-1447e28c1579)







   


  

