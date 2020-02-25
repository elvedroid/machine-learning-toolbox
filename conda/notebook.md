# Jupyter notebook

## Basic commands

### Run notebook

`jupyter notebook`

## Create SOS notebook

### Install neccessery packages

`conda install -c conda-forge sos-notebook jupyterlab-sos`

### Install language modules

`conda install -c conda-forge sos-python`

### Set up Octave in SOS notebook

1. `pip install sos-matlab` - use with caution (should not use conda with pip, but no other choice found)

2. `conda install -c conda-forge octave_kernel`

3. Add **"Octave-5.x.x.x\mingw64\bin"** to **PATH** variable

#### Check if octave kernel is working

`python -m octave_kernel.check`
