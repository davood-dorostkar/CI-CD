# Github Actions Deep Dive

## Event

Probably the most popular events that you will use in your workflows are performing pull requests, pushing code to a branch, or creating a new release.

![](/img/popular-events.png)

- All events start with the keyword `on:` followed by the keyword of the event.
- some events have `types.`  
- Another input to the pull request event is a list of `branches` to monitor. 
- in the last example, This type of event is great for triggering a packaging workflow. For example
  - package your Python code and publish it to PyPI
  - take your Java code and publish it to Maven
  - build a Docker container and publish it to Docker Hub

![](/img/event-example.png)

## Job

A job is a set of steps that use the same runner for execution. 
- Each workflow can have multiple jobs
- Jobs can be named whatever you want 
- By default, jobs run in parallel unless you specify dependencies between them using the `needs` keyword. 
- Each job contains a runner, required services (optional), and a series of steps to execute.
- Because all the steps of a job are executed on the same runner, they can share data with one another. That means you can have a step that checks out your code, another step that compiles your code, and yet another step that may build a Docker container, and all of them share the same code that was checked out in the first step.

![](/img/jobs.png)

### Runner
 A runner is a server that performs a job on a specific platform or operating system. In this list, you can see all the operating systems that GitHub Actions supports. There are several flavors of Ubuntu, macOS, and Windows Server. Once you specify a runner for a job, all of the steps will be executed on that runner. 

 ![](/img/runners-list.png)

 - To specify a runner, you use the `runs-on:` keyword. 

for the last example, you get a virtual machine running the latest Ubuntu version that instantiates a Docker container from the Python 3.9-slim image to run all of your steps. I use this one a lot because I develop in containers, and this allows me to run my build in the same containers to minimize surprises. 

![](/img/runners-examples.png)

### Service

- `Services` are defined as Docker containers. You could use any public Docker image you'd like to create the service, including your own. You can create databases, message queues, or services your workflow needs. 
- Whatever name you use for the service becomes the DNS name that you use to access it. So, in this example, you would look for your Postgres database on a host called postgres. 
- Using services like this allows you to specify the same Docker containers that you use in development for use in your workflows.

![](/img/services.png)

### Step

Steps are the heart of GitHub Actions. A step is a task comprising one or more shell commands or actions.
- Steps can have an optional name specified by the `name:` keyword that displays in the report.
-  If you don’t name your step yourself, the step assumes the name of the command that you're running.
-  Steps can have an optional ID specified by the `id:` keyword. This is useful when you want to use the output of one step as the input parameters for another step. 
-  Steps have either an action specified by the `uses:` keyword or shell commands specified by the `run:` keyword. 
-  You can specify more than one shell command by starting with a `run: |` and then placing each command on a new line.
-  Steps can also have defined environment variables. the `env:` keyword allows you to do this.
-  you can have as many steps as you need in a job

![](/img/steps.png)

## Action
Actions are procedures that can be executed within a step. There is a large library of actions in the GitHub Actions Marketplace community. 
- Defining actions requires the `uses:` keyword followed by the name of the action. 
- Actions can have arguments to configure them by specifying the `with:` keyword followed by name-value pairs. 
- Some actions use the `args:` keyword.

In this example, the codecov action accepts a version as one of its optional parameters. 

![](/img/actions.png)

Always check the GitHub Actions Marketplace for any action you may want to perform.

