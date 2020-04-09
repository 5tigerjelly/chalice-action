# AWS Chalice Github Action

This Github action allows automatated deployment of your AWS Chalice application via Github Actions.

## Onboarding
1. Create a directory call `.github/workflow/`
1. Create a yaml file, ex action.yml, and place it in `.github/workflow/` 

```
on:
  push:
    branches:
      - master
name: Deploy master branch to Chalice
jobs:
  deploy:
    name: deploy
    runs-on: ubuntu-latest
    steps:
    - uses: actions/checkout@master
    - name: chalice deploy
      uses: 5tigerjelly/chalice-action@master
      with:
        args: deploy
      env:
        AWS_ACCESS_KEY_ID: ${{ secrets.AWS_ACCESS_KEY_ID }}
        AWS_SECRET_ACCESS_KEY: ${{ secrets.AWS_SECRET_ACCESS_KEY }}
        AWS_DEFAULT_REGION: us-east-1
```

## Deploying to other stages
Edit the args if you want to deploy to a different stage.
```
on:
  push:
    branches:
      - master
name: Deploy master branch to Chalice
jobs:
  deploy:
    name: deploy
    runs-on: ubuntu-latest
    steps:
    - uses: actions/checkout@master
    - name: chalice deploy
      uses: 5tigerjelly/chalice-action@master
      with:
        args: deploy --stage prod
      env:
        AWS_ACCESS_KEY_ID: ${{ secrets.AWS_ACCESS_KEY_ID }}
        AWS_SECRET_ACCESS_KEY: ${{ secrets.AWS_SECRET_ACCESS_KEY }}
        AWS_DEFAULT_REGION: us-east-1
```

## Deploying from other branch
Edit the branch's name to deploy when a change occurs to a branch.
In this example any changes to `feature-branch-1` will trigger the deployment
```
on:
  push:
    branches:
      - feature-branch-1
name: Deploy master branch to Chalice
jobs:
  deploy:
    name: deploy
    runs-on: ubuntu-latest
    steps:
    - uses: actions/checkout@master
    - name: chalice deploy
      uses: 5tigerjelly/chalice-action@master
      with:
        args: deploy
      env:
        AWS_ACCESS_KEY_ID: ${{ secrets.AWS_ACCESS_KEY_ID }}
        AWS_SECRET_ACCESS_KEY: ${{ secrets.AWS_SECRET_ACCESS_KEY }}
        AWS_DEFAULT_REGION: us-east-1
```

## Secrets
1. Place the `AWS_ACCESS_KEY_ID` and `AWS_SECRET_ACCESS_KEY` in your github repo's `Setting/Secrets`
2. The name should be `AWS_ACCESS_KEY_ID` and `AWS_SECRET_ACCESS_KEY` and the values your AWS credentials

## Notes
* You may have multiple action files in the `.github/workflow/`. Make sure to have different yml file names.