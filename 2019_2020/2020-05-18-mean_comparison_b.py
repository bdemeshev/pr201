import numpy as np
import pandas as pd
import seaborn as sns
from scipy import stats


# Упр. 
# Сгенерируем Xi ~ N(1, 1) 10 штук
# Сгенерируем Yi ~ N(2, 2) 20 штук

n_x = 10
n_y = 20

np.random.seed(777)
x = np.random.normal(loc=1, scale=2, size=n_x)
x
y = stats.norm.rvs(loc=2, scale=np.sqrt(2), size=n_y)
y

# Упр. Занесите наши данные в одну табличку pd.DataFrame
# variable | value

np.repeat('x', 10)
name = np.repeat(['x', 'y'], [n_x, n_y])
name

data = pd.DataFrame({'variable': name,
    'value': np.concatenate([x, y])})

data.query('variable == "x"')['value']


myvar = lambda x: np.var(x) * len(x) / (len(x) - 1)
mystd = lambda x: np.sqrt(myvar(x))
myvar2 = lambda x: np.sum((x - np.mean(x)) ** 2) / (len(x) - 1)

## выборочные характеристики:
sample_info = (data.groupby('variable').
    agg(mean = ('value', np.mean), std_dev = ('value', mystd),
    myvar = ('value', myvar), myvar2 = ('value', myvar2),
    npvar = ('value', np.var), 
    npvar1 = ('value', lambda x: np.var(x, ddof=1)))
    .reset_index())

sample_info

# хммм 
myvar2([0, 2])
np.var([0, 2])

myvar2(data.query('variable == "x"')['value'])
np.var(data.query('variable == "x"')['value'])


# предполагая равенство дисперсий проверьте гипотезу о равенстве средних
# Шаг 1. (упр)
s2tot = ((n_x - 1) * myvar(x) + (n_y - 1) * myvar(y))/ (n_x + n_y - 2)
s2tot

# Шаг 2. (упр)
t_stat = (np.mean(x) - np.mean(y)) / np.sqrt(s2tot / n_x + s2tot / n_y)
t_stat

# Шаг 3. (упр) 5%, два хвоста H0: ожидания равны, Ha: ожидания не равны
df = n_x + n_y - 2
df
t_crit = stats.t.ppf(0.975, df)
t_crit

# Шаг 4. (упр)
p_value = 2 * (1 - stats.t.cdf(abs(t_stat), df))
p_value


# вывод? H0 отвергается или не отвергается?
# первый способ: сравнили t_stat vs t_crit
# |t_stat| < t_crit => H0 не отвергается
abs(t_stat) < t_crit

# второй способ
# через доверительный интервал
ci_left = (np.mean(x) - np.mean(y)) - t_crit * np.sqrt(s2tot / n_x + s2tot / n_y)
ci_right = (np.mean(x) - np.mean(y)) + t_crit * np.sqrt(s2tot / n_x + s2tot / n_y)
(ci_left, ci_right)
# 0 \in (ci_left, ci_right) => H0 не отвергается
(ci_left < 0) & (0 < ci_right)

# третий способ 
# через P-значения
# p_value > alpha = 0.05 => H0 не отвергается
p_value > 0.05

# готовый рецепт:
stats.ttest_ind(x, y)

# есть робастный вариант. Welch test. 
# https://en.wikipedia.org/wiki/Welch%27s_t-test
stats.ttest_ind(x, y, equal_var=False)







