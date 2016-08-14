---
layout: layout-bootstrap-tmp
title: "Chapter 2, Section 2.8"
categories: examples
permalink: 02-chapter2-part2.html
tags: codeexample
---

# Chapter 2: SSA analysis of one-dimensional time series, Section 2.8

Here you can find code listings in `R` language from the corresponding chapter of the book.

## Contents
{: .no_toc}
1. TOC
{:toc}

### Fragment 2.8.1 (‘Tree rings’: frequency decomposition)
{% highlight r %}
library(Rssa)
library(ssabook)
library(lattice)

data("dftreering")
L <- 300
s.tree <- ssa(dftreering, L = L, neig = L)
g.tree <- grouping.auto(s.tree, base = "series", 
                        freq.bins = c(0.1, 0.2, 0.3, 0.4, +Inf))
r.tree <- reconstruct(s.tree, groups = g.tree)

plot(r.tree, add.residuals = FALSE, add.original = TRUE,
     plot.method = "xyplot")

specs <- 
    lapply(r.tree, function(x) spectrum(x, plot = FALSE)$spec)
w.tree <- seq(0, length.out = length(specs$F1),
              by = 1/length(dftreering)) 

xyplot(F1 + F2 + F3 + F4 + F5 ~ w.tree, data = specs,
       superpose = FALSE, type = 'l', xlab = NULL, ylab = NULL,
       auto.key = list(lines = TRUE, points = FALSE,
                       column = 5))

{% endhighlight %}

#### Produced output
![Reconstruction](img/chapter_2/281-rec.svg)
![Periodogram](img/chapter_2/281-per.svg)

### Fragment 2.8.2 (‘FORT’: Basic SSA and Iterative O-SSA trends)
{% highlight r %}
library(Rssa)
library(lattice)

data("AustralianWine")
Nfull <- 120
wine <- window(AustralianWine,
               end = time(AustralianWine)[Nfull])

fort_sh <- window(wine[, "Fortified"],
                  start = c(1982, 6), end = c(1985, 12))
ss_sh <- ssa(fort_sh, L = 18)
res_ssa_sh <- reconstruct(ss_sh, groups = list(1, 2:7))
iss_sh <- iossa(ss_sh, nested.groups = list(1, 2:7),
                kappa = 0, maxiter = 1, tol = 1e-5)
res_issa_sh <- reconstruct(iss_sh, groups = iss_sh$iossa.groups)

theme <- simpleTheme(col = c("blue", "red", "black"),
                     lwd = c(1, 2, 1),
                     lty = c("solid", "solid", "dashed"))

xyplot(cbind(res_ssa_sh$F1, res_issa_sh$F1, wine[, "Fortified"]),
       superpose = TRUE,
       xlab = "", ylab = "", type = "l", lwd = c(1, 2, 1), 
       col = c("blue", "red", "black"),
       auto.key = list(text = c("Basic SSA trend",
                                "Iterative O-SSA trend",
                                "Full series"),
                       type = c("l", "l", "l"),
                       lines = TRUE, points = FALSE),
       par.settings = theme)
{% endhighlight %}

#### Produced output
![Reconstruction](img/chapter_2/282.svg)

### Fragment 2.8.3 (‘MotorVehicle’: Decomposition by Sequential SSA)
{% highlight r %}
library(Rssa)

data(MotorVehicle)
s1 <- ssa(MotorVehicle, L = 12)
res1 <- reconstruct(s1, groups = list(trend = 1))
trend <- res1$trend

plot(res1, add.residuals = FALSE, plot.type = "single",
     col = c("black", "red"), lwd = c(1, 2), 
     plot.method = "xyplot", superpose = TRUE)

res.trend <- residuals(res1)
s2 <- ssa(res.trend, L = 264)
res2 <- reconstruct(s2, groups = list(seasonality = 1:10))
seasonality <- res2$seasonality
res <- residuals(res2)
#the resultant decomposition consists of 
#trend, seasonality and residual
{% endhighlight %}

#### Produced output
![Reconstruction](img/chapter_2/283.svg)

### Fragments 2.8.4 (‘MotorVehicle’: Decomposition by DerivSSA) and 2.8.5 (‘MotorVehicle’: finding noise envelope)
{% highlight r %}
library(Rssa)
library(lattice)

data(MotorVehicle)
s <- ssa(MotorVehicle, L = 264)
sf <- fossa(s, nested.groups = 1:19)
rf <- reconstruct(sf, groups = 
                      list(seasonality = 1:10, trend = 11:19))
plot(rf, plot.method = "xyplot", superpose = TRUE, 
     add.residuals = FALSE,
     col = c("black", "darkgreen", "red"), lwd = c(1, 1, 2))
p<- parestimate(sf, groups = list(1:10), method = "esprit-ls")
print(p$period[seq(1, 10, 2)], digits = 3)

