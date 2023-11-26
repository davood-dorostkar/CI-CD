# Git Workflow

## What is Git
Git is a distributed source code management tool used by developers worldwide. It was invented by Linus Torvalds in 2005 for Linux kernel development and is now the most widely used version control system. 

- code can be stored locally or kept in a remote repo
- every developer has a full copy
- works locally without any server
- works remotely with Github, Gitlab, and bitbucket

## Why Git for DevOps
This has enabled DevOps methodologies. DevOps benefits from Git because it 
- can handle projects of all sizes, 
- enables non-linear collaboration, 
- and tracks version control to ensure code quality. 

## Git Workflow
- `git add`: move local changes to a staging area. 
- `The staging area` allows developers to clearly separate the changes they want to commit, which may not be all their changes. The staging area is your commit list. What file changes do I want to persist the next time I make a commit? 
- `git commit`: commit those changes to the version history of their local repo. From there, the developer can continue working, 
- or finally push their changes to the remote repo using `git push`, where everyone can see and access those changes. For
- `git fetch`: fetch the most recent metadata of the remote repo, which describes all the version history and branch information, but it does not actually pull the newest code changes. This is so developers can avoid any potential merge conflicts. 
- To get the actual changes, and to download and merge their changes into their own workspace, they can run `git pull,` which will pull the most recent version metadata and any changes. 
- `git checkout`: switch their workspace from one branch to another. 
- You can also use `git checkout` to get back to a previous commit. So, this is great if you’ve gone down a path, you’ve made some changes, and then you decide this isn’t working for me
- `git checkout .`: get you back to your last commit. 
- If a developer has made a commit but realized that their changes are incomplete or incorrect, they can run `git reset --soft` to undo that commit but keep their changes in the staging area. Once they’ve made the necessary fixes, they can commit those changes once again. 
- `git reset ---hard`: It will erase all changes made locally to a specific commit. So be mindful when using this command.

![](/img/git-workflow.png)