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

## Search in Hub
You can also add the `--kinds` flag to indicate that you’re only searching for tasks right now. 

```
tkn hub search --kinds task build
```

## Get information

You can get more information on a task from the command line without going to Tekton Hub. 
```
tkn hub info task <name>
```
