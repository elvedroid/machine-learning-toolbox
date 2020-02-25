# Conda Cheatsheet

## Basics

### Update conda

`conda update conda`

### Install package included in Anaconda

`conda install PACKAGENAME`

### Update installed package

`conda update PACKAGENAME`

## Environments

### Activate environment

`conda activate myenv`

### Deactivate environment

`conda deactivate`

### List environments (also show the path of the environment)

`conda info --envs`

### Create environment

`conda create --name myenv`

### Create environment with specific python version

`conda create -n myenv python=3.8.2`

### Create environment with specific packages

`conda create -n myenv scipy pandas matplotlib`

### Cloning an environment

`conda create --name myclone --clone myenv`

### View a list of the packages in an environment

`conda list -n myenv` - or if you are in the environment: `conda list`

### Check if specific package in an environment is installed

`conda list -n myenv scipy`

### Remove environment

`conda remove --name myenv --all`
