# Scoring on Greenplum

Install some required packages that is used in the PL/Python scoring routine:

1. Install pip on each segment (as gpadmin):

`$ curl "https://bootstrap.pypa.io/get-pip.py" | "/usr/local/greenplum-db/ext/python/bin/python"`

2. Install TensorFlow on each segment (as gpadmin):

`$ pip install tensorflow-1.1.0rc2-cp27-cp27m-linux_x86_64.whl`

3. Install Keras and h5py (for model loading) on each segment (as gpadmin):

```
$ pip install keras
$ pip install h5py
```

4. Run `01-load-data.sql` to load the data set into Greenplum (data needs to be downloaded from Kaggle and put into the right path `/home/gpadmin/creditcard.csv`).

5. Run `02-create-scoring-function.sql` to register the scoring function.

6. Run `03-perform-scoring.sql` to perform the scoring (the trained neural network model needs to be loaded on every segment and the full path needs to be specified `/home/gpadmin/model_file.h5`)
