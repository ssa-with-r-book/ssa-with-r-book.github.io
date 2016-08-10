---
layout: layout-bootstrap-tmp
title: "Chapter 2: SSA analysis of one-dimensional time series"
categories: examples
permalink: 01-chapter2.html
tags: codeexample
---

# Chapter 2: SSA analysis of one-dimensional time series

Here you can find code listings in `R` language from the corresponding chapter of the book.

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
