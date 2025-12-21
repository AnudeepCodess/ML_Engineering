# Building and Pushing Docker Images to GCP GCR

This guide provides step-by-step instructions for building and pushing a Docker image to Google Container Registry (GCR) using Google Cloud Build.

## Prerequisites

- Access to a GCP project with the necessary permissions
- A GCP project ID ready for use

## Steps

### 1. Create a VM Instance

Set up a new VM instance in your GCP project with appropriate configurations.

### 2. SSH into the VM Instance

Connect to your VM instance via SSH. Ensure you're using a Linux or Ubuntu-based operating system.

### 3. Install Docker

Follow the official Docker installation guide for Ubuntu:
https://docs.docker.com/engine/install/ubuntu/

### 4. Clone the Repository

Clone your project repository to the VM instance:

```bash
git clone <repository-url>
```

### 5. Edit the YAML Configuration File

Update the `cloudbuild.yaml` file with your GCP project ID:

```bash
nano cloudbuild.yaml
# or use your preferred editor
```

Replace `<PROJECT_ID>` with your actual GCP project ID and Image Name.

### 6. Navigate to the CI/CD Directory

Change to the CI/CD directory and verify the files:

```bash
cd ML_Engineering/CI_CD
ls
```

Confirm that all necessary files are present, including `cloudbuild.yaml`.

### 7. Verify gcloud Installation

Check if the gcloud CLI is installed on your system:

```bash
gcloud
```

If not installed, install the [Google Cloud SDK](https://cloud.google.com/sdk/docs/install).

### 8. Submit the Build to Cloud Build

Execute the Cloud Build process:

```bash
gcloud builds submit --config cloudbuild.yaml .
```

#### What Happens During `gcloud builds submit`:

- **8.1** Cloud Build uploads the current directory to Google Cloud Storage
- **8.2** Cloud Build reads the `cloudbuild.yaml` file and executes each step in a separate container
- **8.3** The Docker image is built according to your Dockerfile configuration
- **8.4** The built image is pushed to Google Container Registry (GCR)
- **8.5** Upon completion, your image is available at:

```
gcr.io/<PROJECT_ID>/<IMAGE_NAME>
```

## Cleanup (Optional)

If you need to delete the directory:

```bash
sudo rm -r ML_Engineering
```

---

## Useful References

- [Google Cloud Build Documentation](https://cloud.google.com/build/docs)
- [Google Container Registry Documentation](https://cloud.google.com/container-registry/docs)
- [Docker Documentation](https://docs.docker.com/)