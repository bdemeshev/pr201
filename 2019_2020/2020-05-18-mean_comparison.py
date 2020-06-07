import pandas as pd
import numpy as np
import seaborn as sns
from scipy import stats


# X_1, ..., X_20 
# Y_1, ..., Y_10

#  variable | value
# упр. сгенерируем 20 штук Xi N(1, 1)
# упр. сгенерируем 10 штук Yi N(2, 2) # 2 - дисперсия, scale = np.sqrt(2)

n_x = 20
n_y = 10

variable = np.repeat(['x', 'y'], [n_x, n_y])
variable

x = stats.norm.rvs(loc=1, scale=1, size=n_x)
y = stats.norm.rvs(loc=2, scale=np.sqrt(2), size=n_y)

value = np.concatenate([x, y]) 
value

data = pd.DataFrame({'variable': variable, 'value': value})
data

data.query('variable == "x"')['value']

# тест с очень ограничивающей предпосылкой о равенстве дисперсий
stats.ttest_ind(x, y)

# более робастная версия (тест Уэлча)
stats.ttest_ind(x, y, equal_var=False)

# alpha = 0.05 (часто) H_0 о равенстве ожиданий отвергается или нет?
# alpha = 0.3 H_0 отвергается или нет?


# 0.286 > 0.05 => H_0 (ожидания равны) не отвергается 
# 0.286 < 0.3 => H_0 (ожидания равны) отвергается 




