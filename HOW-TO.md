# Project CI/CD Pipeline and Task Management

This project utilizes a combination of Taskfiles and GitHub Actions to manage tasks and automate the Continuous Integration/Continuous Deployment (CI/CD) pipeline. The setup ensures that different environments (production and development) are handled seamlessly based on the git branch strategy. Here's a breakdown of how everything works:

## Overview

- **Taskfiles**: Task is used as a task runner, offering a simple way to run tasks defined in a `Taskfile.yml`. Different Taskfiles are maintained for different environments (like production and development) to encapsulate environment-specific tasks.
- **GitHub Actions**: Utilized for CI/CD, automating the build, test, and deployment process based on activity in the repository, particularly push events on `master` and `dev` branches.

## Taskfiles

Taskfiles are used locally and in CI/CD pipelines to manage and run predefined tasks such as building, testing, and deploying applications. They bring consistency and ease of use to run complex procedures with simple commands.

- **Local Development**:
  - Developers can run tasks defined in Taskfiles locally by using the `task` command. This is useful for building, running, and testing the application in a development environment.
  - Command to run a task: `task <task-name>`
  - Taskfiles are environment-specific and are located in the respective environment directories (e.g., `iac/envs/dev/Taskfile.yml`).
  - Make sure you have task by running `brew install task`

- **CI/CD Pipeline**:
  - The same Taskfiles are also used in the CI/CD pipeline setup in GitHub Actions. This ensures consistency between local development and the CI/CD environment.
  - The pipeline is configured to install Task and run specific tasks based on the branch that triggered the pipeline.

## GitHub Actions Workflow

The `.github/workflows/ci-cd.yml` file defines the CI/CD pipeline. It is triggered on push events to the `master` and `dev` branches.

- **Branch Strategy**:
  - `master` branch: Changes pushed to `master` are considered ready for production. The pipeline automates the deployment to the production environment.
  - `dev` branch: Used for ongoing development. Changes pushed here are deployed to the development environment for testing and validation.

- **Workflow Steps**:
  - **Checkout**: The workflow checks out the source code for the pushed commit.
  - **Set up Task**: Task is set up in the GitHub Actions runner to enable running tasks defined in Taskfiles.
  - **Environment-Specific Deployment**:
    - If the push is to the `master` branch, tasks related to building and deploying to production are executed.
    - If the push is to the `dev` branch, tasks related to building and deploying to development are executed.

## How to Use

### Locally

- **Running Tasks**: Navigate to the project directory and use the `task` command with the desired task name.
  - Example: `task build-and-push` will build your application and push the Docker image to the registry.

### GitHub Actions

- **Push to Branch**:
  - Push your changes to the respective branch (`master` or `dev`).
  - GitHub Actions will automatically trigger the pipeline defined in `.github/workflows/ci-cd.yml`.
  - Monitor the progress and outcome of your actions in the `Actions` tab of your GitHub repository.

### Important Notes

- **Security**: Ensure that secrets like AWS credentials are securely stored in GitHub Secrets and are referenced appropriately in the GitHub Actions workflow.
- **Validation**: Always validate and test Taskfiles locally before integrating them into the CI/CD pipeline.
- **Documentation**: Keep the Taskfiles and the workflow file well-documented and up to date with the project requirements.

By using this structure, you ensure a streamlined workflow from development to production, with consistency and automation at each step of the development lifecycle.
