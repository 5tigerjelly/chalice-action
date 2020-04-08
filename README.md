
```
on:
  push:
    branches:
      - master
name: Deploy master branch
jobs:
  deploy:
    name: deploy
    runs-on: ubuntu-latest
    steps:
    - uses: actions/checkout@master
    - name: npm install
      uses: actions/npm@master
      with:
        args: install
    - name: chalice deploy
      uses: 5tigerjelly/chalice-action@v1
      with:
        args: deploy
      env:
        AWS_ACCESS_KEY_ID: ${{ secrets.AWS_ACCESS_KEY_ID }}
        AWS_SECRET_ACCESS_KEY: ${{ secrets.AWS_SECRET_ACCESS_KEY }}
```