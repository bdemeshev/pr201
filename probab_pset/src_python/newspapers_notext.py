# -*- coding: utf-8 -*-
from __future__ import division
from numpy import arange
import scipy.stats as stats

# this function calculates expected numer of sold newspapers
def e_selled_newspapers(n,lam=50):
	x=arange(n)
	probs=stats.poisson.pmf(x,lam)
	e_selled_newspapers=sum(x*probs)+(1-stats.poisson.cdf(n-1,lam))*n
	return e_selled_newspapers

# this function calculates expected profit
def profit(n,lam=50):
	return 30*e_selled_newspapers(n,lam)-15*n

print profit(50)

