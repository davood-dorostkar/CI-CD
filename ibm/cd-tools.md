# CD Tools
## Overview
### Jenkins
- one of the oldest - one of the most popular. It has a huge community, and supports countless plugins
- it’s not ideal for CD. Jenkins does not provide visibility into the pipeline process, and requires a lot of setup and maintenance, making it uncompetitive compared to other CD tools.

### Spinnaker
- is a dedicated cloud-agnostic CD tool built in-house by Netflix. 
- It allows you to manage CD pipelines and simplifies release rollbacks. 
- It supports the creation of load balancers and scale clusters all natively.
- but s not a build tool

### Concourse
- mainly is a CI tool that also contains CD capabilities 
- build in containers or virtual machines
- due to the container-first approach, every step of the build is very flexible

### GitLab 
- can implement both CI and CD 
- easy to automate the process of deploying code to production since GitLab is also a source code manager
- supports all major cloud platforms, making the CI/CD pipeline very flexible to build

### Travis CI
- another CI tool that contains CD capabilities
- not as feature-rich as other CD implementations, but it requires minimal maintenance

### Tekton
- enables you to build, test, and deploy apps in Kubernetes using an open source, vendor-neutral framework
- Its main strength is its modularity, allowing you to deploy across multiple environments such as VMs, serverless, Kubernetes, and cloud providers

### Go CD
- easy pipeline setup with native Docker and Kubernetes support 
- It comes with its own Value Stream Map tool that helps you trace each pipeline through all of the stages between commit and deployment
- You can build pipelines with YAML or JSON files in a visual UI

### Argo CD 
- was originally developed by Intuit, as they were looking for a lighter tool than Spinnaker that would improve build and deployment times and streamline their GitOps workflow. 
- The UI is well made and easy to use and integrates well with a variety of CI tools such as Jenkins, GitHub Actions, CircleCI, and more.

## Main Factors to consider

### Feature richness
full audit trails; proprietary integrated secrets; and fine-grained, role-based access control

it means that once your applications become more complex with more moving parts, you will already have the features at your disposal

### Compatibility
a tool that is compatible and easily integrates with your current toolset makes setting up CD faster and reduces potential headaches.

### Ease of use/setup
Tools like Tekton are easy to set up and provide clear insights into your pipelines. 

### Maintenance effort
Tools like Argo CD are easy to set up and maintain, while Jenkins is a handful to both set up and maintain.

## Tools you need in CD

### security scanning
By adding security checks to your pipeline, every change that you make along the way is tested to be secure. 

### Vulnerability scanning
helps identify dependencies and components vulnerabilities. Applications that are not vulnerable one day suddenly become vulnerable because of exploits found in existing code or libraries. 

### Secret scanning 
for API keys and credentials prevents accidental exposure of sensitive information. 

### Static Application Security Testing (or SAST) scanning
identifies vulnerabilities of the entire code base such as SQL injections and cross-site scripting. While some of these mistakes might get identified during code reviews, it’s important to ensure that your CD pipeline is checking for them in case your developers forget to. 

### Dynamic Application Security Testing (or DAST) scans 
for incorrect security assumptions that may be hidden in the source code. Dynamic scanning checks the running application for weak spots. Better to catch these in your CD pipeline than have malicious users find them in production. 

### Deployment
Automating deployments ensures that they are repeatable so that you get the same results regardless of whether you are deploying to development, test, staging, or production.

