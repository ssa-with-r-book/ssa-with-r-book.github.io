---
layout: layout-bootstrap-tmp
title: "Chapter 2: SSA analysis of one-dimensional time series"
categories: examples
permalink: 01-chapter2.html
tags: codeexample
---

# Chapter 2: SSA analysis of one-dimensional time series

Here you can find code listings in `R` language from the corresponding chapter of the book.

## Contents
{: .no_toc}
1. TOC
{:toc}

### Fragments 2.1.1 (‘Australian Wines’: Input) and 2.1.2 (‘FORT’: Reconstruction)

{% highlight r %}

library("Rssa")
data("AustralianWine")
wine <- window(AustralianWine, end = time(AustralianWine)[174])

fort <- wine[, "Fortified"]
s.fort <- ssa(fort, L = 84, kind = "1d-ssa")
r.fort <- reconstruct(s.fort, groups = list(Trend = 1,
                              Seasonality = 2:11))
plot(r.fort, add.residuals = TRUE, add.original = TRUE,
     plot.method = "xyplot",
     superpose = TRUE, auto.key = list(columns = 2))

{% endhighlight %}

#### Produced output
![Reconstruction](img/chapter_2/211-212.svg)

### Fragment 2.1.3 (‘FORT’: Identification)

{% highlight r %}

plot(s.fort, type = "vectors", idx = 1:8)
plot(s.fort, type = "paired", idx = 2:11, plot.contrib = FALSE)
parestimate(s.fort, groups = list(2:3, 4:5),
                    method = "pairs")

plot(wcor(s.fort, groups = 1:30), scales = list(at = c(10, 20, 30)))

plot(reconstruct(s.fort, groups = list(G12 = 2:3, G4 = 4:5,
                                       G6 = 6:7, G2.4 = 8:9)),
       plot.method = "xyplot", layout = c(2, 2),
       add.residuals = FALSE, add.original = FALSE)

{% endhighlight %}

#### Produced output

```
$F1
   period     rate   |    Mod     Arg  |     Re        Im
   11.971   0.000000 |  1.00000   0.52 |  0.86540   0.50109

$F2
   period     rate   |    Mod     Arg  |     Re        Im
    4.005   0.000000 |  1.00000   1.57 |  0.00177   1.00000
```

![Eigenvectors](img/chapter_2/213-vec.svg)
![Pairs of Eigenvectors](img/chapter_2/213-pair.svg)
![W-correlation Matrix](img/chapter_2/213-wcor.svg)
![Reconstruction](img/chapter_2/213-rec.svg)

### Fragment 2.2.1 (Noisy sinusoid: Toeplitz SSA)

{% highlight r %}

library("Rssa")
N <- 100
sigma <- 0.5
set.seed(1)
F <- sin (2 * pi * (1:N) / 7) + sigma * rnorm(N)
Fcenter <- F - mean(F)
st <- ssa(Fcenter, L = 50, kind = "toeplitz-ssa")
s <- ssa(F, L = 50, kind = "1d-ssa")
p <- plot(s, type = "vectors", idx = 1:4, layout = c(4, 1))
pt <- plot(st, type = "vectors", idx = 1:4, layout = c(4, 1))
plot(pt, split = c(1, 1, 1, 2), more = TRUE)
plot(p, split = c(1, 2, 1, 2), more = FALSE)
pt <- plot(reconstruct(st, groups = list(1:2)),
                  plot.method = "xyplot", layout = c(3, 1))
p <- plot(reconstruct(s, groups = list(1:2)),
                   plot.method = "xyplot", layout = c(3, 1))
plot(pt, split = c(1, 1, 1, 2), more = TRUE)
plot(p, split = c(1, 2, 1, 2), more = FALSE)

{% endhighlight %}

#### Produced output
![Eigenvectors](img/chapter_2/221-vec.svg)
![Reconstruction](img/chapter_2/221-rec.svg)

### Fragment 2.2.2 (Simulation: comparison of Toeplitz and Basic SSA)

Warning: this example takes a lot of computation time.
{:.alert .alert-warning}

