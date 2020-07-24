terraform {
  required_version = "~> 0.11"
}

# TODO (pillingworth, 2020-07-15) when crown-marketplace-legacy repo is
# available then update the github_repo variable below
module "component" {
    # source = "git::https://github.com/Crown-Commercial-Service/CMpDevEnvironment.git//terraform/modules/component"
    source = "../../modules/component"

    type = "app"
    prefix = "ccs"
    name = "cmp-legacy"
    hostname = "cmp"
    build_type = "custom"
    build_image = "ccs/ruby"
    github_owner = "Crown-Commercial-Service"
    github_repo = "crown-marketplace"
    github_branch = "master"
    github_token_alias = "ccs-build_github_token"
    cluster_name = "CCSDEV_app_cluster"
    task_count = 2
    autoscaling_max_count = 4
    enable_tests = true
    enable_cognito_api_support = true
    environment = [
      {
        name = "RAILS_ENV",
        value = "production"
      },
      {
        name = "RAILS_SERVE_STATIC_FILES",
        value = "true"
      }
    ]
    port = "80"
    providers = {
      aws = "aws"
    }    
}