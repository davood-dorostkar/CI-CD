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