{% highlight r %}
library("Rssa")
SIMUL <- TRUE
N <- 100
sigma <- 0.5
set.seed(1)
#alpha <- 0
alpha <- seq(0.0, 0.01, 0.001)
L <- 50
len <- length(alpha)
erra <- vector(length = len)
erra.t <- vector(length = len)
Q <- 1000
err <- vector(length = Q)
err.t <- vector(length = Q)
if(SIMUL){
    m <- 1
    for(a in alpha){
        for(i in 1:Q){
            S <- exp(a * (1:N)) * sin(2 * pi * (1:N) / 7)
            F <- S + sigma * rnorm(N)
            Fcenter <- F - mean(F)
            st <- ssa(Fcenter, L = L, kind = "toeplitz-ssa")
            s <- ssa(F, L = L, kind = "1d-ssa")
            rec <- reconstruct(s, groups = list(1:2))$F1
            rec.t <- reconstruct(st, groups = list(1:2))$F1
            err[i] <- mean((rec - S)^2)
            err.t[i] <- mean((rec.t - S)^2)
        }
        erra[m] <- sqrt(mean(err))
        erra.t[m] <- sqrt(mean(err.t))
        m <- m + 1
    }
    
    RMSE <- data.frame(erra, erra.t)
    save(RMSE, file="toeplitz_sim.RData")
} 

load("toeplitz_sim.RData", .GlobalEnv)
matplot(alpha, RMSE, type = 'l', ylim = c(0, 0.25))

{% endhighlight %}

#### Produced output
![Eigenvectors](img/chapter_2/222.svg)

### Fragment 2.3.1 (‘CO2’: SSA with projection)

{% highlight r %}
library("Rssa")
s2 <- ssa(co2, column.projector = "centering", 
          row.projector = "centering")
plot(reconstruct(s2, groups = 
                     list(Linear.trend = seq_len(nspecial(s2)))),
     add.residuals = FALSE, plot.method = "matplot")

s4 <- ssa(co2, column.projector = 2, row.projector = 2)

plot(reconstruct(s4, groups = 
                     list(Trend = seq_len(nspecial(s4)))),
     add.residuals = FALSE, plot.method = "matplot")

plot(s4, type = "vectors", idx = 1:12)
r <- reconstruct(s4,
                 groups = 
                     list(Signal = c(seq_len(nspecial(s4)), 5:8)))
plot(r, plot.method = "xyplot")

{% endhighlight %}

#### Produced output
![Reconstruction](img/chapter_2/231-rec1.svg)
![Reconstruction](img/chapter_2/231-rec2.svg)
![Eigenvectors](img/chapter_2/231-vec.svg)
![Reconstruction](img/chapter_2/231-rec3.svg)

### Fragment 2.3.2 (Polynomial trend: SSA with projection)

{% highlight r %}

library(Rssa)
library(lattice)
N <- 199
tt <- (1:N) / N
r <- 5
F0 <- 10 * (tt - 0.5)^r
F <- F0 + sin(2 * pi * (1:N) / 10)
L <- 100
dec <- ssa(F, L = L, column.projector = 3, row.projector = 3)
rec1 <- reconstruct(dec, groups = 
                        list(Trend = seq_len(nspecial(dec))))
fit1 <- rec1$Trend

fit1_3b <- lm(fit1 ~ poly((1:N), r, raw = TRUE))
fit3b <- lm(F ~ poly((1:N), r, raw = TRUE))
li <- 1:199

d <- data.frame(Initial = F[li],
                dproj = fit1[li],
                dproj_reg = predict(fit1_3b)[li],
                regr = predict(fit3b)[li], trend = F0[li])
xyplot(as.formula(paste(paste(colnames(d), collapse = "+"),
                        "~", "1:nrow(d)")),
       data = d,
       type = "l", ylab = "", xlab = "",
       lty = c(1, 1, 1, 1, 1), lwd = c(1, 2, 2, 2, 2),
       auto.key = list(columns = 3,
                       lines = TRUE, points = FALSE))

{% endhighlight %}

#### Produced output
![Comparison](img/chapter_2/232.svg)

### Fragment 2.4.1 (Noisy sum of three sinusoids: Iterative O-SSA)

{% highlight r %}

library(Rssa)
library(lattice)
N <- 100
L <- 50
omega1 <- 0.07
omega2 <- 0.065
omega3 <- 0.15
sigma <- 0.1
set.seed(3)

F <- 2 * sin(2 * pi * omega1 * (1:N)) + 
    sin(2 * pi * omega2 * (1:N)) +
    3 * sin(2 * pi * omega3 * (1:N)) + sigma * rnorm(N)
