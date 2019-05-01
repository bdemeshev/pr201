# if you see krakozyabry on windows then File - Reopen with encoding - UTF8 :)

library(rio) # импорт-экспорт данных
library(tidyverse) # манипуляции с данными
library(skimr) # описательные статистики

# возьмём встроенный набор данных
glimpse(diamonds) # кратко о наборе данных
skim(diamonds) # описательные статистики
head(diamonds) # голова набора данных
tail(diamonds) # хвостик набор данных
View(diamonds) # прочитать любимому коту каждое наблюдение. На забудьте закрыть крестиком набор данных!
help(diamonds) # по встроенным функциям и наборам данных есть документация

qplot(data = diamonds, x = carat, y = price) # без осей — это незачётный график
qplot(data = diamonds, x = carat, y = price) +
  labs(title = "Данные по бриллиантам",
       subtitle = "(набор данных diamonds из R)",
       x = "Масса бриллианта (карат)",
       y = "Цена бриллианта (долларов)")

cos("sdfs", ) # красный крестик = ошибка
z=1 # синий ! английская королева HMQ рядом не сядет чай пить — исполняемый код с плохой стилистикой
# жёлтый треугольник — корректность кода зависит от наличия переменной carat в таблице diamonds

qplot(data = diamonds, x = carat) +
  labs(title = "Данные по бриллиантам",
       subtitle = "(набор данных diamonds из R)",
       x = "Масса бриллианта (карат)",
       y = "Количество бриллиантов")


getwd() # узнаём текущую рабочую папку
# устанавливаем рабочую папку
setwd("~/Downloads/")
# на винде что-то типа
# setwd("C:/Users/")
# используйте Tab

# экспортируем в желаемый формат
export(diamonds, "diamonds.xlsx")
export(diamonds, "diamonds.csv")

# импортируем
d = import("diamonds.xlsx")

# сравним d и diamonds
glimpse(d)
glimpse(diamonds)
# произошла потеря типа переменной
# например, cut была категориальной упорядоченной, а стало просто текстовой


# извлечём из таблицы отдельную переменную 
diamonds$cut

# описательные статистики по группа. Два варианта записи одной и той же команды:
group_by(diamonds, color) %>% skim()
skim(group_by(diamonds, color))

# классическая запись функций от Эйлера-Клеро:
cos(sin(sqrt(9)))
# прямой порядок записи функций
9 %>% sqrt() %>% sin() %>% cos()
