# GitOps with ArgoCD

## GitOps Benefits
It enables continuous deployment by automating the process of deploying changes to infrastructure and applications. With GitOps as the single source of truth, any changes pushed to the Git repository trigger automated deployment processes, ensuring quick and reliable updates to the system. Version control and traceability. GitOps leverages Git's version control capabilities to provide a complete history of changes made to the infrastructure and application configurations. This provides accountability and allows developers to easily roll back to a previous version if needed with minimal risk. Here are some more benefits. Consistency and reproducibility. GitOps enforces a consistent and reproducible deployment process by relying on version control configurations. Just like with Kubernetes, Git includes the definition of the system's desired state and automated processes ensure that the actual state matches the desired state. Reducing configuration drift and improving system reliability. Collaboration and review. GitOps promotes collaboration by applying Git's collaboration features such as pull requests and code reviews to infrastructure and application configuration changes. Auditability and compliance. Within GitOps, Git repositories track all changes made to the system. Providing a centralized and auditable record of all modifications. This enhances auditability and compliance with regulatory requirements in regulated industries such as finance or health care, where compliance with specific policies and regulations is crucial. The final benefit is Infrastructure as Code. GitOps embraces the Infrastructure as Code paradigm where infrastructure configuration are defined and managed through code stored in Git repositories.

## GitOps Workflow
Developers make changes to the application source code and submit them as pull requests for review. The approved changes merge into the main branch, triggering the continuous integration or CI pipeline. The CI pipeline detects the changes and initiates the build process, producing artifacts stored in an artifact repository. Site Reliability Engineers or SREs manage the environment configuration at the operations side through a separate declarative Config Repo. They change the configuration and follow the process of creating pull requests for review. Once approved, the changes merge into the main branch of the Declarative Config Repo. The target environment architecture introduces a GitOps Agent component to ensure seamless synchronization between the Git repositories and the target environment. This agent continuously monitors the Declarative Config Repo for changes. With a detected change, the GitOps agent automatically pulls the latest configuration from the repository and applies those changes to the environment. The GitOps solution pulls the appropriate build from the artifact repository and applies the state change to the Cloud resources. 

![](/img/git-workflow.png)

## ArgoCD Structure

![](/img/argo-structure.png)

## GitOps Patterns

### on-cluster resource reconciler pattern
In this pattern, a controller within the cluster takes charge of comparing the Kubernetes resources such as YAML files in the Git repository. Whenever a discrepancy is identified, the controller triggers notifications and potentially performs actions to reconcile the resources on Kubernetes with those stored in a Git repository. Anthos Config Management is used to deploy shared environments and Weaveworks Flux, which enables continuous and progressive delivery solutions, use this pattern in their GitOps implementation.

![](/img/onsite-pattern.png)

### external resource reconciler 
By adopting an external resource reconciler pattern, Argo CD enables users to manage and synchronize resources across multiple Git repositories and Kubernetes clusters. In this pattern, the synchronization process occurs using Custom Resource Definitions or CRDs that describe the Git repositories and Kubernetes clusters to reconcile. The controllers compare the Git repository specified in this CRD with the resources present in the Kubernetes cluster specified in the same CRD. Based on the comparison result the controllers take appropriate action to reconcile any discrepancies. Argo CD is a notable solution that adopts the external resource reconciler pattern for its GitOps implementation.

![](/img/external-pattern.png)

## Openshift GitOps 
Openshift GitOps is a packaged version of Argo CD designed specifically for OpenShift, providing a seamless GitOps experience within the OpenShift platform.

 In Step 1, install OpenShift GitOps from the OperatorHub within your OpenShift cluster. Operator, HUD provides a catalog of prepackaged applications and services that can be easily deployed on OpenShift. After installation, you can launch OpenShift GitOps from the OpenShift console. The console provides a user-friendly interface to access and manage installed applications. To access GitOps OpenShift, use your OpenShift credentials to log in. This ensures proper authentication and authorization for managing Git repositories, Kubernetes clusters, and the associated resources. With OpenShift GitOps up and running, you can now use Argo CD's capabilities. 

 ![](/img/os-argo.png)