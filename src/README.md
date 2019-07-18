# `src` directory

The `src` folder contains all product-related source code, organized as follows:

* [`src/docker`](src/docker) - Docker images which define the software needed in any code executions.
* [`src/infra`](src/infra) - Infrastructure definitions for any cloud resources needed by the project.
* [`src/project`](src/demo-project) - Busines logic for the data-ops project.
* [`src/tests`](src/tests) - Automated tests used to confirm code is working as expected. The CI/CD pipeline will run these tests after each code push.
