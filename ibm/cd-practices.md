# CD Best Practices
- make every change releasable
  >This means you should always include user documentation, operations runbooks, and information about what your change does. This ensures that every change will work and be documented well enough to be delivered to customers as well as serve any audit that may occur. 
- Embrace trunk-based development
  >avoid delaying any integration caused by long-lived branches. You want to use short-lived feature branches that are continuously integrated into the main codebase.
  >Every change is built, tested, and deployed together for the fastest feedback.
- Deliver through an automated pipeline
- Automate as many processes as possible
- Eliminate downtime
  >when you push a new function to production, you must first validate it before deploying it
- release at the granularity of test
  >If two parts of the system must be tested together, they should be released together so that you know that the parts of your system are compatible. Alternatively, you can fully decouple. 

## CI/CD requirements
### A code repository
Your source code management system is the single version of the truth. Everything you need to build and release your code must be checked into version control.

### A build server
You want that environment to perform clean builds, starting from the same state every time.

### An integration server/orchestrator
it handles the build automation and runs tests against your code. There should be no manual steps. Everything should be automated.

### A storage repository
stores all the binaries and artifacts of the application so that once built and tested, they can be deployed easily.

## Deployment vs Delivery
- Continuous Deployment can be part of a Continuous Delivery pipeline.
- Continuous Delivery is the automated movement of code through SDLC once it passes the required automation tests. 
- Continuous Deployment is taking that delivered code and deploying it to production.
- The need for continuous deployment depends on business needs