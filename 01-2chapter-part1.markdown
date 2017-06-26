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
*'FORT': Decomposition.*


### Fragment 2.1.3 (‘FORT’: Identification)

{% include sources_ch1/fort_identific.txt %}

#### Produced output

{% include fragments_ch1/fort_identific.txt %}

![Eigenvectors](img/img_ch1/fort_1d.svg)
*'FORT': 1D graphs of eigenvectors.*

![Pairs of Eigenvectors](img/img_ch1/fort_2d.svg)
*'FORT': 2D scatterplots of eigenvectors.*

![W-correlation Matrix](img/img_ch1/fort_wcor.svg)
*'FORT': Weighted correlations.*

![Reconstruction](img/img_ch1/fort_recsine.svg)
*'FORT': Reconstructed sine waves.*

### Fragment 2.2.1 (Noisy sinusoid: Toeplitz SSA)

{% include sources_ch1/sin_toeplitz.txt %}

#### Produced output
![Eigenvectors](img/img_ch1/sin_toeplitz_1d.svg)
*Noisy sinusoid: 1D graphs of eigenvectors (top: Toeplitz SSA, bottom: Basic SSA).*

![Reconstruction](img/img_ch1/sin_toeplitz_rec.svg)
*Noisy sinusoid: Reconstruction (top: Toeplitz SSA, bottom: Basic SSA).*

### Fragment 2.2.2 (Simulation: comparison of Toeplitz and Basic SSA)

Warning: this example takes a lot of computational time.
{:.alert .alert-warning}

{% include sources_ch1/sin_toeplitz_sim.txt %}

#### Produced output
![Eigenvectors](img/img_ch1/sin_toeplitz_sim.svg)
*Simulation: Reconstruction accuracy
        of Toeplitz (dash red line) and Basic SSA (solid black line).*

### Fragment 2.3.1 (‘CO2’: SSA with projection)

{% include sources_ch1/pssa.txt %}

#### Produced output
![Reconstruction](img/img_ch1/pssa_rec2.svg)
*'CO2': Reconstruction of linear trend.*

![Reconstruction](img/img_ch1/pssa_rec4.svg)
*'CO2': Reconstruction of the cubic trend.*

![Eigenvectors](img/img_ch1/pssa_evec4.svg)
*'CO2': 1D graphs of eigenvectors.*

![Reconstruction](img/img_ch1/pssa_rec4signal.svg)
*'CO2': Reconstruction of signal.*

### Fragment 2.3.2 (Polynomial trend: SSA with projection)

{% include sources_ch1/pssa_sim.txt %}

#### Produced output
![Comparison](img/img_ch1/pssa_sim_rec.svg)
*Polynomial trend: Comparison of trend reconstructions.*

### Fragment 2.4.1 (Noisy sum of three sinusoids: Iterative O-SSA)

{% include sources_ch1/3sin_iossa.txt %}

#### Produced output
![Plot](img/img_ch1/3sin_series.svg)
*Noisy sum of three sinusoids: The original series.*

![Eigenvectors](img/img_ch1/3sin_ssa_wcor.svg)
*Noisy sum of three sinusoids, Basic SSA: **w**-Correlation matrix.*

![W-correlation Matrix](img/img_ch1/3sin_ssa_1d.svg)
*Noisy sum of three sinusoids, Basic SSA: Eigenvectors.*

![Eigenvectors](img/img_ch1/3sin_iossa_1d.svg)
*Noisy sum of three sinusoids, Iterative O-SSA: Eigenvectors.*

![Reconstruction](img/img_ch1/3sin_iossa_rec.svg)
*Noisy sum of three sinusoids, Iterative O-SSA: Reconstruction.*

### Fragment 2.4.2 (Noisy sum of three sinusoids: Iterative O-SSA, summary)

{% include sources_ch1/3sin_iossa_sum.txt %}

#### Produced output

{% include fragments_ch1/3sin_iossa_sum.txt %}

