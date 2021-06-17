# Boston Housing Market Prediction API
=========
## Status: [![leidos-bud](https://circleci.com/gh/leidos-bud/ml-ops-project.svg?style=svg)]()
=========

## Summary
------------
>This project deploys a Machine Learning Microservice API using a pre-trained, sklearn model.  This model has been trained to predict housing prices in Boston according to >several features (including average rooms, highway access, teacher-to-pupil ratios, etc.) 

### Deployment Requirements:
------------
>- A container runtime ( Docker recommended, installation instructions: https://docs.docker.com/engine/install/ )
>- Python 3.7
>- Python venv module
>- Hadolint ( installation instructions: https://github.com/hadolint/hadolint )
>- Kubernetes ( Minikube recommended, installation instructions: https://kubernetes.io/docs/tasks/tools/install-minikube/ )

## Docker Deployment & Usage Instructions
------------
>1. Clone this repo locally and navigate to the repo root folder
>2. Run `python3 -m venv ~/.devops` to prepare a Python virtual environment
>3. Run `source ~/.devops/bin/activate` to activate your Python virtual environment
>4. Run `make install` to install the required Python modules
>5. Run `make lint` to run Hadolint for catching errors in the project files
>6. Run `./run_docker.sh` to build and run the project using Docker
>7. Open a new terminal window/tab and run `./make_prediction.sh` to make a prediction
>8. Output should resemble the `docker_out.txt` file located in the output_txt_files folder
>9. Go back to the terminal running Docker and press Control+C to quit

## Kubernetes Deployment & Usage Instructions 
> ( MUST COMPLETE **ALL** DOCKER DEPLOYMENT STEPS FIRST )
------------
>1. Edit the `upload_docker.sh` script and update the `dockerpath` as needed
>2. Run `./upload_docker.sh` to upload your Docker image
>3. Start minikube (or other Kubernetes solution)
>4. Edit the `run_kubernetes.sh` script and update the `dockerpath` as needed
>5. Run `./run_kubernetes.sh` to create a Kubernetes deployment
>6. Wait until you see the following lines
>>    Forwarding from 127.0.0.1:8000 -> 80
>>    Forwarding from [::1]:8000 -> 80
>7. Open a new terminal window/tab and run `./make_prediction.sh` to make a prediction
>8. Output should resemble the `kubernetes_out.txt` file located in the output_txt_files folder
>9. Go back to the terminal running Kubernetes and press Control+C to quit


## Folder Structure
------------
```
├─app.py                                  - Python application
├─.circleci
├─────config.yml                          - CircleCI CI/CD Linting
├─Dockerfile                              - Docker Image Definition
├─.gitignore                              - Git File/Folder Ignore Definition
├─Makefile                                - Build Instructions
├─make_prediction.sh                      - BASH Script for Making Predictions
├─model_data
├─────boston_housing_prediction.joblib    - Pre-trained Model
├─────housing.csv                         - Housing Data Information
├─output_txt_files
├─────docker_out.txt                      - Sample Output From Docker Prediction
├─────kubernetes_out.txt                  - Sample Output From Kubernetes Prediction
├─README.md                               - This Document
├─requirements.txt                        - Required Python Modules ( installed by Makefile )
├─run_docker.sh                           - BASH Script for Building and Running Docker Image
├─run_kubernetes.sh                       - BASH Script for Creating Kubernetes Deployment
└─upload_docker.sh                        - BASH Script for Pushing (uploading) Docker Image
```
