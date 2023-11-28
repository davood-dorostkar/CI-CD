# Understanding CD
## CI vs CD
Continuous Integration is continuously integrating your code back into the main or master or trunk branch, so it shouldn't get too far away before you merge stuff back into the main branch to make sure that it works.

You are continuously integrating your code, with the main code. Whereas Continuous Delivery is then taking that integrated code and deploying it somewhere.  when you finally merge to your main branch, you kick off the Continuous Delivery part.

## CD Definition
The term Continuous Delivery can be defined as a series of practices designed to ensure that code can be rapidly and safely deployed to production by delivering every change to a production-like environment. Notice that is says `production-like`. It doesn’t have to be a production environment and many times it’s not. 

In fact, deploying to production is usually called `Continuous Deployment`. Continuous Delivery just means that you are deploying the code to a development, or test, or staging environment to 
- ensure that the code can be deployed
- give everyone a chance to see the code working
- The key takeaway is that this is automated. Nobody performed any manual steps to deploy the code. It is continuously deployed automatically.

## Goals of CD

> Martin Fowler: Continuous Delivery is a software development discipline where you build software in such a way that the software can be released to production at any time.

- main branch must always be deployable
- you have a set of checks to make sure that you don't get bad code into that main branch, that could break your product
- that's why you use Continuous Integration to run the tests every time there's a pull request. 
- Working in separate feature branches and using pull requests ensures that any code you have written is working correctly before you merge it back into the main branch.

## Benefits of CD
- Automate software transportation through SDLC stages
- Reduce deployment time
  
  > The more you deploy, the more confidence you have that your next deployment will work, and the less time you spend debugging deployments.
- Reduce costs
  
  > people costs, infrastructure costs, and the cost of lost time due to manual failures.
- enables development team to scale their software deployments based on the size of the project.
- deploy code automatically into the various stages of SDLC
  
  > Once you have deployed to the development environment without incident, and to the test environment, and then the staging environment all without incident, the chances are pretty good that when you deploy to production that will also be without incident.