xyplot(F ~ 1:N, type = 'l')
s <- ssa(F, L)
plot(s, type = "vectors", idx = 1:8, layout = c(4, 2))
plot(wcor(s, groups = 1:20))

ios <- iossa(s, nested.groups = list(3:4, 5:6), maxiter = 1000)
plot(ios, type = "vectors", idx = 1:8, layout = c(4, 2))
ior <- reconstruct(ios, groups = c(list(1:2), ios$iossa.groups))
plot(ior, plot.method = "xyplot", add.original = FALSE,
     add.residuals = FALSE)


{% endhighlight %}

#### Produced output
![Plot](img/chapter_2/241-plot.svg)
![Eigenvectors](img/chapter_2/241-vec1.svg)
![W-correlation Matrix](img/chapter_2/241-wcor.svg)
![Eigenvectors](img/chapter_2/241-vec2.svg)
![Reconstruction](img/chapter_2/241-rec.svg)

### Fragment 2.4.2 (Noisy sum of three sinusoids: Iterative O-SSA, summary)

{% highlight r %}

print(ios$iossa.groups)
summary(ios)

{% endhighlight %}

#### Produced output
```
[[1]]
[1] 3 4

[[2]]
[1] 5 6


Call:
iossa.ssa(x = s, nested.groups = list(3:4, 5:6), maxiter = 1000)

Series length: 100, Window length: 50,  SVD method: eigen
Special triples:  0

Computed:
Eigenvalues: 50,  Eigenvectors: 50, Factor vectors: 6

Precached: 0 elementary series (0 MiB)

Overall memory consumption (estimate): 0.0352 MiB

Iterative O-SSA result:
  Converged:             yes
  Iterations:            243
  Initial mean(tau):     0.1032
  Initial tau:           0.0007976, 0.2055299
  I. O-SSA mean(tau):    0.0004452
  I. O-SSA tau:          0.0006709, 0.0002196
  Initial max wcor:      0.02442
  I. O-SSA max wcor:     0.06986
  I. O-SSA max owcor:    0.0732
```

### Fragments 2.4.3 (Dependence of iossa error on difference between frequencies) and 2.4.4 (Plotting of dependence of iossa error on difference between frequencies)

Warning: this example takes a lot of computation time.
{:.alert .alert-warning}

{% highlight r %}

library(Rssa)
library(lattice)

eval.iter_err <- TRUE

if (eval.iter_err) {
    N <- 150
    L <- 70
    omega2 <- 0.06
    
    lseq <- c(seq(0.03, 0.058, 0.002), seq(0.062, 0.1, 0.002))
    F2.real <- 1.2 * sin(2 * pi * omega2 * (1:N))
    iter0 <-
        sapply(lseq,
               function(omega1) {
                   F <- sin(2 * pi * omega1 * (1:N)) + F2.real
                   iossa(ssa(F, L),
                         nested.groups = list(1:2, 3:4),
                         kappa = 2, maxiter = 200,
                         trace = FALSE)$iossa.result$iter
               })
    
    M <- 10 #1000
    set.seed(1)
    est.err <- function() {
        noise <- rnorm(N)
        sapply(lseq,
               function(omega1) {
                   F1.real <- sin(2 * pi * omega1 * (1:N))
                   F <- F1.real + F2.real + noise
                   ss <- iossa(ssa(F, L),
                               nested.groups = list(1:2, 3:4),
                               kappa = 2, maxiter = 200,
                               trace = FALSE)
                   omega1.est <-
                       1 / parestimate(ss, groups = list(1:2),
                                       method = "esprit-ls")[[2]][1]
                   omega2.est <-
                       1 / parestimate(ss, groups = list(3:4),
                                       method = "esprit-ls")[[2]][1]
                   
                   omegas.est <- range(omega1.est, omega2.est)
                   if (omega2 < omega1)
                       omegas.est <- rev(omegas.est)
                   
                   c(iter = ss$iossa.result$iter,
                     er1 = (omega1 - omegas.est[1])^2,
                     er2 = (omega2 - omegas.est[2])^2)
               })
    }
    res <- replicate(M, est.err())
    
    iter <- res["iter", , ]
    er1 <- res["er1", , ]
    er2 <- res["er2", , ]
    
    raw <- list(iter = iter, er1 = er1, er2 = er2)
}

