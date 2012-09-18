# -*- coding: utf-8 -*-

"""
Маленький мальчик торгует на улице еженедельной газетой. Покупает
он ее по 15 рублей, а продает по 30 рублей. Количество потенциальных покупателей --- случайная величина с распределением Пуассона и средним
значением равным 50. Нераспроданные газеты ничего не стоят. Пусть $n$ --- количество газет, максимизирующее ожидаемую прибыль мальчика.
\begin{enumerate}
\item Чему примерно должно быть равно значение функции распределения в
точке  $n$?
\item  С помощью компьютера найдите  $n$ и ожидаемую прибыль.
\end{enumerate}
"""


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

