# `src/infra` Folder

This is where Infrastructure as Code (IaC) code lives, aka Terraform modules. The code in this folder allows you to automatically build and maintain your infrastructure, without having to perform manual configuration steps.

**Folder Structure:**

* [`src/infra/env`](src/infra/env) - Infrastructure pecifications for each environment.
  * [`src/infra/env/dev`](src/infra/env/dev) - Infrastructure pecifications for non-prod environments.
  * [`src/infra/env/prod`](src/infra/env/prod) - Infrastructure pecifications for prod environments.
* [`src/infra/modules`](src/infra/modules) - Reusable Terraform modules. These modules define how to setup all architecture needed by your infrastructure.
* [`src/infra/resources`](src/infra/resources) - Pointers to cloud infra resources.
  * [`src/infra/resources/dev`](src/infra/resources/dev) - Pointers to dev infrastructure.
  * [`src/infra/resources/prod`](src/infra/resources/prod) - Pointers to production infrastructure.
