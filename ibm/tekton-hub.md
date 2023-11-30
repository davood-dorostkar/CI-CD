# Tekton Hub
it is a repository of Tekton tasks that have been contributed by the community, representing a collection of reusable parts that you can use to build a CI/CD pipeline. It’s located at `hub.tekton.dev`. And before writing your own tasks, you should always check the Tekton catalog to see if someone else has already written one that you can use. 

## Categories
![](/img/tekton-hub.png)

## Using Tasks
These are usually in the form of a Kubernetes manifest written in `YAML` that you can apply with the `kubectl` command. But it's important to also point out that you can also easily install tasks from the hub using the Tekton CLI tool:
```
tkn hub install task <name>
```
### Example
![](/img/tkn-hub-ex.png)

## Workspaces
with Tekton, each task runs in its own pod and every pod is isolated from every other pod. That makes it difficult to transfer data between tasks. You solve this problem by providing a workspace that is a shared volume that each task has access to. This allows them to share data through this volume. 

Workspaces are declared in the PipelineRun, and because they are implemented as a Kubernetes PersistentVolumeClaim, it is up to the PipelineRun to map from the name of the workspace that the pipeline is expecting to a PersistentVolumeClaim that the pipeline can use to store its artifacts.

![](/img/tkn-workspace.png)

### Defining Workspaces
you need to create a `PersistentVolumeClaim`. 

You give it a `name`. 

Then you spec it out using the `default` storage class

request 1 gigabyte of `storage` 

mount it as a `FileSystem` that is read-write. 

![](/img/tkn-ws.png)

### Config PipelineRun

Now you’re ready to create a PipelineRun. You configure it to `generate` a unique name so that every run can be uniquely identified. 

In the spec, you add a reference to the pipeline that you want to run. In this example, it’s a pipeline named "cd-pipeline". Then, 

you declare the `workspaces` by giving it a name
map it to the `PersistentVolumeClaim` (or PVC) that you want to use. 

From this point forward, the pipeline can reference it by the name "pipeline-workspace" and Kubernetes will know to mount the PVC named "pipelinerun-pvc” to each of the pods. 

![](/img/tkn-ws-piperun.png)

### Config Pipeline 
define that a `workspace` named "pipeline-workspace" is required so that any of the tasks that need it can use it. 

You set the `taskRef` to point to the "git-clone" task that you installed from the Tekton catalog. 

If you remember, the git-clone task requires a workspace named `output`, so you define a mapping from the workspace named "pipeline-workspace" to a workspace named "output" for this task. 

>Other tasks can use different workspace names and they can all be mapped back to the single workspace that this pipeline is using. 

![](/img/tkn-ws-pipe.png)

