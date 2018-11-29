# Drone Firebase deploy plugin

[![Build Status](https://travis-ci.org/maximelebastard/drone-firebase-plugin.svg?branch=master)](https://travis-ci.org/maximelebastard/drone-firebase-plugin)

Lightweight drone plugin to use the deploy command from the Firebase CLI.

## Usage

```yaml
pipeline:
  copy:
    image: maximelebastard/drone-firebase-plugin
    project_id: FirebaseProjectId
    message: CI deploy of commit ${COMMIT}
    dir: ./
    secrets:
      - source: MY_TOKEN_IN_DRONE_SECRETS
        target: FIREBASE_TOKEN
    when:
      event: deployment
```


## Parameters

The FIREBASE_TOKEN secret should be exposed.

* **project_id** : Identifier of the firebase project
* **message**: Deployment message
* **dir**: Path of your project
> dir must contain a firebase.json and a .firebaserc file
* **only**: See the only parameter https://firebase.google.com/docs/cli/

## Secrets

Run `firebase login:ci` locally to get a FIREBASE_TOKEN

Make sure it is exposed through the FIREBASE_TOKEN secret.