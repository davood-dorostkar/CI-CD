# Git feature branch workflow
1. You start by `cloning` the repo 
2. creating a `branch`
   > You want to make sure that you create a new branch for every new feature that you work on. 
3. as you're working on your code making changes, you’ll want to `commit` those changes. 
   > A commit gives you a checkpoint to go back to, so don't be afraid to make as many commits as you need. 
4. At some point, you're going to want to `push` those changes to a remote branch. 
   > This is like having a remote backup, so it’s recommended you push your changes to a remote branch as often as needed; at least once a day. 
5. Then you open a `pull request`. 
   > It might be when you're finished, or it might be in the middle of doing development because you need to show people your code and ask questions. This is where discuss and review comes into play. This is all part of social coding. 
6.  Once your changes have been reviewed, they will then get deployed to `testing`. 
7.  And once all the tests have passed, then you could `merge` the code back into the main branch.


![](/img/git-feature-branch.png)

# Git feature branch example
The whole process has three key components. 
1. We want to work off the latest code available, 
2. create a new branch to store our changes, 
3. and set up a remote branch to push our changes to. 

![](/img/git-workflow-ex1.png)

![](/img/git-workflow-ex2.png)