### Fragment 2.4.3 (Dependence of iossa error on difference between frequencies)

Warning: this example takes a lot of computational time.
{:.alert .alert-warning}

{% include sources_ch1/iter_err_iossa_plot.txt %}

#### Produced output
![Comparison](img/img_ch1/iossa_sim.svg)
*Dependence of number of iterations (top) and RMSE errors of
    frequency estimations (bottom) on 𝝎<sub>1</sub> for 𝝎<sub>2</sub>=0.6.*

### Fragment 2.5.1 (Separation of two sine waves with equal amplitudes)

{% include sources_ch1/fossa_iossa.txt %}

#### Produced output
![Norms](img/img_ch1/fossa_iossa_eval.svg)
*Noisy sum of sinusoids: Graph of eigenvalues for Basic SSA.*

![Eigenvectors](img/img_ch1/fossa_iossa_evec.svg)
*Noisy sum of sinusoids: 1D graphs of eigenvectors for Basic SSA (top),
        DerivSSA (middle) and Iterative O-SSA, 1 iteration (second from bottom) and 2 iterations (bottom).*

![Reconstruction](img/img_ch1/fossa_iossa_rec.svg)
*Noisy sum of sinusoids: Reconstructions for DerivSSA (top) and
        Iterative O-SSA, 2 iterations (bottom).*

{% include fragments_ch1/fossa_iossa.txt %}

```
In .contribution(x, idx, ...):
  Elementary matrices are not F-orthogonal (max F-cor is -0.016).
  Contributions can be irrelevant
```

### Fragment 2.6.1 (Decomposition for series with a gap)

{% include sources_ch1/shssa_typical.txt %}

#### Produced output
![Complete vectors proportion](img/img_ch1/shssa_cl.svg)
*'CO2' with gaps, Shaped SSA: Dependence of proportion of complete vectors on window length.*

![Reconstruction](img/img_ch1/shssa_evec.svg)
*'CO2' with gaps, Shaped SSA: Eigenvectors, L=72.*

![W-correlations](img/img_ch1/shssa_elseries.svg)
*'CO2' with gaps, Shaped SSA: Elementary reconstructed series, L=72.*

![Reconstruction](img/img_ch1/shssa_wcor.svg)
*'CO2' with gaps, Shaped SSA: **w**-Correlation matrix, L=72.*

### Fragment 2.6.2 (Incomplete decomposition for a series with a gap)

{% include sources_ch1/shssa_typical2.txt %}

#### Produced output
![Reconstruction](img/img_ch1/shssa_rec_trend.svg)
*'CO2' with gaps, Shaped SSA: Trend reconstruction, L=72.*

![Reconstruction](img/img_ch1/shssa_rec_trend2.svg)
*'CO2' with gaps, Shaped SSA: Incomplete trend reconstruction, L=120.*

### Fragment 2.7.1 (‘White dwarf’: Auto grouping by clustering)

{% include sources_ch1/auto_typical1.txt %}

#### Produced output
![W-correlations](img/img_ch1/auto_wcor.svg)
*'White dwarf': **w**-Correlation matrix, L=100.*

![Reconstruction](img/img_ch1/auto_signal.svg)
*'White dwarf': Decomposition with automatic
        grouping performed by clustering.*

{% include fragments_ch1/auto_typical1.txt %}


### Fragment 2.7.2 (‘Production’: Auto grouping by frequency analysis)

{% include sources_ch1/auto_typical2.txt %}

#### Produced output
![Relative Contributions](img/img_ch1/auto_threshold.svg)
*'Production': Ordered frequency contributions of factor vectors, L=120.*

![Eigenvectors](img/img_ch1/auto_factor.svg)
*'Production': Factor vectors, L=120.*

![Reconstruction](img/img_ch1/auto_trend0.svg)
*'Production': Two extracted trends of different resolution,
        automatic grouping by frequencies.*

{% include fragments_ch1/auto_typical2.txt %}
