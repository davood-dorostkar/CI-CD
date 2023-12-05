## Setup CircleCI
1. Sign up in circleCI with github. It will automatically import your repositories.

2. Setup the project in the circleci panel.

![](/circleci/1.png)

![](/circleci/2.png)

* Set the branch you need to track. 

![](/circleci/3.png)

* if you have made and pushed your config.yml before: Select the first option
* if it is the first time: select the last option
* Choose your language and download the template config file. then put it in your project code.
> If working on `Jest` tests in front-end, use `Node orb-free-workflow`.

## Config the Project
[sample config](/circleci/config.yml)

3. In your repo, make a folder `.circleci` inside which a file `config.yml`. 

![](/circleci/4.png)

4. Add steps to prepare the container and tests. For `jest` you may need:
```
- run:
    name: install packages
    command: npm ci
- run:
    name: install dependencies
    command: npm i --save-dev jest-cli jest babel-jest @babel/preset-env jest-environment-jsdom canvas
```
5. Change the version of your container you need. for example check your `Node` version. Check existing containers in circleci [docker hub](https://hub.docker.com/u/cimg). then change it:
```
docker:
  - image: cimg/node:14.15.4
```
## CirclCI badge
[help](https://circleci.com/docs/status-badges)
 
1. In project's `readme.md`, add the badge code:
```
[![CircleCI](https://circleci.com/gh/davood-dorostkar/isorter.svg?style=shield&circle-token=XXXXXXXXXXXXXXXXXXX)](google.com)
```
2. If your repo is private you need the token. otherwise remove it. find the token in your circleci: go to the project's settings. go to `API permissions`. then add new token. 

![](/circleci/5.png)

3. to change its style, use either `style=svg` or `style=shield` in the badge code.