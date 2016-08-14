---
layout: layout-bootstrap-tmp
title: "Chapter 3"
categories: examples
permalink: 03-chapter3.html
tags: codeexample
---

# Chapter 3: Parameter estimation, forecasting, gap filling

Here you can find code listings in `R` language from the corresponding chapter of the book.

## Contents
{: .no_toc}
1. TOC
{:toc}

### Fragment 3.1.1 (LRRs and roots of characteristic polynomials)

{% highlight r %}

library(Rssa)
x <- 1.01^(1:10)
s <- ssa(x, L = 2)
l <- lrr(s, groups = list(1))
print(l)
roots(l)

#extraneous roots
x <- 1.01^(1:10)
s <- ssa(x, L = 6)
l <- lrr(s, groups = list(1))
r <- roots(l)
plot(l)

#multiple roots
x <- 2.188 * (1:10) + 7.77
s <- ssa(x, L = 3)
l <- lrr(s, groups = list(1:2))
print(l)
roots(l)

{% endhighlight %}

#### Produced output
![Roots](img/chapter_3/311.svg)

```
[1] 1.01
attr(,"class")
[1] "lrr"
[1] -1  2
attr(,"class")
[1] "lrr"
[1] 1.0000003 0.9999997
```

### Fragment 3.1.2 (Parameter estimation for ‘CO2’)

{% highlight r %}
library(Rssa)
s <- ssa(co2)
# Estimate the periods from 2nd and 3rd eigenvectors 
# using default 'pairs' method
print(parestimate(s, groups = list(c(2, 3)), method = "pairs"))
# Estimate the periods and rates using ESPRIT
pe <- parestimate(s, groups = list(1:6), 
                  method = "esprit-ls")
print(pe)
plot(pe)
{% endhighlight %}

#### Produced output
![Roots](img/chapter_3/312.svg)

```
   period     rate   |    Mod     Arg  |     Re        Im
   11.995   0.000000 |  1.00000   0.52 |  0.86592   0.50019

   period     rate   |    Mod     Arg  |     Re        Im
   11.995   0.000542 |  1.00054   0.52 |  0.86638   0.50047
  -11.995   0.000542 |  1.00054  -0.52 |  0.86638  -0.50047
    5.999   0.000512 |  1.00051   1.05 |  0.50015   0.86653
   -5.999   0.000512 |  1.00051  -1.05 |  0.50015  -0.86653
      Inf   0.000375 |  1.00037   0.00 |  1.00037   0.00000
      Inf  -0.008308 |  0.99173   0.00 |  0.99173   0.00000
```

### Fragment 3.2.1 (Forecasting of ‘CO2’)
{% highlight r %}
library(Rssa)

# Decomposition stage
s <- ssa(co2, L = 120)
# Recurrent forecast, the result is the forecast values only
# The result is the set of forecasts for each group
for1 <- rforecast(s, groups = list(1, c(1,4), 1:4, 1:6), 
                  len = 12)

matplot(data.frame(for1), type = 'b', 
        pch = c('1', '2', '3', '4'), ylab = "")

# Vector forecast, the forecasted points are 
# added to the base series
for1a <- vforecast(s, 
                   groups = list(1, trend = c(1,4), 1:4, 1:6), 
                   len = 36, only.new = FALSE)

# Plot of the forecast based on the second group c(1,4)
plot(cbind(co2, for1a$trend), plot.type = 'single', 
     col = c('black', 'red'), ylab = NULL)

# Reverse recurrent forecast
len <- 60
for2 <- rforecast(s, groups = list(1:6), len = len, 
                  only.new = TRUE, reverse =  TRUE)

initial <- c(rep(NA, len), co2)
forecasted <- c(for2, rep(NA, length(co2)))
matplot(data.frame(initial, forecasted), ylab = NULL,
        type = 'l', col = c('black', 'red'), lty = c(1, 1))

set.seed(3)
for4 <- forecast(s, groups = list(1:6), 
                 method = "bootstrap-recurrent", 
                 len = 24, R = 20, level = 0.99)

plot(for4, include = 36, shadecols = "green", type = "l")

{% endhighlight %}

#### Produced output
![Forecast](img/chapter_3/321-for1.svg)
![Forecast](img/chapter_3/321-for2.svg)
![Forecast](img/chapter_3/321-for3.svg)
![Forecast](img/chapter_3/321-for4.svg)

