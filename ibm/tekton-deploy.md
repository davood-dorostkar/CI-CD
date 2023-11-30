# Deployment with Tekton

There are many ways that you can choose to deploy your application to Kubernetes:
- `kubectl` command
- `oc` (or OpenShift Cluster CLI) command if you're deploying to an OpenShift cluster
  
  Many of the `oc` commands work with native Kubernetes as well because `oc` is a proper superset of 'kubectl'
- most people deploy using Kubernetes manifests in the form of `YAML` files 
- a tool called `kustomize`, which is now part of the kubectl command, that allows you to customize those deployments to different environments on the fly with minimal changes to your manifest files. 

## OpenShift Client
check if installed in cluster level
```
tkn clustertask ls
```
if not, install it:
```
tkn hub install task openshift-client
```
If you look at the documentation on Tekton Hub, you see that it requires only one parameter with the name `SCRIPT` that represents the script you want to run. It also specifies an optional parameter named `manifest-dir` if you have any manifests you want to deploy from.

## Deploy Task
You can reuse the pipeline parameter called `build-image` from the build task. This is the nice thing about pipeline parameters, you can reuse them across multiple pipeline tasks. 

add a new pipeline parameter for the `application name` to be used later with the 'oc' command. 

you `reference` the openshift-client task you installed. If you are using the cluster task version, you must tell Tekton by using the 'kind' keyword with the ClusterTask value. This is not needed if you installed it locally in your namespace. 

create a `parameter` called 'SCRIPT' because that's the name of the parameter that openshift-client will look for. 

You use the `oc create deploy` command, passing it the name of the application and the name of the image from the pipeline parameters.

![](/img/oc-deploy.png)

## Alternative Deploy (using kube manifest)
Let's say you have Kubernetes manifests in the form of `YAML` files that specify the resources that you want to deploy. 

>You don't need any pipeline parameters for this task. Everything will be specified in the manifests. 

The documentation stated that the openshift-client task can use an optional workspace named `manifest-dir`, so you make that the name and use your pipeline-workspace persistent volume claim. 

In this script version, you want to `apply` all the Kubernetes manifests in the 'deploy/' folder that contains the manifest files. That folder is why you added the 'manifest-dir’ workspace. 

you `wait` for the deployment to roll out, and then `list` the pods.

![](/img/deploy-manifest.png)