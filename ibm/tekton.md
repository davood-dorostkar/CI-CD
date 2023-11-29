# Intro to Tekton

- Tekton is a flexible, open source framework for creating CI/CD pipelines. 
- allows to create CI/CD pipelines, from very simple to very elaborate. 
- build, test, and deploy applications automatically. It has the ability to run steps in series or in parallel so you are in complete control of the execution sequence. 
- both `cloud` providers and `on-premises` systems. So you can use Tekton in your local data center as well as on the cloud. Anywhere you can run a Kubernetes cluster, you can run Tekton.

## Benefits of Tekton
### standardization
Because Tekton is an open source project and it’s vendor neutral, Tekton allows you to standardize your CI/CD tooling and processes across vendors, languages, and deployment environments. Many popular CI/CD tools like Jenkins X, Skaffold, and Knative use Tekton as their base.

### built-in best practices and cloud native
offers built-in best practices because it is logically laid out. You can quickly create CI/CD systems that are scalable, serverless, and best of all, cloud native right out of the box. That means that Tekton runs natively on your Kubernetes cluster, eliminating the need for a separate CI/CD solution.

### maximizes flexibility and customization
in how you design and customize your CI/CD pipelines. It satisfies your teams’ needs by abstracting the underlying implementation

## Tekton Building Blocks
There is an external `event` that causes a trigger to fire. This might be a pull request or a push to a Git repository. 

A `trigger` is fired by an event and is the stimulus that starts a pipeline run, which executes a pipeline. 

`pipelines` are collections of tasks to execute. There's no limit to the number of tasks you could have in a pipeline, and these tasks can execute serially or in parallel. 

A `task` is a unit of work that comprises one or more steps. It can also define parameters required to carry out the steps and workspaces needed to store artifacts. 

`steps` are the actual commands that are executed to carry out the tasks. These can be anything you like, but most often, they are shell scripts.

![](/img/tekton-blocks.png)

## Physical Building Blocks

Tekton is a set of Kubernetes custom resource definitions, or `CRDs`.  

you have a CRD called `EventListener` that listens for events like pull requests or commits on a Git repository. Events are associated with two other CRDs. 

The `TriggerBinding` captures parameters from the event that are required to run the pipeline. The second CRD that events are associated with is the `TriggerTemplate`, which takes the parameters from the TriggerBinding and associates them with the PipelineRun. 

When triggered the TriggerTemplate creates a `PipelineRun`, passing along any parameters from the triggered event, or persistent storage, that the pipeline might need. 

The PipelineRun is what instantiates a `pipeline`. A pipeline is a collection of tasks. These tasks can run in parallel, by default, or they can run serially. 

And each `task` comprises a series of steps. 

The `steps` run in the sequence specified in the task. When a pipeline executes, the PipelineRun CRD is responsible for managing the tasks. 

It does this by creating a TaskRun for each task, which, in turn, creates a Kubernetes `pod` for the task to run in. All the steps for a task run in the same pod. 

As the steps are executed, a `container` is created in the pod, one for each step to run in. 

Usually, a `PersistentVolumeClaim` is created, and the storage is attached to all the pods so that they can share `artifacts` throughout the pipeline. This allows you to check out code in one task, run unit tests on it in another task, and create a container image from it in yet another task. 

>Everything about Tekton is `Kubernetes native`. Everything is running in your Kubernetes cluster with `no external CI/CD` servers required. This is one of the things that makes Tekton the perfect technology for CI/CD with Kubernetes.

![](/img/tekton-process.png)