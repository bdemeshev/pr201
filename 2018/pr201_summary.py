import numpy as np # массивы и математика
import pandas as pd # таблички с данными
import seaborn as sns # графики
from scipy import stats # статистика
import matplotlib.pyplot as plt # настройкам графиков

# загружаем встроенный набор данных
diamonds = sns.load_dataset('diamonds')

# голова, хвост и описательные статистики
diamonds.head()
diamonds.tail()
diamonds.describe()

# среднее и корень из несмещённой оценки дисперсии
price_av = np.mean(diamonds['price'])
price_std = np.std(diamonds['price'])

# число строк и столбцов набора данных
diamonds.shape

n = diamonds.shape[0]

# пример расчета критических значений
t_crit = stats.t.ppf(0.975, df=n-1)
chi2_crit = stats.chi2.ppf(0.975, df=n-1)

# считаем левую границу доверительного интервала
left_ci = price_av - t_crit * price_std / np.sqrt(n)
left_ci

# отбор переменных
d2 = diamonds[['carat', 'price', 'x', 'y', 'z']]
d2.head()

# отбор наблюдений по критерию
d3 = diamonds[diamonds['carat'] > 1.5]
d3.head()

# Гистограмма
sns.distplot(diamonds['price'], kde=False)
plt.xlabel('Цена бриллианта (долларов)')
plt.ylabel('Количество бриллиантов')
plt.suptitle('Симпатичный график')


# Диаграмма рассеяния
scatter = sns.jointplot(data=diamonds, x='carat', y='price')
scatter.set_axis_labels('Масса бриллианта (карат)',
                        'Цена бриллиант (долл)')
plt.suptitle('Данные по бриллиантам')


# текущая папка
!pwd
# сохранение и чтение данных
diamonds.to_csv('demo_file.csv', index=False)
d4 = pd.read_csv('demo_file.csv')
d4.head()