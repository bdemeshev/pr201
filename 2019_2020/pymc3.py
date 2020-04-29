!pip install arviz==0.6.1
!pip install pymc3==3.8


# restart colab

import numpy as np
import pandas as pd
import seaborn as sns
import pymc3 as pm
import arviz as az

pm.__version__



continent_model = pm.Model()

with continent_model:
  # prior
  d = pm.Beta("continent share", 2, 1)
  # likelihood
  landings = pm.Bernoulli("landings", d, observed=[1, 1, 0, 0, 1])

map_estimate = pm.find_MAP(model=continent_model)
map_estimate


with continent_model:
    trace = pm.sample(1000)



az.plot_trace(trace)

np.mean(trace['continent share'] > 0.7)

az.plot_posterior(house_sample, var_names="house_model/house location");

az.summary(house_sample)

ppc = pm.sample_posterior_predictive(trace, samples=500, model=continent_model)


sns.distplot(ppc['landings'], kde=False)



