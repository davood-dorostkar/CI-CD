# Infrastructure as Code (IaC)
- It provides a great way for you to describe your infrastructure in a textual format. 
- We’re talking about textual code that you can hand to an IaC tool. That tool reads the code and then builds your servers, and networks, and storage, etc.
- it means that everyone gets the same environment every time, so it’s consistent and repeatable. 
- Textual code is normally written in the `YAML` format, which is a very common way to write and declare IaC. 

## Declarative IaC
With the declarative approach, you specify the desired state of the infrastructure resources you want to provision, and then the IaC tool determines how to achieve this state. It handles dependencies and executes commands in the proper order without you having to specify the order of execution. Tools that use this approach include `Terraform`, `Puppet`, `SaltStack`, `CloudFormation`, and to some extent, `Ansible`. 

## Imparative IaC
The imperative approach, in contrast, requires that you define the specific order of the commands needed to achieve the desired state. It’s up to you to get the dependencies correct as the tool will execute commands in the order you specify. Tools like `Chef` are imperative and to some extent, `Ansible` can be as well.

## Ansible IaC example
`Inventory` files have a list of servers or devices that can be in the form of IP addresses or hostnames. 

There are also `VAR` files contain the relevant variables that may be needed whenever a playbook is run on a device or group of devices. You can control how Ansible interacts with remote hosts or devices based on how you define variables. 

Ansible has this notion of a `playbook` that contains any number of plays. `Plays` contain the instructions to be carried out on each server or device. 

Ansible will read the playbook, determine which servers from the inventory that the plays are appropriate for, and execute the plays on each of these servers. So you could determine that you need to set up a web server, an app server, and a database server, or maybe two web servers, and three app servers, or maybe even change the existing configuration of a server.

![](/img/ansible.png)

> It's also important to note that Ansible is idempotent. It will not affect a server if it is already in the desired state. This allows you to be able to reapply a playbook and not worry about it installing things twice.

> `Chef` has cookbooks and recipes, Ansible has Playbooks and Plays. They are essentially the same thing.

## IaC Benefits
- Faster time to production:
  
  IaC automation dramatically speeds up the process of provisioning infrastructure for development, tests, and production.
- Faster development:
  
  Developers can quickly provision sandboxes and Continuous Integration/Continuous Delivery environments, and QA can quickly provide full-fidelity test environments. 
- Protection against staff churn:
  
  In the past, the knowledge of how to configure servers may have been known by only a few people in your organization. Once you codify this knowledge using infrastructure as code, everyone is able to provision what they need, and the fear of losing tribal knowledge through staff churn is no longer an issue. 
- lower costs & improved use of developers' time:
  
  take maximum advantage of cloud computing's consumption-based cost structure. It reduces the time, effort, and specialized skill required to provision and scale infrastructure. It also enables developers to spend less time on plumbing and more time on mission-critical software solutions.

## IaC Tools

### Terraform
Terraform is an IaC tool that is free and open source. It uses a declarative approach to IaC with a pre-execution check to ensure that it will do what you expect it to do. You can use Terraform as a base tool in combination with Ansible where Terraform provisions the base infrastructure and Ansible configures the software on top of it. 

### Ansible
Ansible is an open source tool that automates IT tools such as intra-service orchestration, application deployment, cloud provisioning, and more. It uses familiar YAML files to describe the state that you want to achieve. Ansible is simple to set up because it doesn't require any client-side agents or bespoke security infrastructure, and it works by simply delivering modules to clients. 

This makes it ideal for memory-constrained environments like configuring Internet of Things devices. These modules are run on the client side and the results are sent back to the Ansible server. 

### Chef
Chef describes the necessary steps to reach a final state rather than describing the state itself. Using “Cookbooks,” you can describe various processes by which you can configure a system to achieve the desired state. One of the strengths of Chef is that it’s a popular tool and has lots of support but one of the drawbacks is that cookbooks are written in Ruby. 

### Puppet
With Puppet, you can use any existing platform. The main difference between Puppet and Chef is that Puppet is declarative, which some consider to be a preferred method. 

### SaltStack
SaltStack’s remote execution capabilities allow administrators to run commands on various machines in parallel with a flexible targeting system. SaltStack is designed to allow users to explicitly target and issue commands to multiple machines directly.