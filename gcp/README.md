# GCP autoscaling group to run bombardier on GCP spot instances via VPN

# Prerequisites

1. Create service key https://learn.hashicorp.com/tutorials/terraform/google-cloud-platform-build?in=terraform/gcp-get-started#set-up-gcp
2. Copy service key into same directory as main.tf and name it `key.json`
3. Install terraform

Windows
```
choco install terraform
```

Linux (or Windows + WSL2)
```
sudo apt-get update
sudo apt-get install -y gnupg software-properties-common curl
curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -
sudo apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"
sudo apt-get update
sudo apt-get install -y terraform
```

4. Run terraform
```
TF_VAR_COUNT=8 TF_VAR_PROJECT=your-project-14224 TF_VAR_REGION=us-central1 TF_VAR_ZONE=us-central1-c terraform apply
```
```
TF_VAR_COUNT - Amount of instances to keep running (default 3)
TF_VAR_PROJECT - Name of your GCP project
TF_VAR_REGION - Region to launch in (default us-central1)
TF_VAR_ZONE - Zone to launch in (default us-central1-c)
```

