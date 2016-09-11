---
layout: layout-bootstrap-tmp
title: "Chapter 4"
categories: examples
permalink: 04-chapter4.html
tags: codeexample
---

# Chapter 4: SSA for multivariate time series

Here you can find code listings in `R` language from the corresponding chapter of the book.

## Contents
{: .no_toc}
1. TOC
{:toc}

### Fragment 4.1.1 (LRRs and roots of characteristic polynomials)

{% include sources_chm/stock_rec.txt %}

#### Produced output
![Reconstruction](img/img_chm/stock_rec.svg)
![Eigenvectors](img/img_chm/stock_evec.svg)

{% include fragments_chm/stock_rec.txt %}

### Fragment 4.2.1 ('FORT' and `DRY': Reconstruction)

{% include sources_chm/wineFortDry_rec.txt %}

#### Produced output

![Reconstruction](img/img_chm/wineFortDry_rec.svg)

### Fragment 4.2.2 ('FORT' and 'DRY': Identification)

{% include sources_chm/wineFortDry_identific.txt %}

#### Produced output

![Eigenvectors](img/img_chm/wineFortDry_1d.svg)
![2D Scatterplot](img/img_chm/wineFortDry_2d.svg)
![Eigenvectors](img/img_chm/wineFortDry_1d_iossa.svg)

{% include fragments_chm/wineFortDry_identific.txt %}

### Fragment 4.3.1 ('FORT' and 'DRY': Forecast)

{% include sources_chm/wineFortDry_forecast.txt %}

#### Produced output

![Forecast](img/img_chm/wineFortDry_forecast.svg)

### Fragment 4.3.2 (Simulation for accuracy estimation)

{% include sources_chm/mssa_comparison.txt %}

#### Produced output

{% include fragments_chm/mssa_comparison.txt %}

### Fragment 4.4.1 ('FORT' and 'ROSE': Influence of series scales)

{% include sources_chm/wineFortRose_scales.txt %}

#### Produced output

![Trends](img/img_chm/wineFortRose_scales.svg)

### Fragment 4.4.2 ('FORT' and 'ROSE': Filling-in  the missing data in 'ROSE')

{% include sources_chm/wineFortRose_forecast.txt %}

#### Produced output

![Forecast](img/img_chm/wineFortRose_forecast.svg)

### Fragment 4.4.3 ('Total' and 'Mainsales': Forecast to fill-in 'Total')

{% include sources_chm/winetotal_forecast.txt %}

#### Produced output

![Forecast](img/img_chm/winetotal_forecast.svg)

### Fragment 4.4.4 ('Australian wines': Simultaneous decomposition by MSSA)

{% include sources_chm/wine_full.txt %}

#### Produced output

![Trends](img/img_chm/wine_trends.svg)
![Trends](img/img_chm/wine_seasonality.svg)
