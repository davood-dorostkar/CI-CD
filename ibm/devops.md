# DevOps Pipelines & OpenShift

![](/img/devops-pipeline.png)

![](/img/ci-pipeline.png)

![](/img/cd-pipeline.png)

![](/img/comp-pipeline.png)

## OpenShift Pipelines

- a cloud native solution for CI/CD
- relies on Kubernetes objects to automate deployments 
- automate the building, testing, and deployment of applications in a Kubernetes environment
- allows them to leverage the scalability, flexibility, and portability of the Kubernetes
- make use of Tekton

## OpenShift Benefits

- seamlessly integrate Kubernetes tools like Kubecontrol, Helm and operators into CI/CD workflow
- OS Pipelines can easily scale to handle larger workloads. allows to define and reuse pipeline templates across multiple projects or applications. 
- automates the deployment processes across different platforms, whether it's on premise, Cloud, or hybrid

## OpenShift and Tekton
both OpenShift Pipelines and Tekton share include events, triggers, pipelines, tasks, and steps.

OpenShift, in addition, introduces the following:

- A `resource` represents an input or output artifact that is used by tasks within a pipeline. Resources in OpenShift pipelines could include source code repositories, images, configuration files, secrets, and other artifacts. 
- A `condition` is a set of rules or criteria that determines whether a particular task or step should be executed within a pipeline. 
- A `pipelinerun` is a resource that represents the execution of a specific instance of a pipeline. It defines the runtime, configuration and parameters for running a pipeline in OpenShift pipelines. 
- A `taskrun` is a resource that represents the execution of a specific instance of a task within a pipeline. It is created based on a task resource which defines the steps and configuration for a specific task. 

![](/img/os-concepts.png)

## OpenShift Abstraction on Tekton

- simplify the procedure for the creation, deployment, and management of pipelines 
- reduce the complexity of the underlying Tekton framework
- provides a user friendly Web Console 
- It extends Tekton with event based triggers, enabling the automatic triggering of pipelines based on various events within the OpenShift cluster. Examples include code commits, image updates, or external triggers like a timer or an external system response. 
- authentication and authorization mechanisms to secure and control access to Tekton pipelines. 
- rich built in services and capabilities such as image registries, persistent storage, and network features
- It introduces pipeline templates that allow you to define common patterns, configurations, and steps. That can be easily reused across multiple projects.

## OpenShift Dashboard

![](/img/os-menu1.png)
![](/img/os-menu2.png)
![](/img/os-menu3.png)

If you want to add a task and cannot find it in the search bar, first install it with tekton in the CLI:
```
tkn hub install task flake8 
```
then you can find it.

![](/img/os-menu4.png)
![](/img/os-menu5.png)