### Fragment 3.3.1 (Subspace-based gap filling)
{% highlight r %}
library(Rssa)
F <- co2 
F[201:300] <- NA
s <- ssa(F, L = 72)
g0 <- gapfill(s, groups = list(c(1, 4)), method = "sequential", 
              alpha = 0, base = "reconstructed")
g1 <- gapfill(s, groups = list(c(1, 4)), method = "sequential", 
              alpha = 1, base = "reconstructed")
g <- gapfill(s, groups = list(c(1, 4)), method = "sequential", 
             base = "reconstructed")

par(cex = 7/12)
plot(co2, col = "black")
lines(g0, col = "blue", lwd = 2)
lines(g1, col = "green", lwd = 2)
lines(g, col = "red", lwd = 2)

{% endhighlight %}
#### Produced output
![Forecast](img/chapter_3/331.svg)

### Fragment 3.3.2 (Iterative gap filling, one gap)
{% highlight r %}
library(Rssa)
F <- co2 
F[201:300] <- NA
is <- ssa(F, L = 72)
ig <- igapfill(is, groups = list(c(1,4)), 
               base = "reconstructed")
igo <- igapfill(is, groups = list(c(1,4)), 
                base = "original")
# Compare the result
par(cex = 7/12)
plot(co2, col="black")
lines(ig, col = "blue", lwd = 1)
lines(igo, col = "red", lwd = 1)

ig1 <- igapfill(is, groups = list(c(1, 4)), 
                base = "original", maxiter = 1)
ig5 <- igapfill(is, groups = list(c(1, 4)), fill = ig1,
                base = "original", maxiter = 4)
ig10 <- igapfill(is, groups = list(c(1, 4)), fill = ig5, 
                 base = "original", maxiter = 5)
init.lin <- F  
init.lin[200:301] <- F[200] + (0:101) / 101 * (F[301] - F[200])
ig.lin <- igapfill(s, 
                   fill = init.lin, 
                   groups = list(c(1, 4)), 
                   base = "original", maxiter = 10)
# Compare the result
par(cex = 7/12)
plot(co2, col = "black")
lines(ig1, col = "green", lwd = 1)
lines(ig5, col = "blue", lwd = 1)
lines(ig10, col = "red", lwd = 1)
lines(ig.lin, col = "darkred", lwd = 1)

{% endhighlight %}

#### Produced output
![Gap filling](img/chapter_3/332-gf1.svg)
![Gap filling](img/chapter_3/332-gf2.svg)

### Fragment 3.3.3 (Iterative gap filling, several gaps)
{% highlight r %}
library(Rssa)
library(lattice)

F <- co2 
loc <- c(11:17, 61:67, 71:77, 101:107)
F[loc] <- NA;
sr <- ssa(F, L = 200)
igr <- igapfill(sr, groups = list(c(1:6)), fill = 320,
                base = "original", maxiter = 10)
gr <- gapfill(sr, groups = list(c(1:6)), 
              method = "simultaneous", base = "original")
G <- rep(NA, length(F)); G[loc] = gr[loc]
mean((gr[loc] - co2[loc])^2) #MSE of gapfill
mean((igr[loc] - co2[loc])^2) #MSE of igapfill

xyplot(igr + G + F ~ time(co2), type = "l", 
       lwd = c(1, 2, 1), ylab = NULL,
       auto.key = list(lines = TRUE, points = FALSE, 
                       text = c("igapfill", "gapfill", "series")))

{% endhighlight %}

#### Produced output
```
[1] 0.1132225
[1] 0.1425962
```
![Gap filling](img/chapter_3/333.svg)

### Fragment 3.4.1 (Weighted Cadzow approximation)
{% highlight r %}
library(Rssa)
library(lattice)

cut <- 49 + 60
x <- window(co2, end = time(co2)[length(co2) - cut + 1])
L <- 60
K <- length(x) - L + 1
alpha <- 0.01

weights <- vector(len = K)
weights[1:K] <- alpha
weights[seq(K, 1, -L)] <- 1

# xyplot(weights ~ 1:K, type = "l")

s1 <- ssa(x, L = L) #to detect the series rank

ncomp <- 6
s01 <- ssa(x, L = L, column.oblique = "identity", 
           row.oblique = weights)
