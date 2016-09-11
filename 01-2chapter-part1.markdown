---
layout: layout-bootstrap-tmp
title: "Chapter 2, Sections 2.1 &mdash; 2.7"
categories: examples
permalink: 01-chapter2-part1.html
tags: codeexample
---

# Chapter 2: SSA analysis of one-dimensional time series, Sections 2.1 &mdash; 2.7

{% include header.txt %}

### Fragments 2.1.1 (‘Australian Wines’: Input) and 2.1.2 (‘FORT’: Reconstruction)

{% include sources_ch1/wines_input.txt %}
{% include sources_ch1/fort_rec.txt %}

#### Produced output
![Reconstruction](img/img_ch1/fort_rec.svg)

### Fragment 2.1.3 (‘FORT’: Identification)

{% include sources_ch1/fort_identific.txt %}

#### Produced output

{% include fragments_ch1/fort_identific.txt %}

![Eigenvectors](img/img_ch1/fort_1d.svg)
![Pairs of Eigenvectors](img/img_ch1/fort_2d.svg)
![W-correlation Matrix](img/img_ch1/fort_wcor.svg)
![Reconstruction](img/img_ch1/fort_recsine.svg)

### Fragment 2.2.1 (Noisy sinusoid: Toeplitz SSA)

{% include sources_ch1/sin_toeplitz.txt %}

#### Produced output
![Eigenvectors](img/img_ch1/sin_toeplitz_1d.svg)
![Reconstruction](img/img_ch1/sin_toeplitz_rec.svg)

### Fragment 2.2.2 (Simulation: comparison of Toeplitz and Basic SSA)

Warning: this example takes a lot of computational time.
{:.alert .alert-warning}

{% include sources_ch1/sin_toeplitz_sim.txt %}

#### Produced output
![Eigenvectors](img/img_ch1/sin_toeplitz_sim.svg)

### Fragment 2.3.1 (‘CO2’: SSA with projection)

{% include sources_ch1/pssa.txt %}

#### Produced output
![Reconstruction](img/img_ch1/pssa_rec2.svg)
![Reconstruction](img/img_ch1/pssa_rec4.svg)
![Eigenvectors](img/img_ch1/pssa_evec4.svg)
![Reconstruction](img/img_ch1/pssa_rec4signal.svg)

### Fragment 2.3.2 (Polynomial trend: SSA with projection)

{% include sources_ch1/pssa_sim.txt %}

#### Produced output
![Comparison](img/img_ch1/pssa_rec4signal.svg)

### Fragment 2.4.1 (Noisy sum of three sinusoids: Iterative O-SSA)

{% include sources_ch1/3sin_iossa.txt %}

#### Produced output
![Plot](img/img_ch1/3sin_series.svg)
![Eigenvectors](img/img_ch1/3sin_ssa_wcor.svg)
![W-correlation Matrix](img/img_ch1/3sin_ssa_1d.svg)
![Eigenvectors](img/img_ch1/3sin_iossa_1d.svg)
![Reconstruction](img/img_ch1/3sin_iossa_rec.svg)

### Fragment 2.4.2 (Noisy sum of three sinusoids: Iterative O-SSA, summary)

{% include sources_ch1/3sin_iossa_sum.txt %}

#### Produced output

{% include fragments_ch1/3sin_iossa_sum.txt %}

### Fragments 2.4.3 (Dependence of iossa error on difference between frequencies) and 2.4.4 (Plotting of dependence of iossa error on difference between frequencies)

Warning: this example takes a lot of computational time.
{:.alert .alert-warning}

{% include sources_ch1/iter_err_iossa_plot.txt %}

#### Produced output
![Comparison](img/img_ch1/iossa_sim.svg)

### Fragment 2.5.1 (Separation of two sine waves with equal amplitudes)

{% include sources_ch1/fossa_iossa.txt %}

#### Produced output
![Norms](img/img_ch1/fossa_iossa_eval.svg)
![Eigenvectors](img/img_ch1/fossa_iossa_evec.svg)
![Reconstruction](img/img_ch1/fossa_iossa_rec.svg)

{% include fragments_ch1/fossa_iossa.txt %}

```
1: В .contribution(x, idx, ...) :
  Elementary matrices are not F-orthogonal (max F-cor is 0.00525). Contributions can be irrelevant
2: В .contribution(x, idx, ...) :
  Elementary matrices are not F-orthogonal (max F-cor is -0.0167). Contributions can be irrelevant
```

### Fragment 2.6.1 (Decomposition for series with a gap)

{% include sources_ch1/shssa_typical.txt %}

#### Produced output
![Complete vectors proportion](img/img_ch1/shssa_cl.svg)
![Reconstruction](img/img_ch1/shssa_evec.svg)
![W-correlations](img/img_ch1/shssa_elseries.svg)
![Reconstruction](img/img_ch1/shssa_wcor.svg)

### Fragment 2.6.2 (Incomplete decomposition for a series with a gap)

{% include sources_ch1/shssa_typical2.txt %}

#### Produced output
![Reconstruction](img/img_ch1/shssa_rec_trend.svg)
![Reconstruction](img/img_ch1/shssa_rec_trend2.svg)

### Fragment 2.7.1 (‘White dwarf’: Auto grouping by clustering)

{% include sources_ch1/auto_typical1.txt %}

#### Produced output
![Reconstruction](img/img_ch1/auto_wcor.svg)
![Reconstruction](img/img_ch1/auto_signal.svg)

{% include fragments_ch1/auto_typical1.txt %}


### Fragment 2.7.2 (‘Production’: Auto grouping by frequency analysis)

{% include sources_ch1/auto_typical2.txt %}

#### Produced output
![Relative Contributions](img/img_ch1/auto_threshold.svg)
![Eigenvectors](img/img_ch1/auto_factor.svg)
![Reconstruction](img/img_ch1/auto_trend0.svg)

{% include fragments_ch1/auto_typical2.txt %}
