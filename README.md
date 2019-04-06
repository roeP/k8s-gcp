# Terraform k8s Cluster on GCP

1. Open new project named "tunity" in GCP Console.
2. Create service account named "tunity" with "Editor" permissions and download the key in JSON format
3. Put the key in the /auth directory and rename it to "account.json"
4. Enable Kubernetes Engine API
5. Clone this repository to a machine with docker and terraform installed.
6. Run "terraform init"
7. Run "terraform plan"
8. Run "terraform apply"