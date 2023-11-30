# Tekton Pipelines

All of these become tasks in Tekton that run one after the other. When you put them all together, it’s called a pipeline. 

![](/img/tekton-pipe.png)

## Defining Tasks

All of these definitions are described in `YAML` files called Kubernetes `manifests`. 

Every manifest must define an `API version` to use. 

Tekton defines new custom resource definitions in Kubernetes. You must tell Kubernetes what `kind` of resource to use

you need to give the task a `name` in the `metadata` section by creating a name parameter with a name value

Now, the `specification` section of your manifest starts. A task is a collection of `steps`

then you define a step and give it a `name`. 

Remember that a step is contained within a task, and that task runs on a `pod`. Every step executes in a new `container` in that pod. So, the next thing you need to define is what `image` to use to create that container. You could've used any image that had a Git client installed. 

`Bitnami` maintains a number of images that are great for creating CI/CD pipelines

Next, you need to define the `command` to run inside of that container, and you're going to use the ‘git‘ command to clone the repository. 

you pass in ‘clone’ as the first `argument` and ’$(params.repo-url)’ as the second one.

Parameters are defined with the `params` keyword. You give the parameter the `name`. You can also give it a `description` so that people know what the parameter is for and the `type` so that they know to pass it in a string. 

![](/img/tekton-task.png)

## Parallel Tasks
These two tasks run in parallel because they are both specified to run after the clone task. So, both tasks will run after the clone task completes.

![](/img/test-lint.png)

## Defining Pipelines

Just like the task definition, a pipeline definition is a Kubernetes `manifest`. 

you start by specifying the `API version`. 

Next, you tell it what `kind` of resource this is, and it’s a `pipeline` resource. 

You want to give it a `name`, and again, that’s done in the `metadata` section. 

you can start with your `specifications`. Since you already know that the task you’re going to use has a parameter called repo-url, you define that parameter now by declaring a `parameter` named ‘repo-url’. 

Now you can start adding `tasks` to the pipeline. You `name` your first task ‘clone’. 

you add the `taskRef` keyword, and then reference the name of the task called ‘checkout’. 

You know that the checkout task requires a `parameter`, so you declare that here. The `name` of the parameter you want to address is ‘repo-url’, and the `value` of that repo-url is going to come from ‘params.repo-url’. This means that whatever repo-url you pass into the pipeline will be passed on to any task that requires it.

![](/img/tekton-pipeline.png)

## Run Pipelines

you use the `kube control` command (kubectl) and apply your `task`. 

Next, you use the kubectl again but pointing to the `pipeline` file that contains your pipeline. 

>It’s important to understand that you haven’t actually created a task or pipeline at this point. What you’ve created is a task definition and a pipeline definition. The actual task and pipeline are created by other resources called ‘TaskRun’ and ‘PipelineRun’, respectively. 

run your pipeline using the `Tekton CLI`. 

You add the `--showlog` parameter to display logs on the console. 

You pass in any `parameters` you know the pipeline needs using the `-p` flag.

The Tekton CLI is creating the `PipelineRun` and `TaskRun` resources behind the scenes. These are the resources that create the actual running pipeline and tasks. You could have done this manually and accomplished the same result, but the Tekton CLI automates all of this for you

Then, you wait for the logs to come back.

```
kubectl apply -f mytask.yaml
```
```
kubectl apply -f mypipeline.yaml
```
```
tkn pipeline start mypipeline --showlog -p <param>=<value>
```

![](/img/tekton-run.png)