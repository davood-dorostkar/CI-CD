# Benefits of CI
## 1. Faster code-change reaction time
- the change gets tested, so even if you forgot to run the tests, the CI tool will `test` it.
- even if you forgot to check if the `build` works, the CI tool will check it.
- you can deliver the solution into your customers’ hands more quickly

## 2. Reduced code integration risk
you're integrating smaller and smaller things. Smaller changes mean less risk of something going wrong. So, you're not having to integrate 100,000 lines of code into your millions of lines of code in your code-base. Those days are over. You’re only having to integrate maybe 10, 20, 30, or 50 lines of code for example.

## 3. Higher code quality
because things are **constantly** being reviewed and constantly being tested. Every pull request is an opportunity for a code review. Forget about **scheduling** code reviews as a separate task. 

best practice is when someone makes a pull request, you should go and look at the code. Having another set of eyes looking at what was changed is always going to be a good thing. 

### what to check
- During your review of the pull request you can either say “yeah it looks good to me”, 
- or maybe you look at the title and it says, the code needs to do this, but then you see some piece of the code and realise that this code has nothing to do with that, so you can ask, “why are you changing this?”. 
- You should also look at the tests and see if all the tests passed. 

![](/img/quality-tests.png)

- Look at the code coverage. Let’s say the code coverage went down. So, what happened? Maybe somebody wrote code, but they didn't write a test case to run all the lines of code. 

![](/img/coverage.png)

###  your response
- So, in your review of the pull request, you can simply say that you don't accept it, 
- and you can request more changes to the code. You could say “the code coverage went down and so I’m not going to approve this yet”, and you can request that they write more test cases for the code. 
- And then they can go and write more test cases, and the pull request will see the code changes and rerun the tests. 
- If those test results look good to you now, you can say, “Ok, the code coverage is now above 95%, so now I approve that pull request.” 

This kind of monitoring of each other’s work is what you should expect from your development teams. You want them to be monitoring each other, helping each other, looking at each other's code and doing many code reviews. Because it's a lot easier to do code reviews on 20 lines of code than 20,000 lines of code. 

> These are the reasons that you do pull requests; you get a second set of eyes on the code and avoid something catastrophic happening without somebody knowing about it.

![](/img/pull-req.png)

## 4. Code in version control works
You're going to deploy from Git or where you keep your code. How do you know that the code in Git works? Unless you test every change, you could be deploying broken code into production. So, it’s very important to know that, everything that's in that master branch in Git works.