rowMeansQuantile <- function(x, level = 0.05) {
    apply(x, 1,
          function(x) {
              q <- quantile(x, c(level / 2, 1 - level / 2))
              x[x < q[1]] <- q[1]
              x[x > q[2]] <- q[2]
              
              mean(x)
          })
}

data_iter1 <- rowMeansQuantile(raw$iter)
data_err1 <- sqrt(rowMeansQuantile(raw$er1))
data_err2 <- sqrt(rowMeansQuantile(raw$er2))

data_iter0 <- iter0
# Remove 200-s
is200 <- which(iter0 == 200)
data_iter0[is200] <- NA
data_iter0[range(is200)] <- 200

xlab <- expression(omega[1])
ylab1 <- expression(N[plain(iter)])
ylab2 <- expression(RMSE)

p1 <- xyplot(
    data_iter1 + iter0 ~ lseq,
    type = "l", ylab = ylab1, xlab = xlab
)
p2 <- xyplot(
    data_err1 + data_err2 ~ lseq,
    type = "l", ylab = ylab2, xlab = xlab
)

print(p1, split = c(1, 1, 1, 2), more = TRUE)
print(p2, split = c(1, 2, 1, 2), more = FALSE)

{% endhighlight %}

#### Produced output
![Comparison](img/chapter_2/243-244.svg)

### Fragment 2.5.1 (Separation of two sine waves with equal amplitudes)

{% highlight r %}

library(Rssa)

N <- 100
L <- 50
omega1 <- 0.03
omega2 <- 0.06
sigma <- 0.1
set.seed(3)
F <- sin(2 * pi * omega1 * (1:N)) + 
    sin(2 * pi * omega2 * (1:N)) + 
    sigma * rnorm(N)
s <- ssa(F, L = L, neig = min(L, N - L + 1)) #full decomposition

plot(s)

p1 <- plot(s, type = "vectors", idx = 1:4, layout = c(4, 1),
           main = "Eigenvectors, Basic SSA")
fos <- fossa(s, nested.groups = list(1:2, 3:4), gamma = 10, 
             normalize = FALSE)
#the total percent is equal to 100%
sum(fos$sigma^2) / sum(s$sigma^2) * 100 
p2 <- plot(fos, type = "vectors", idx = 1:4, layout = c(4, 1),
           main = "Eigenvectors, SSA with derivatives")
ios1 <- iossa(s, nested.groups = list(1:2, 3:4), maxiter = 1)
#the total percent is not equal to 100%
sum(ios1$sigma^2) / sum(s$sigma^2) * 100 
p3 <- plot(ios1, type = "vectors", idx = 1:4, layout = c(4, 1),
           main = "Eigenvectors, Iterative O-SSA, 1 iter")
ios2 <- iossa(ios1, nested.groups = list(1:2, 3:4), maxiter = 1)
#the total percent is not equal to 100%
sum(ios2$sigma^2) / sum(s$sigma^2) * 100 
p4 <- plot(ios2, type = "vectors", idx = 1:4, layout = c(4, 1),
           main = "Eigenvectors, Iterative O-SSA, 2 iter")

plot(p1, split = c(1, 1, 1, 4), more = TRUE)
plot(p2, split = c(1, 2, 1, 4), more = TRUE)
plot(p3, split = c(1, 3, 1, 4), more = TRUE)
plot(p4, split = c(1, 4, 1, 4), more = FALSE)

fo.rec <- reconstruct(fos, groups = list(1:2, 3:4))
pr1 <- plot(fo.rec, plot.method = "xyplot", 
            main = "SSA with derivatives", xlab = "")
io.rec <- reconstruct(ios2, groups = ios2$iossa.groups)
pr2 <- plot(io.rec, plot.method = "xyplot",
            main = "Iterative O-SSA", xlab = "")
plot(pr1, split = c(1, 1, 1, 2), more = TRUE)
plot(pr2, split = c(1, 2, 1, 2), more = FALSE)

{% endhighlight %}

#### Produced output
![Norms](img/chapter_2/251-norms.svg)
![Eigenvectors](img/chapter_2/251-vec.svg)
![Reconstruction](img/chapter_2/251-rec.svg)

```
1: В .contribution(x, idx, ...) :
  Elementary matrices are not F-orthogonal (max F-cor is 0.00525). Contributions can be irrelevant
2: В .contribution(x, idx, ...) :
  Elementary matrices are not F-orthogonal (max F-cor is -0.0167). Contributions can be irrelevant
```