c01 <- cadzow(s01, rank = ncomp, maxiter = 10)

s01.1 <- ssa(c01, L = L, column.oblique = NULL, 
             row.oblique = NULL)
c01.1 <- cadzow(s01.1, rank = ncomp, tol = 1.e-8 * mean(co2))
print(t(ssa(c01.1, L = ncomp + 1)$sigma), digits = 5)

ss01.1<- ssa(c01.1, L = ncomp + 1)
fr <- rforecast(ss01.1, groups = list(1:ncomp), len = cut)

xyplot(cbind(Original = co2, Cadzow1and01 = c01.1, 
             ForecastCadzow = fr), superpose = TRUE)

parestimate(ss01.1, groups = list(1:ncomp), 
            method = "esprit-ls")

{% endhighlight %}
#### Produced output
```
      [,1]   [,2]   [,3]  [,4]  [,5]     [,6] [,7]
[1,] 16472 73.537 41.096 12.29 4.674 0.044457    0

   period     rate   |    Mod     Arg  |     Re        Im
   11.998   0.000525 |  1.00053   0.52 |  0.86643   0.50035
  -11.998   0.000525 |  1.00053  -0.52 |  0.86643  -0.50035
      Inf   0.000451 |  1.00045   0.00 |  1.00045   0.00000
    5.998   0.000287 |  1.00029   1.05 |  0.49986   0.86644
   -5.998   0.000287 |  1.00029  -1.05 |  0.49986  -0.86644
      Inf  -0.004623 |  0.99539   0.00 |  0.99539   0.00000
```
![Comparison](img/chapter_3/341.svg)

### Fragment 3.4.2 (Accuracy of weighted Cadzow approximation)

Warning: this example takes a lot of computational time.
{:.alert .alert-warning}

{% highlight r %}
library(Rssa)

#SIMUL <- FALSE
SIMUL <- TRUE
set.seed(3)
L <- 20
N <- 2 * L
K <- N - L + 1
alpha <- 0.01

sigma <- 1
signal <- 5 * sin(2 * pi * (1:N) / 6)

weights <- vector(len = K)
weights[1:K] <- alpha
weights[seq(1, K, L)] <- 1

err <- 0
err.alpha <- 0

M <- 1000

norm.meansq <- function(x){mean(x^2)}

if(SIMUL){
    for(i in 1:M){
        x <- signal + sigma * rnorm(N)
        s.alpha <- ssa(x, L = L, column.oblique = NULL, 
                       row.oblique = weights)
        c.alpha <- cadzow(s.alpha, rank = 2, tol = 1.e-8, 
                          norm = norm.meansq, 
                          correct = FALSE)
        s <- ssa(x, L = L)
        cс <- cadzow(s, rank = 2, norm = norm.meansq, tol = 1.e-8, 
                     correct = FALSE)
        err <- err + mean((cс - signal)^2)
        err.alpha <- err.alpha + mean((c.alpha - signal)^2)
    }
    RMSE <- data.frame(err, err.alpha)
    save(RMSE, file="cadzow_sim.RData")
}

load("cadzow_sim.RData", .GlobalEnv)
print(sqrt(RMSE$err / M))
print(sqrt(RMSE$err.alpha / M))
{% endhighlight %}

#### Produced output
```
[1] 0.3753331

[1] 0.3222088
```

### Fragment 3.5.1 (‘Elec’: trend forecasting and iossa)
{% highlight r %}
library(Rssa)
library(lattice)

data(elec, package = "fma")
N <- length(elec)
len <- 24

L <- 24
s <- ssa(window(elec, end = c(1993, 8)), L = L)
si <- iossa(s, nested.groups = list(c(1, 4), c(2, 3, 5:10)))
fi <- rforecast(si, groups = list(trend = c(1:2)), 
                len = len, only.new = FALSE)

s0 <- ssa(window(elec, start = c(1972, 8), end = c(1993, 8)), 
          L = L)
f0 <- vforecast(s0, groups = list(trend = c(1)), 
                len = len, only.new = TRUE)
si0 <- iossa(s0, nested.groups = list(c(1,4), c(2,3,5:10)))
fi0 <- vforecast(si0, groups = list(trend = c(1:2)), 
                 len = len, only.new = TRUE)

theme <- simpleTheme(col = c("black", "red", "blue", "green"),
                     lwd = c(1, 1, 2, 2),
                     lty = c("solid", "solid", 
                             "solid", "dashed"))

