# gitlab-runner-pipeline
Project Description: End-to-End DevOps Pipeline for Eureka Microservice Deployment on On-Premises Kubernetes Cluster

This project aims to build an end-to-end DevOps pipeline for deploying a Eureka microservice on an on-premises Kubernetes cluster. The pipeline starts with pushing the code to a GitLab hosting service and ends with the deployment of the microservice to the Kubernetes cluster using ArgoCD.

Here is an overview of the project flow:

Code Versioning: The developer pushes the code to a GitLab hosting service, which serves as the central version control repository.

Continuous Integration (CI) Pipeline: GitLab Runner is configured to start the CI pipeline upon code push. The CI pipeline is responsible for performing code analysis and building the microservice.

a. Code Analysis: The CI pipeline uses SonarQube, which is based on a PostgreSQL database, to perform code analysis on the source code. SonarQube detects code quality issues, bugs, and vulnerabilities.

b. Building the Microservice: Maven is used to build the microservice. In an offline scenario, Maven is configured to point to the local repository for artifacts instead of the remote repository. This ensures dependencies are resolved from the local repository.

c. Docker Image Creation: Once the microservice is built, a Docker image is created for the target JAR file. The Docker image includes all the necessary dependencies and configurations required to run the microservice.

Artifact Repository: The Docker image is deployed to Nexus, which serves as the artifact repository. Nexus securely stores and manages Docker images for subsequent deployment.

Cleanup: After the Docker image is successfully deployed to Nexus, the local host is cleaned up to remove any temporary or unnecessary artifacts.

Deployment and Operations: ArgoCD is deployed on the Kubernetes cluster and synchronized with the GitLab repository.

a. ArgoCD Configuration: ArgoCD is configured to monitor the GitLab repository for changes. Once a change is detected, ArgoCD pulls the updated Docker image from Nexus.

b. Kubernetes Deployment: ArgoCD deploys the new pods with the updated Docker image to the Kubernetes cluster. This ensures that the latest version of the microservice is running in the cluster.

By implementing this end-to-end DevOps pipeline, the project enables continuous integration, code analysis, artifact management, and seamless deployment to the on-premises Kubernetes cluster. It automates the entire software delivery process, ensuring faster and reliable deployments while maintaining code quality and security.
