# CI Tools

## Jenkins

- it is open source
- you can run your own Jenkins servers
- large ecosystem of plugins to integrate with other tools such as Docker, Jira, and Maven
- this means there are many plugins to manage
- describes the CI pipeline using the ‘Groovy’ language in a Jenkinsfile
- Jenkinsfile enables developers to treat their CI/CD pipelines as code

![](/img/jenkinsfile.png)

### How Jenkins works
- you first need to set up your project on the Jenkins website; it means manual steps that are not automatable and may not be reproducible other tools allow you to specify a pipeline simply by adding a file to your repository, making them very repeatable
- you need to create a `Jenkinsfile` to specify the CI instructions and place it in the root of your project repository
- Jenkins can build your code in a virtual machine or inside a Docker container
- you must configure trigger actions on the Jenkins server using the UI

![](/img/jenkins-pipeline.png)

## CircleCI
- it’s a service, you can’t run this on your own server like you can with Jenkins
- it’s not open source
- uses a YAML file to specify the CI process
- natively supports languages such as Closure, Java, JavaScript, Python, PHP, and some others
- supports databases such as MySQL, MongoDB, and Postgres
- since it supports Docker, anything you can build in Docker, you can build with CircleCI

![](/img/circleci-yaml.png)

### How CircleCi works
- first set up your project on the CircleCI website. Unfortunately, this is a manual step
- create a `.circleci/config.yml` file to specify the CI instructions
-  It can build your code in a virtual machine or inside a Docker container
- specify what actions trigger a build

![](/img/circleci-pipeline.png)

## TravisCI
- Like CircleCI, Travis CI is a hosted service, which means you cannot run it on your own servers
- You can, however, get an enterprise license and run it internally in your own company
- like CircleCI and Jenkins, you must set up your project first in their admin UI, which is a manual step
- It enables developers to treat their CI/CD pipelines as code 
- Unlike CircleCI, it supports many more languages and databases natively, as well as Docker, so you can really run anything with Travis CI
- like CircleCI, you use a YAML file to specify the CI process

![](/img/travis-yml.png)

### How TravisCi works
- set up your project on the Travis CI website. This is a manual step, but unlike Jenkins and CircleCI, it only has to be done once for all of your repos
- create a `.travis.yml` file and place it in the root of your repository
- You can build your code in a virtual machine or in a Docker container
- you can specify what actions trigger a build, but unlike the other tools, this is not done in the .travis.yml file. It can only be done manually from the Travis CI admin UI, just like Jenkins, which is a drawback

![](/img/travis-pipeline.png)

## GitHub Actions
- available in every GitHub repository
- integrated into GitHub as a service
- allows you to treat your CI pipeline as code
- and is controlled by YAML files