xyplot(cbind(elec,
             window(fi, end = c(1993, 8)),
             window(fi, start = c(1993, 9)),
             fi0), 
       superpose = TRUE, type ="l", ylab = NULL, xlab = NULL,
       auto.key = list(text = c("original", 'trend', 
                                'forecast', 'forecast0'),
                       type = c("l", "l", "l", 'l'),
                       lines = TRUE, points = FALSE),
       par.settings = theme)
{% endhighlight %}

#### Produced output
![Forecast](img/chapter_3/351.svg)

### Fragment 3.5.2 (‘Elec’: combined forecasting)

{% highlight r %}
library(Rssa)
library(lattice)
data(elec, package = "fma")

L <- 240
elec_sa <- elec - fi
s_sa <- ssa(window(elec_sa, end = c(1993, 8)), L = L)
f_sa <- rforecast(s_sa, groups = list(trend = c(1:13)), 
                  len = len, only.new = FALSE)

theme <- simpleTheme(col = c("black", "red", "green"),
                     lwd = c(1, 2, 2),
                     lty = c("solid", "solid", "solid"))

xyplot(cbind(window(elec, start = c(1985, 12)),
             window(fi, start = c(1985, 12), end = c(1993, 8)),
             window(fi, start = c(1993, 9)) + 
                 window(f_sa, start = c(1993, 9))),
       superpose = TRUE, type = "l", ylab = NULL, xlab = NULL,
       auto.key = list(text = c("original", 'trend', 
                                'forecast'),
                       type = c("l", "l", "l"),
                       lines = TRUE, points = FALSE),
       par.settings = theme)
{% endhighlight %}

#### Produced output
![Forecast](img/chapter_3/352.svg)

### Fragment 3.5.3 (‘Cowtemp’: different methods of forecasting)
{% highlight r %}
library(Rssa)
library(lattice)

data(cowtemp, package = "fma")
series <- cowtemp

N <- length(series)
cut <- 14
future <- 21
len <- cut + future
r <- 1

L <- 28
Lt <- 14
s <- ssa(window(series, end = N - cut), L = L)
parestimate(s, groups = list(trend = c(1:r)), 
            method = "esprit-ls")$moduli
roots(lrr(s, groups = list(trend = c(1:r))))[1]
rec <- reconstruct(s, groups = list(1:r))
st <- ssa(window(series, end = N - cut), 
          kind = "toeplitz-ssa", L = Lt)
parestimate(st, groups = list(trend = c(1:r)), 
            method = "esprit-ls")$moduli
parestimate(st, groups = list(trend = c(1:r)), 
            normalize.roots = FALSE,
            method = "esprit-ls")$moduli
roots(lrr(st, groups = list(trend = c(1:r))))[1]
fr <- rforecast(s, groups = list(trend = c(1:r)), 
                len = len, only.new = TRUE)
fv <- vforecast(s, groups = list(trend = c(1:r)), 
                len = len, only.new = FALSE)
ftr <- rforecast(st, groups = list(trend = c(1:r)), 
                 len = len, only.new = FALSE)
sqrt(mean((window(fr, start = 62) - 
               window(series, start = 62))^2))
sqrt(mean((window(fv, start = 62) - 
               window(series, start = 62))^2))
sqrt(mean((window(ftr, start = 62) - 
               window(series, start = 62))^2))

theme <- simpleTheme(col = c("black", "red", "blue", 
                             "green", "violet"),
                     lwd = c(1, 1, 2, 2, 1),
                     lty = c("solid", "solid", "solid", 
                             "dashed", "solid"))

future.NA <- rep(NA, future)

xyplot(cbind(series, rec$F1, fr, fv, ftr),
       superpose = TRUE, type = "l", ylab = NULL, xlab = NULL,
       auto.key = list(text = c("original series", 
                                'reconstructed series', 
                                'recurrent forecast', 
                                'vector forecast', 
                                'recurrent Toeplitz forecast'),
                       type = c("l", "l", "l", "l", "l"),
                       lines = TRUE, points = FALSE),
       par.settings = theme)
{% endhighlight %}

#### Produced output
```
[1] 5.711485
[1] 5.253602
[1] 4.785783
```
![Forecast](img/chapter_3/353.svg)