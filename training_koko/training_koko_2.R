#### 2
n <- 10^6

dost <- 6:14 # возможные очки за карты
mast <- c("бубны","черви","пики","крести") # возможные масти

# табличка соответствий между кодом карты, мастью и очками за ее получение
koloda <- expand.grid(dost,mast)

# удобные названия столбцов
colnames(koloda) <- c("dost","mast")


head(koloda,7)
tail(koloda,5)
koloda



s <- rep(0,times=n) # s - это вектор из n штук нулей
str(s)

for (i in 1:n) {
  z <- sample(1:36,36) # тасуем колоду

  # 25 - код пиковой дамы в таблице koloda
  dama <- z==25 # вектор из TRUE/FALSE, показывающий положение дамы
  k.dama <- (1:36)[dama] # координата дамы
  do.damy <- z[1:(k.dama-1)] # коды карт до дамы
  s[i] <- sum(koloda$dost[do.damy]) # полученный выигрыш в i-ом опыте
}

mean(s) # средний выигрыш за n опытов


######### задача 3

filename <- "~/science/econometrix/em301/datasets/flats_moscow.txt"
# filename <- "d:/papka1/flats_moscow.txt"

# загружаем файл в табличку h
h <- read.table(filename,header=TRUE)

# проверяем, что всё загрузилось
head(h)
str(h)


head(h$price)
x <- h$price[h$brick==1] # вектор цен для кирпичных домов
y <- h$price[h$brick==0] # вектор цен для некирпичных домов
n.x <- length(x) # количество квартир в кирпичных домах
n.x
n.y <- length(y)
n.y



z.cr <- qnorm(0.975)
z.cr

##### 3c

var.hat.c <- var(x)/n.x+var(y)/n.y
var.hat.c

ci.left.c <- mean(x)-mean(y)-z.cr*sqrt(var.hat.c)
ci.right.c <- mean(x)-mean(y)+z.cr*sqrt(var.hat.c)
ci.left.c
ci.right.c

##### 3b

var.hat.b <- var(x)/n.x
var.hat.b

ci.left.b <- mean(x)-z.cr*sqrt(var.hat.b)
ci.right.b <- mean(x)+z.cr*sqrt(var.hat.b)
ci.left.b
ci.right.b

#### 3d
z <- h$price
n <- length(z)

chi.cr.l <- qchisq(0.025,df=n-1)
chi.cr.l
chi.cr.r <- qchisq(0.975,df=n-1)
chi.cr.r


ci.left.d <- sd(z)^2*(n-1)/chi.cr.r
ci.right.d <- sd(z)^2*(n-1)/chi.cr.l

ci.left.d
ci.right.d


##### 3e

f.cr.l <- qf(0.025,df1=n.x-1,df2=n.y-1)
f.cr.r <- qf(0.975,df1=n.x-1,df2=n.y-1)

ci.left.e <- var(y)/var(x)*f.cr.l
ci.right.e <- var(y)/var(x)*f.cr.r

ci.left.e
ci.right.e


########## 5

# генерим искусственные данные
x <- rnorm(200,mean=4,sd=3)

# функция правдоподобия зависит от двух параметров и вектора данных
# param - вектор из двух параметров
# data - вектор данных
log_lik <- function(param,data) {
  mu <- param[1]
  s2 <- param[2]
  n <- length(data)
  result <- -n/2*log(2*pi)-n/2*log(s2)-sum((data-mu)^2)/(2*s2)
  return(-result)
}

log_lik(c(3,5),x)

# результаты оптимизации
optimum <- nlm(log_lik,p=c(0,1),hessian=TRUE,data=x)
optimum

# вектор оценок неизвестных параметров
theta.hat <- optimum$estimate

# матрица Гессе в точке оптимума
H <- optimum$hessian
print(H,digits=2)

# оценка ковариационной матрицы - это обратная матрица к матрице Гессе
var.theta <- solve(H) 

# стандартные отклонения - это корни из диагональных элементов
st.devs <- sqrt(diag(var.theta))
st.devs
z.cr

ci.left <- theta.hat - z.cr*st.devs
ci.right <- theta.hat + z.cr*st.devs

ci.left
ci.right
