name: Master build

# raise pr -> runs pr-checks.yml
# merge with master -> runs master-build.yml
### release -> |
#      runs sync-s3-dags.yaml
#
#
#
#
# manual intervention
### on workflow_dispatch -> runs sync-s3-dags-[staging/manually].yaml

## https://vault.secrets.hellofresh.io/v1/automation/dwh-cluster-automation/googleapi_gsheet

concurrency: Master build

permissions:
  id-token: write
  contents: read

on:
  push:
    branches:
      - "main"

jobs:
  docker-release:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout repo
        uses: actions/checkout@v2
      # import secrets
      # checkout helper scripts hellofresh/jetstream-ci-scripts
      # bump version
      # build docker
      # github release
      # get aws details
      # sync dq files
      
      - name: release
        env:
          GH_TOKEN: ${{ github.token }}
        run: |
          gh release create v1.0.1 --title test --generate-notes