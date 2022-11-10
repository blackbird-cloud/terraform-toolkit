# BlackBird Cloud Terraform Toolkits

Base docker image for infrastructure deployments on CI, contains both `tfenv` and `tgenv`

## Usage

### On Gitlab CI

```yaml
deploy:
  image: blackbirdcloud/terraform-toolkit:latest
  stage: deploy
  script:
  - source ~/.env
  - terragrunt init
  - terragrunt apply
```

### Troubleshoot

#### Exit code 126

This is caused by tgenv pointing to the terraform shim instead of binary, make sure to do `source ~/.env` before any terragrunt action
