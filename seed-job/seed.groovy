organizationFolder("example-org") {
  displayName "example-org"
  organizations {
    github {
      apiUri "https://api.github.com"
      repoOwner "MichaelNesterenko"
      credentialsId "githb-auth"
      traits {
        sourceRegexFilter {
          regex "jenkins-job-bootstrapper"
        }
        gitHubBranchDiscovery {
          strategyId 1 // Exclude branches that are also filed as PRs
        }
      }
    }
  }
}