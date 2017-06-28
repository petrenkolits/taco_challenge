# Taco Challange
This app represents simple Rails-API app that serves as API for given Angular app. Available actions are:
  - load tacos list
  - create taco
  - delete selected taco

## Architecture tips
The app is using MongoDB as it's most obvious option for this take on. Application architecture decouples business logics into set of Interaction classes which do validations and data manipulations thru domain classes (models). Thereby, if applications gets bigger and gains more complex mechanics and business logics it allows to keep models and controllers tidy while having entire code base isolated in certain interaction classes related to particular action.

## Pre-requires
  - MRI Ruby v2.4.1 (parhaps it will work with recent JRuby)
  - MongoDB installed locally

## How to run
  - unpack/download repo files
  - cd into app's folder and run `bundle`
  - run locally installed MongoDB
  - after `bundle` completes run the app with `rails s`
  - go to http://localhost:3000 to open 'taco page'
  - go to http://localhost:3000/api/docs to explore API documentations

## Deployment
Unfortunatelly it's not covered during this take on.

## Tests and documentation
Kudos to `apitome` and `rspec_api_documentation` gems which help to automate API documentation creation based on acceptance tests. Unit tests are not added, but it's good to have them to cover edge cases on controllers, and, if app gets bigger, on paricular service classes (mailing, push notifications, background jobs & etc.).

## Changes to existing Angular app
There is additional error handling introduced to given Angular app to display proper error messages based on API responses.
