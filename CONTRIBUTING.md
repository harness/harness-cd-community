
# Contributing to Harness CD Community



At Harness we encourage and appreciates all the contributions. See the [Table of Contents](#table-of-contents) for different ways to contribute and improve the experience of Harness CD Community. Please make sure to read the relevant section before making your contribution. It will help us make in maintianing the edition and provide an enriching experience to all the community memebers. We look forward to your contributions. 🎉

> Not sure about how to start, there are other simpler ways to support the community :
> - Star the GitHub Repository
> - Share your experience about Harness CD Community through tweets, meetups etc. 
> - Provide valuable feedback in community discussions or [Harness Community Slack](https://join.slack.com/t/harnesscommunity/shared_invite/zt-1ps5x4n83-MvsdOCpkAjLpXVgYX8iH5g).


## Table of Contents

- [Asking a Question](#asking-a-question)
- [Contribution Guidelines](#contribution-guidelines)
- [Reporting Bugs](#reporting-bugs)
- [Suggesting Feature Enhancements](#suggesting-feature-enhancements)
- [Your First Contribution](#your-first-contribution)
- [Improving The Documentation](#improving-the-documentation)




## Asking a Question

> If you want to ask a question, we assume that you have read the available [Documentation](https://developer.harness.io/docs/continuous-delivery/cd-advanced/cd-kubernetes-category/harness-community-edition-overview/).

Before you ask a question, it is best to search for existing [Issues](https://github.com/harness/harness-cd-community/issues) that might help you. In case you have found a suitable issue and still need clarification, you can write your question in the same issue. It is also advisable to join [Harness Community Slack](https://join.slack.com/t/harnesscommunity/shared_invite/zt-1ps5x4n83-MvsdOCpkAjLpXVgYX8iH5g) and ask you queries.

If you then still feel the need to ask a question and need clarification, we recommend the following:

- Refer to [Issue Template](https://github.com/harness/harness-cd-community/tree/main/.github/ISSUE_TEMPLATE) before raising an issue
- Open an [Issue](https://github.com/harness/harness-cd-community/issues/new).


We will take care of the issue as soon as possible.



## Contribution Guidelines   
             
> ### Legal Notice   
> When contributing to this project, you must agree that you have authored 100% of the content, that you have the necessary rights to the content and that the content you contribute may be provided under the project license. For more information please refer to 
[LICENSE.md](https://github.com/harness/harness-cd-community/blob/main/LICENSE.md) and [CODE_OF_CONDUCT.md](https://github.com/harness/harness-cd-community/blob/main/CODE_OF_CONDUCT.md)  


## Reporting Bugs


#### Before Submitting a Bug Report

We ask you to investigate carefullY and collect information to describe the issue in detail in your report. For that please complete the following steps in advance to help us fix any potential bug as fast as possible.

- Make sure that you are using the latest version.
- Determine if your bug is really a bug and not an error on your side e.g. using incompatible environment/resource constraints (Make sure that you have read the [documentation](https://developer.harness.io/docs/continuous-delivery/cd-advanced/cd-kubernetes-category/harness-community-edition-overview/). If you are looking for support, you might want to check [this section](#asking-a-question))).
- To see if other users have experienced (and potentially already solved) the same issue you are having, check if there is not already a bug report existing for your bug or error in the [bug tracker](https://github.com/harness/harness-cd-community/issues).
- Collect information about the bug:
- Stack trace (Traceback)
- Version of the interpreter, compiler, SDK, runtime environment, package manager, depending on what seems relevant.
- Possibly your input and the output
- Can you reliably reproduce the issue? And can you also reproduce it with older versions?
- Refer to the [Bug Issue Template](https://github.com/harness/harness-cd-community/blob/main/.github/ISSUE_TEMPLATE/bug_report.md) before submitting the report


#### How Do I Submit a Good Bug Report?

> You must never report security related issues, vulnerabilities or bugs including sensitive information to the issue tracker, or elsewhere in public. Instead sensitive bugs must be sent by email to <>.


We use GitHub issues to track bugs and errors. If you run into an issue with the project:

- Refer to [Issue Template](https://github.com/harness/harness-cd-community/tree/main/.github/ISSUE_TEMPLATE) and open an [Issue](https://github.com/harness/harness-cd-community/issues/new). (Since we can't be sure at this point whether it is a bug or not, we ask you not to talk about a bug yet and not to label the issue.)

Once it's filed:

- The team will label the issue accordingly.
- A team member will try to reproduce the issue with your provided steps. If there are no reproduction steps or no obvious way to reproduce the issue, the team will ask you for those steps and mark the issue as `needs-reproduction-steps`. Bugs with the `needs-reproducion-steps` tag will not be addressed until they are reproduced.
- If the team is able to reproduce the issue, the team will work on the issues and resolve it as early as possible. 


## Suggesting Feature Enhancements

This section guides you through submitting an enhancement suggestion for Harness CD Community, **including completely new features and minor improvements to existing functionality**. Following these guidelines will help maintainers and the community to understand your suggestion and find related solutions.


#### Before Submitting an Enhancement

- Make sure that you are using the latest version.
- Read the [documentation](https://developer.harness.io/docs/continuous-delivery/cd-advanced/cd-kubernetes-category/harness-community-edition-overview/) carefully and find out if the functionality is already covered.
- Perform a [search](https://github.com/harness/harness-cd-community/issues) to see if the enhancement has already been suggested. If it has, add a comment to the existing issue instead of opening a new one.
- Find out whether your idea fits with the scope and aims of the Community Edition. Keep in mind that we want features that will be useful to the majority of our users and not just a small subset. Also, many more features are avaliable on the SAAS version of Harness CD and other paid subscriptions. Please refer to [Harness CD](https://www.harness.io/products/continuous-delivery) for more details. 


#### How Do I Submit a Good Enhancement Suggestion?

Enhancement suggestions are tracked as [GitHub issues](https://github.com/harness/harness-cd-community/issues).
Please refer to [Feature Request Template](https://github.com/harness/harness-cd-community/blob/main/.github/ISSUE_TEMPLATE/feature_request.md) for a clear format. 
Also, check the following to raise a well formated enhancement request - 
- Use a **clear and descriptive title** for the issue to identify the suggestion.
- Provide a **step-by-step description of the suggested enhancement** in as many details as possible.
- **Describe the current behavior** and **explain which behavior you expected to see instead** and why. At this point you can also tell which alternatives do not work for you.
- You may want to **include screenshots and screen recordings** which help you demonstrate the steps or point out the part which the suggestion is related to.
- **Explain why this enhancement would be useful** to most Harness CD Community users.


## Your First Contribution   


This section guides you through the steps to make a code/configuration contribution for Harness CD Community. Follow the steps given below to make your first code contributions -  

- Fork Harness CD Community Repo

- Clone the repo to local : 
`git clone https://github.com/<user-name>/harness-cd-community.git` 

- Create a new branch : ` git checkout -b <new-branch-name> `

There are two ways to make contributions - **Helm and Docker Compose**

#### **For Helm**
- Please cover all the prerequisites listed given in the [README.md](https://github.com/harness/harness-cd-community/tree/main/helm). Note - To set up a production profile for the community edition check [advanced contribution](https://github.com/harness/harness-cd-community/tree/main/helm#advanced-configuration).

- Make the required updates to the helm chart.

- Once the updates are done, test your changes locally.
- Start minikube or any other kubernetes cluster you may have installed or configured
- Deploy the Helm chart to your testing environment using the helm install command. Ex - 
    ```shell   
    helm install harness ./harness --create-namespace --namespace harness
    ```
- Follow the script instructions or refer `helm/harness/templates/NOTES.txt` for any upgrade required.

- Test the deployment to make sure all the pods and services are running.
```shell
kubectl get pods -n harness

kubectl logs -f <name> -n harness
```
- Also test that you can access the Community Edition through the web browser and perform basic operations - Sign In and [Run a Sample Deployment](https://developer.harness.io/docs/continuous-delivery/onboard-cd/cd-quickstarts/harness-community-edition-quickstart/) 

- In case of any failure, update and redeploy the chart. 
- Once the testing is successful, commit your changes and raise the PR to Harness CD Community Repository.


#### **For Docker Compose**
- Please cover all the prerequisites listed given in the [README.md](https://github.com/harness/harness-cd-community/tree/main/docker-compose/harness) . Note - To deploy to  a separate environmnent check [advanced contribution](https://github.com/harness/harness-cd-community/tree/main/docker-compose/harness#advanced-configuration).

- Make the required updates to the docker-compose files.

- To test your changes locally, run the command from the directory containing the Docker Compose file.
```shell 
docker-compose up
``` 
- start minikube or any other kubernetes cluster you may have installed or configured

- Wait for startup to complete.
```shell
docker-compose run --rm proxy wait-for-it.sh ng-manager:7090 -t 180
```
- Note: you may modifiy the wait-for-it.sh for any additional check needed as well. You can find the script here `/docker-compose/harness/scripts`

- Check if all the services in running state 
```shell
docker-compose logs
```
- Also check the status of the all the containers
```shell
docker-compose ps
```
- Finally, make sure that you can access the Community Edition through the web browser and perform basic operations - Sign In and [Run a Sample Deployment](https://developer.harness.io/docs/continuous-delivery/onboard-cd/cd-quickstarts/harness-community-edition-quickstart/) 

- Once the testing is successful, commit your changes raise the PR to Harness CD Community Repository.




## Improving The Documentation
This section guides you through the steps on how to help improve the documentation for Harness CD Community. Follow the steps given below -  

- Fork Harness CD Community Repository

- Clone the repo to local : 
`git clone https://github.com/<user-name>/harness-cd-community.git` 

- Create a new branch : ` git checkout -b doc-update `

- Go through the installation steps for [Docker Compose](https://github.com/harness/harness-cd-community/tree/main/docker-compose/harness) / [Helm](https://github.com/harness/harness-cd-community/tree/main/helm) for which you want to make the contribution 

- Make the documentation updates to the rescpective **README.md** files of docker compose and helm. 

- Run test installation over the updated steps to make sure no essential steps are missed or misinterpreted

- Raise the PR to Harness CD Community Repository.



Thank you for contributing to Harness! ❤️