resf <- residuals(rf)
s.env <- ssa(resf^2, L = 30)
rsd <- sqrt(reconstruct(s.env, groups = list(1))$F1)
xyplot(resf + rsd + (-rsd) ~ time(resf), type = 'l') 

{% endhighlight %}

#### Produced output
![Reconstruction](img/chapter_2/284.svg)

```
[1]  3.00 12.01  2.40  5.99  4.02
```
![Envelope](img/chapter_2/285.svg)

### Fragment 2.8.6 (‘US unemployment’: Improvement by DerivSSA)
{% highlight r %}
library(Rssa)

data(USUnemployment)
ser <- USUnemployment[, "MALE"]
Time <- time(ser)
L = 204
ss <- ssa(ser, L = L, svd.method = "eigen")
res<- reconstruct(ss, groups = 
                      list(c(1:4, 7:11), c(5, 6, 12, 13)))
trend <- res$F1
seasonality <- res$F2
w1 <- wcor(ss, groups = 1:30)
fss <- fossa(ss, nested.groups = 
                 list(c(1:4, 7:11), c(5, 6, 12, 13)), 
             gamma = Inf)
fres <- reconstruct(fss, groups = list(5:13, 1:4))
ftrend <- fres$F1
fseasonality <- fres$F2

theme1 <- simpleTheme(col = c("grey", "blue","red"),
                      lwd = c(2, 1, 1),
                      lty = c("solid", "solid", "solid"))
theme2 <- simpleTheme(col = c("blue", "red"), lwd = c(1, 1),
                      lty = c("solid", "solid"))
p1 <- xyplot(ser + trend + ftrend ~ Time, 
             xlab = "", ylab = "", type = "l", lwd = c(2, 1, 1), 
             col = c("grey", "blue","red"),
             auto.key = list(text = c("Full series",
                                      "Basic SSA trend",
                                      "DerivSSA trend"),
                             type = c("l", "l", "l"),
                             lines = TRUE, points = FALSE),
             par.settings = theme1)
p2 <- xyplot(seasonality + fseasonality ~ Time, 
             xlab = "", ylab = "", type = "l", lwd = c(2, 1), 
             col = c("blue", "red"),
             auto.key = list(text = c("Basic SSA seasonality",
                                      "DerivSSA seasonality"),
                             type = c("l", "l"),
                             lines = TRUE, points = FALSE),
             par.settings = theme2)
plot(p1, split = c(1, 1, 1, 2), more = TRUE)
plot(p2, split = c(1, 2, 1, 2), more = FALSE)
{% endhighlight %}

#### Produced output
![Reconstruction](img/chapter_2/286.svg)

### Fragment 2.8.7 (‘Hotel’: SSA with projection, linear trend detection)
{% highlight r %}
library(Rssa)
library(lattice)
library(ssabook)

data("hotel")
len <- length(hotel)
n <- 24
hotel.2years <- window(hotel, end = time(hotel)[n])

sp <- ssa(hotel.2years, L = 12, 
          row.projector = "center", 
          column.projector = "center")
r <- reconstruct(sp, groups = list(trend = 1:2))

hotel.2years.data <- data.frame(x = 1:n, y = hotel.2years)
fit.2years <- lm(y ~ x, data = hotel.2years.data)
fit.2years.continued <- predict(fit.2years,
                                newdata = data.frame(x = 1:len)) 

hotel.data <- data.frame(x = 1:len, y = hotel)
fit <- lm(y ~ x, data = hotel.data)
fit.rec <- lm(r$trend ~ x, data = hotel.2years.data)
fit.rec.continued <- predict(fit.rec,
                             newdata = data.frame(x = 1:len)) 


xyplot(cbind(hotel,
             predict(fit),
             fit.2years.continued,
             ts(predict(fit.2years),
                start = c(1963, 1), freq = 12),
             fit.rec.continued,
             ts(predict(fit.rec),
                start = c(1963, 1), freq = 12)),
       superpose = TRUE,
       type = "l", ylab = "",
       lty = c(1, 2, 1, 1, 1, 1), 
       lwd = c(1, 2, 1, 5, 1, 5),
       col = c("black", "green", "red", "red", 
               "blue", "blue"),
       auto.key =
           list(text = c("Original series",
                         "General linear trend",
                         "Linear regression, forecasted",
                         "Linear regression",
                         "SSA with double centering",
                         "SSA with double centering, forecasted"),
                type = c("l", "l", "l", "l", "l", "l"),
                lines = TRUE, points = FALSE))
{% endhighlight %}

#### Produced output
![Comparison](img/chapter_2/287.svg)

### Fragment 2.8.8 (‘Hotel’: Iterative O-SSA, linear trend detection)
{% highlight r %}
library(Rssa)
library(lattice)
library(ssabook)

data("hotel")
n <- 30
hotel.2years <- window(hotel, end = time(hotel)[n])
s <- ssa(hotel.2years, L = 12)

