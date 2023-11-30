# Triggers & Events

The TriggerBinding CRD, which takes data from the event and binds it to the properties in your pipeline. And the TriggerTemplate CRD, which takes data from the binding and instantiates a PipelineRun

![](/img/tekton-listener.png)

When some external event happens, it's sent to the EventListener pod, which causes the TriggerBinding to be instantiated and pull information from the event and bind it to the parameters that the pipeline needs. The parameters from the TriggerBinding are then forwarded to the TriggerTemplate. The TriggerTemplate is defined as a PipelineRun which, as its name implies, runs your pipeline.

![](/img/tekton-trig-template.png)

## Defining EventListener
You start by specifying the `API version`, which is `triggers.tekton.dev/v1beta1`. 

you specify the `kind` of resource, which is an `EventListener`. 

Using the `metadata`, you give it the name "cd-listener". 

Now you can add the `specifications`. You specify the `serviceAccountName` of the ServiceAccount that the pipeline should run under. In OpenShift, there is a preconfigured ServiceAccount named "pipeline" that is configured with the access control needed to run a pipeline, so you use that. 

specify the `triggers` for this EventListener. You specify a `binding` with the name "cd-binding", and a `template` with the name "cd-template". 

 ![](/img/tekton-elistener.png)

## Defining TriggerBinding

specify the resource `kind` as `TriggerBinding`. Using the metadata, you give it the `name`  that matches the name in the EventListener. 

The first parameter has the name "repository" with the value `body.repository.url`. This is very specific to the body of the incoming event. To figure this out for GitHub, you would look at the JSON file coming from the body of a GitHub event to understand where to pull these parameters from. 

The second parameter has the name "branch" with a value that comes from `body.ref`. 

![](/img/tekton-tbind.png)

## Defining TriggerTemplate

you specify the kind as `TriggerTemplate`. Using the metadata, you give it the name that matches the name in the EventListener. 

the `default` value will be used if a parameter called repository is not passed in by the trigger binding. 

The `resourcetemplates` section of the TriggerTemplate contains a `PipelineRun` resource. 

you could give it a name, or in this case, you could use `generateName` and specify a partial name. This generates a unique ID and appends it to the partial name that you supply. 

you need to specify the `serviceAccountName` of the ServiceAccount that runs the pipeline, 

Now you specify the `pipelineRef`, which is a reference to the pipeline that you want to run. 

it needs a parameter for the repository, but you are using a different name here. That's because you need to use the name that is specified by the pipeline you are calling. The pipeline has defined this as "repo-url" so that's what you need to pass in. You get the value from the params section of this TriggerTemplate, so you reference it as `$(tt.params.repository)`. 

![](/img/tekton-tt.png)

![](/img/tekton-resource.png)

![](/img/tekton-trigger-flow.png)

## Port Forwarding

you need to locally expose the event listener, to test the trigger. Normally, you would set up an `Ingress` (load balancer) to expose the EventListener as an endpoint, but for a quick check, you can use the Kubernetes `port-forward` command. This forwards the port the EventListener is listening on, which is port `8080`, to any port that you want. 

![](/img/kube-port-forward.png)

## Event Structure

set the `Content-Type` in the `header` to specify that the payload that you are sending is `application/json`. And finally, you use the `-d` parameter to send the data in JSON format. 

If you remember, you told the TriggerBinding to get the repository parameter from (body.repository.url), so the body of your JSON message has a "repository" attribute with a "url" attribute under it. 

![](/img/tekton-pipelinerun.png)