# BlackBird Cloud Terraform Toolkits

Base docker image for infrastructure deployments on CI, contains both `tfenv` and `tgenv`

## Usage

### On Gitlab CI

```yaml
deploy:
  image: blackbirdcloud/terraform-toolkit:latest
  stage: deploy
  script:
  - terragrunt init
  - terragrunt apply
```


