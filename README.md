Fork of https://github.com/broadinstitute/firecloud-tools to enable registration of a service account via docker

Prerequisites:
* docker
* a google service account
* a user with `iam.serviceAccounts.getAccessToken` rights to the service account (builtin role `iam.serviceAccountTokenCreator` grants this)

Steps:
* build the docker image
  ```
  docker build -t ng-genome/firecloud-tools:latest .
  ```
* use the image in a temporary container
  ```
  docker run --rm -it ng-genome/firecloud-tools bash
  ```
  * login with impersonated ADC (Application Default Credentials)
    ```
    gcloud auth application-default login --impersonate-service-account={service-account}
    ```
  * register the service account with Firecloud without resorting to a service account key
    ```
    python /scripts/register_service_account/register_service_account_no_keyfile.py -e {email} -f fname -l lname
    ```

# Tools for use with FireCloud
To run a given script using the run script:

  * `./run.sh scripts/directory/script_name.py <arguments>`

To run a giving script using Docker:

  * `docker run --rm -it -v "$HOME"/.config:/.config broadinstitute/firecloud-tools python /scripts/<script name.py> <arguments>`

## Prerequisites
* Install the Google Cloud SDK from https://cloud.google.com/sdk/downloads
* Set the Application Default Credentials (run `gcloud auth application-default login`)
* Python 2.7

When running without the run script or docker, check the packages that are pip
installed in either run.sh or the Dockerfile.