# Jenkins Job Bootstrap Example

## Jenkins Docker

* run jenkins docker container locally:
  ```
  ./jenkins/restart.sh <docker_network_name|empty>
  ```


## Jenkins Job Api

* Create subfolder for bootstrapped jobs
  ```
  curl -v -u admin:admin -XPOST -H 'Content-Type: application/xml' --data-binary @seed-job/seed-folder.xml http://jenkins-job-bootstrapper:8080/createItem?name=seed-folder
  ```

* Create seed job
  ```
  curl -v -u admin:admin -XPOST -H 'Content-Type: application/xml' --data-binary @seed-job/seed.xml http://jenkins-job-bootstrapper:8080/job/seed-folder/createItem?name=_seed
  ```

## References

* Job DSL - https://plugins.jenkins.io/job-dsl/
* Configuration as Code - https://plugins.jenkins.io/configuration-as-code/
* Authorize Project - https://plugins.jenkins.io/authorize-project/