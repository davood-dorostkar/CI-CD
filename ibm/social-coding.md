# Social Coding

## SCM
Source code management (SCM) or version control system (VCS) is the practice of tracking versions of source code as it is developed.
- This makes it easy to roll back to a previous version if errors occur. 
- It also allows multiple people to work on different parts of the code and merge these changes into a single source of truth.

## Centralized vs Distributed SCM
A centralized SCM stores the code repository and version history centrally, and developers check out pieces of the code and work on it and commit changes back to the central repository. Builds must be done at the central repository because that’s the only place that all of the code exists. 

With a distributed SCM, each developer has a local clone of the entire code repository and version history. This means they can perform local builds because each developer has the complete code locally.

## Social Coding
It can be referred to as "open source for inner source." Social coding is something that open source communities have been doing for years. What’s new is bringing these concepts into the enterprise and coding as a community on internal projects.

### why social coding?
In the past, developers worked in private repositories with limited communications. This meant no possibility of reusing code and as a result, enterprises were continually reinventing the wheel because no one knew the wheel had already been built.

With social coding, all repositories are `public`, and everyone is `encouraged` to fork the code and contribute. This is a vastly different way of thinking. Development teams love to think "this is my code and no one can touch it" but they need to get over that for the good of the company. 

You would think that anarchy would ensue, but actually it works quite well because it’s controlled by the repository owner. The person who owns the repository is still in complete control of the contributions.

### Social coding workflow
1. You open a GitHub issue and assign it to yourself so that everyone knows you’re working on it. 
2. You discuss the new feature with the repo owner, and you agree to develop it for them. 
3. Then you fork the repo, create a branch, and make your changes. 
4. When you’re all done and have something to contribute, you issue a pull request signaling that you are ready for a review and the repo owner can decide whether to merge your code into the main project. 

![](/img/social-coding.png)

### Social coding principles
- The repo owners are in full control. 
  - They can ask for changes. 
  - They can ask you to write more test cases if you don’t have adequate test coverage. 
- They consider you an equal team member 
- this is a win-win situation. You get to leverage another team’s code and functionality, and the other team gets a new feature added for free. 
- The company saves money because code is being reused instead of rewritten and everyone is happy.