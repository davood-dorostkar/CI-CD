# Build Image

There are some candidates for building images in tekton hub.

These tools build a source into a container image from a `Dockerfile` and then push it to a container registry:

- docker-build
- buildah

These tools are modular tools that transform application source code into Open Container Initiative (or OCI) images without the need for Dockerfiles:

- buildpacks
- Source-2-Image

## Instal buildah
administrators can install tasks at the `cluster level`. It's always a good idea to see what cluster tasks are installed:
```
tkn clustertask ls
```

if a task is installed at the cluster level there is no need to install it locally into your namespace. Anyone in the cluster can use cluster tasks in their pipelines. 

If it isn’t installed at the cluster level, you can install the buildah task into your local namespace using the Tekton CLI:
```
tkn hub install task buildah
```

## Build
To add buildah to the pipeline, you start by adding a new pipeline parameter call `build-image`. You will pass this parameter to the buildah task. 

Now you can add a new task. You give this task the `name` 'build'. 

you add a definition for the `workspace`. The documentation states that buildah needs a workspace called 'source'.

Next, you `reference` the installed buildah task. If you are using the cluster task version, you must tell Tekton by using the `kind` keyword with a value of `ClusterTask`. This is not needed if you installed it locally in your namespace. 

Now it's time to create a parameter called `IMAGE` because that's the name of the parameter that buildah will look for. 

you specify that this pipeline task should run after both the 'tests' and 'lint' tasks have completed.

![](/img/tkn-build.png)