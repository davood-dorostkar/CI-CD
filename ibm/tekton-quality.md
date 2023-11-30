# Quality Checks and Testing

in reality, quality checks and unit testing are completely independent. So, quality checks and unit tests can run in parallel. If either one of them fails, the pipeline will stop. This allows you to speed up the pipeline run.

![](/img/tkn-parallel.png)

## Test Automation
You perform `unit` testing in the CI pipeline, and you perform `integration` testing in the CD pipeline. 

For a CD pipeline, this is the final opportunity to check for any problems before the code is deployed. 

`Tekton catalog` has many testing tools to choose from, but what if the tool that you use isn’t in the catalog? In this case, you can simply build your own tasks to run the tool you’re already using to automate your tests. 

### Writing test task
You can use a script in your Tekton task, which means that the same commands your developers are using to test their code locally can be used in your pipeline as well. You can write your own task that uses this script.

![](/img/test-script.png)

you need a `workspace` that the previous tasks in the pipeline can place the code into. A common workspace name that many tasks use for code is `source`, so you name the workspace "source" for consistency.

Since all the steps run in a `container`, you need to specify the name of the image that the container should be created from. 

>specify the image which also your developers use for their development. This should minimize any surprises when testing. 

You want to be sure that when your test command runs, it's in the same directory as the code. You use the `workingDir` option to specify the path of the root of the workspace. 

![](/img/tkn-test.png)

You use the `script` parameter with a vertical bar to indicate that the script will be specified in-line on the lines that follow, and you paste your script below it.

![](/img/tkn-test-step.png)

## Using environment properties
Cloud native applications should follow the 12-factor guidelines, which define how to deliver software-as-a-service applications.

In particular, it states that configuration should be specified in the environment. every cloud provider has a way of injecting environment properties into the runtime for things like database URIs

### Example
Let's say you have a secret named `redis-creds` defined in your Kubernetes cluster. It has a data value called `database_uri` that contains the base64-encoded credentials and URL to make the database connection.

you can create an environment definition to make this variable available to your task.

![](/img/env-secret.png)

Your test cases are expecting this to be available as an environment variable called `DATABASE_URI`.

In your test task, The name of the variable should be the name of the environment variable that your test cases are expecting. 

You define that the `value` is coming from a secret. The `name` of that secret is "redis-creds", and the data `key` is called "database_uri". 

![](/img/task-env.png)


## Parallel Tasks
These two tasks run in parallel because they are both specified to run after the clone task. So, both tasks will run after the clone task completes.

![](/img/test-lint.png)