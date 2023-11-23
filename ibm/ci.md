# Continuous Integration

## What is CI
- Continuous Integration is an automation process that enables the continuous integration of code changes back into the main codebase. 
- It allows developers to regularly integrate their work into a repository so that their changes don’t drift too far from the main, branch. 
- When a developer pushes their work into the source code repository, it ensures that the software continues working properly by automatically running a series of tests to detect any breakage. 
- CI helps to enable collaborative development across the teams because even if a developer forgets to run their unit tests, the CI process will run the tests for them and alert them of any failures. 
- helps to identify any integration bugs sooner rather than later.

## Difference with traditional development

Traditionally, developers work on large features or fixes and commit them into their own development branches. These branches can exist for a long time, have a large scope, and generally require many code changes and edits. When development is completed on these branches, only then are they tested and merged into the main branch and built for production. This development method can cause drift between the main branch and the development branch, among other issues.

### 1. Short-lived branches
These branches are only meant for developing small features that contribute to the code so they can be merged back into the main or master branch quickly. The branch is deleted after it’s merged as its only purpose was to develop that small feature. 

benefits: 
1. It reduces drift that may occur between feature branches and the main branch. 
2. And critical or essential fixes may be implemented differently by multiple developers when working on their features. But with CI, developers can quickly implement a single fix that will be tested and merged, reducing parallel changes. 
3. Ultimately, this means you can deploy your code faster overall, as you don’t need to run through a large code review because you have been checking the changes every time they’ve been pushed.

### 2. Frequent pull requests
Making frequent pull requests back to the master or main branch is a best practice. 
- These pull requests are meant to contain code updates that serve a specific purpose. It makes code changes cleaner and easier to understand. 
- A pull request requires approval from a repository maintainer or owner to be successfully merged. At a minimum, no one should be able to approve their own pull request. 
- These frequent pull requests serve as small pieces of a much bigger puzzle, making it easy to build upon the most updated code. 

benefits: 
1. Each pull request needs to be reviewed, which facilitates increased collaboration among developers. 
2. It also enables developers to react quickly. Required changes can be tested and put into production faster, so solutions can get to the customer faster. 
3. And due to the frequency of Continuous Integration, you know exactly how much functionality you have built to date, reducing management risk.

### 3. Continuous Integration can be automated
- Automated CI tools subscribe to events such as pull requests and file changes using `webhooks` that can then trigger a `workflow`. That workflow can be anything, such as building an application. 
- Once complete, these tools report back with messages of a successful or failed build. These tools can run tests that ensure your file changes or pull requests don’t break the entire application. 
- With these automation tools, you can simplify your development process so that testing and checking your code is never tedious.