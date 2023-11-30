# Using environment properties
Cloud native applications should follow the 12-factor guidelines, which define how to deliver software-as-a-service applications.

In particular, it states that configuration should be specified in the environment. every cloud provider has a way of injecting environment properties into the runtime for things like database URIs

## Example
Let's say you have a secret named `redis-creds` defined in your Kubernetes cluster. It has a data value called `database_uri` that contains the base64-encoded credentials and URL to make the database connection.

you can create an environment definition to make this variable available to your task.

![](/img/env-secret.png)

Your test cases are expecting this to be available as an environment variable called `DATABASE_URI`.

In your test task, The name of the variable should be the name of the environment variable that your test cases are expecting. 

You define that the `value` is coming from a secret. The `name` of that secret is "redis-creds", and the data `key` is called "database_uri". 

![](/img/task-env.png)