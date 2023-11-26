# Intro to GitHub Actions
- available on every repository in GitHub
- it is attractive because it's integrated into GitHub as a service. There's nothing extra that you have to add; there's nothing that you have to sign up for.
- treat your CI pipeline as code just like all the other CI/CD tools
- Unlike other tools, all you need is a `.yaml` file to store the workflow definitions in a folder called `.github/workflows`
- It doesn't matter what name you give these YAML files because each file describes when they should be triggered

## Marketplace
- hosts actions that you can use in your workflows
- large variety of actions for almost any language and step that you need to perform
- jumpstarts your workflows. Before writing a script to perform some action, I always check the marketplace to see if somebody has already created an action for it, and most of the time, someone has

![](/img/actions-market.png)

## Setup
- unlike many of its competitors like Jenkins, Circle CI, and Travis CI, there's no website to manually set up anything 
- All you need is to create a workflows folder and add the YAML files that represent your workflow
    > This makes it not only simple to get started but ensures that your CI/CD workflows are reproducible because there’s no manual steps involved

- you can select from the functional workflow templates and edit them for your situation

## Basic Concepts
### Workflow
- a series of automated procedures represented as jobs and steps that GitHub Actions executes
- Every repository can have any number of workflows
- Each workflow has the following components: 
  - It has an `event` that tells it when the workflow should run.
    - when you push to a repo
    - create a pull request
    - create a release 
  - it uses `runners` to execute the jobs. There are built-in runners for different virtual environments, or you can use a self-hosted runner in your environment. 
  - it contains one or more `jobs`. 
    - builds your component 
    - publishes it to an artifact repository
    - deploys it to an environment
  - Each job can contain one or more `steps`
    - check out the code
    - compile the code
    - run a linter on the code
    - runs a suite of test cases
  - each step can contain one or more `actions` or shell commands. Actions are the lowest level of a workflow. They perform a single task
    - check out code
    - install dependencies
    - compile code
    - run tests

![](/img/actions-hierarchy.png)