ios <- iossa(s, nested.groups = list(1, 2:5))
r <- reconstruct(ios, groups = list(trend = 1))

hotel.2years.data <- data.frame(x = 1:n, y = hotel.2years)
fit.2years <- lm(y ~ x, data = hotel.2years.data)
fit.2years.continued <- predict(fit.2years,
                                newdata = data.frame(x = 1:len)) 

hotel.data <- data.frame(x = 1:len, y = hotel)
fit <- lm(y ~ x, data = hotel.data)
fit.rec <- lm(r$trend ~ x, data = hotel.2years.data)
fit.rec.continued <- predict(fit.rec,
                             newdata = data.frame(x = 1:len)) 

xyplot(cbind(hotel,
             predict(fit),
             fit.2years.continued,
             ts(predict(fit.2years),
                start = c(1963, 1), freq = 12),
             fit.rec.continued,
             ts(predict(fit.rec),
                start = c(1963, 1), freq = 12)),
       superpose = TRUE,
       type = "l", ylab = "",
       lty = c(1, 2, 1, 1, 1, 1), 
       lwd = c(1, 2, 1, 5, 1, 5),
       col = c("black", "green", "red", "red",
               "blue", "blue"),
       auto.key =
           list(text = c("Original series",
                         "General linear trend",
                         "Linear regression, forecasted",
                         "Linear regression",
                         "Iterative O-SSA",
                         "Iterative O-SSA, forecasted"),
                type = c("l", "l", "l", "l", "l", "l"),
                lines = TRUE, points = FALSE))

{% endhighlight %}

#### Produced output
![Comparison](img/chapter_2/288.svg)

### Fragment 2.8.9 (‘PayNSA’: Automatically identified trend)
{% highlight r %}
library(Rssa)
library(ssabook)
library(lattice)
data("paynsa")

n <- 241
pay <- window(paynsa, start = time(paynsa)[n])
s <- ssa(pay, L = 36)
g1 <- grouping.auto(s, base = "series", 
                    freq.bins = list(trend = 0.06), 
                    threshold = 0.7)
print(g1$trend)
plot(g1, order = TRUE, type = "b")
r1 <- reconstruct(s, g1)
plot(r1, plot.method = "xyplot", superpose = TRUE, 
     add.residuals = FALSE)

s1 <- ssa(pay - r1$trend, L = 120)
coef <- c(1 - 0.02, 1 + 0.02)
freq.bins.seas = list(s12 = 1/12 * coef, s6 = 1/6 * coef,
                      s4 = 1/4 * coef, s3 = 1/3 * coef,
                      s2.4 = 1/2.4 * coef, s2 = 1/2 * coef)
g3 <- grouping.auto(s1, base = "series", groups = 1:20,
                    freq.bins = freq.bins.seas, 
                    threshold = list(0.6))
p1 <- plot(g3, order = TRUE, scales = NULL,
           auto.key = list(columns = 3))
p2 <- plot(g3, order = FALSE, scales = NULL,
           auto.key = list(columns = 3))
plot(p1, split = c(1, 1, 2, 1), more = TRUE)
plot(p2, split = c(2, 1, 2, 1), more = FALSE)
r3 <- reconstruct(s1, groups = list(unlist(g3)))
plot(r3, plot.method = "xyplot", add.residuals = FALSE, 
     add.original = FALSE)

specNSA <- spectrum(pay - r3$F1, plot = FALSE)
specSA <- spectrum(pay, plot = FALSE)
w.pay <- seq(0, length.out = length(specNSA$spec), 
             by = 1/length(pay)) 
xyplot(log(specNSA$spec) + log(specSA$spec) ~ w.pay, 
       type = 'l', xlab = NULL, ylab = NULL)
{% endhighlight %}

#### Produced output
```
[1]  1  2  3  8 12
```
![Relative contribution](img/chapter_2/289-contrib.svg)
![Reconstruction](img/chapter_2/289-rec.svg)
![Relative contribution](img/chapter_2/289-contrib2.svg)
![Reconstruction](img/chapter_2/289-rec2.svg)
![Periodogram](img/chapter_2/289-per.svg)

### Fragment 2.8.10 (‘Elec’: Log-transformation)
{% highlight r %}
library(Rssa)
library(lattice)
library(fma)
elec.log <- log(elec)
Time <- time(elec)

s <- ssa(elec, L = 12)
r <- reconstruct(s, groups = list(trend = c(1)))
sl <- ssa(elec.log, L = 12)
rl <- reconstruct(sl, groups = list(trend = c(1)))

xyplot(elec + exp(as.vector(rl$trend)) + r$trend +
           (elec - r$trend) ~ Time, 
       superpose = TRUE, type ="l", ylab = NULL, xlab = NULL,
       auto.key = list(text = c("original", 'exp(log-trend)', 
                                'trend', 'residual')))
{% endhighlight %}

#### Produced output
![Comparison](img/chapter_2/2810.svg)
