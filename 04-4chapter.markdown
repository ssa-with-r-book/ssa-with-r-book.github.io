---
layout: layout-bootstrap-tmp
title: "Chapter 4"
categories: examples
permalink: 04-chapter4.html
tags: codeexample
---

# Chapter 4: SSA for multivariate time series

{% include header.txt %}

### Fragment 4.1.1 ('Stocks': Reconstruction)

{% include sources_chm/stock_rec.txt %}

#### Produced output
![Reconstruction](img/img_chm/stock_rec.svg)
*'Stocks': Reconstructed trends.*
![Eigenvectors](img/img_chm/stock_evec.svg)
*'Stocks': Eigenvectors, real and imaginary parts.*

{% include fragments_chm/stock_rec.txt %}

### Fragment 4.2.1 ('FORT' and `DRY': Reconstruction)

{% include sources_chm/wineFortDry_rec.txt %}

#### Produced output

![Reconstruction](img/img_chm/wineFortDry_rec.svg)
*'FORT' and 'DRY': Reconstructed trend and seasonality.*

### Fragment 4.2.2 ('FORT' and 'DRY': Identification)

{% include sources_chm/wineFortDry_identific.txt %}

#### Produced output

![Eigenvectors](img/img_chm/wineFortDry_1d.svg)
*'FORT' and 'DRY': 1D graphs of eigenvectors.*

![2D Scatterplot](img/img_chm/wineFortDry_2d.svg)
*'FORT' and 'DRY': 2D scatterplots of eigenvectors.*

![Eigenvectors](img/img_chm/wineFortDry_1d_iossa.svg)
*'FORT' and 'DRY': 1D graphs of eigenvectors after Iterative O-SSA.*

{% include fragments_chm/wineFortDry_identific.txt %}

### Fragment 4.3.1 ('FORT' and 'DRY': Forecast)

{% include sources_chm/wineFortDry_forecast.txt %}

#### Produced output

![Forecast](img/img_chm/wineFortDry_forecast.svg)
*'FORT' and 'DRY': Forecast of the signal.*

### Fragment 4.3.2 (Simulation for accuracy estimation)

{% include sources_chm/mssa_comparison.txt %}

#### Produced output

{% include fragments_chm/mssa_comparison.txt %}

### Fragment 4.4.1 ('FORT' and 'ROSE': Influence of series scales)

{% include sources_chm/wineFortRose_scales.txt %}

#### Produced output

![Trends](img/img_chm/wineFortRose_scales.svg)
*'FORT' and 'ROSE': Trends with  normalization (ET1,12,14) and without (ET1).*

### Fragment 4.4.2 ('FORT' and 'ROSE': Filling-in  the missing data in 'ROSE')

{% include sources_chm/wineFortRose_forecast.txt %}

#### Produced output

![Forecast](img/img_chm/wineFortRose_forecast.svg)
*'FORT' and 'ROSE': Filling-in  of `ROSE' by two methods.*

### Fragment 4.4.3 ('Total' and 'Mainsales': Forecast to fill-in 'Total')

{% include sources_chm/winetotal_forecast.txt %}

#### Produced output

![Forecast](img/img_chm/winetotal_forecast.svg)
*'Total' and 'Mainsales': Forecast to fill-in 'Total'.*

### Fragment 4.4.4 ('Australian wines': Simultaneous decomposition by MSSA)

{% include sources_chm/wine_full.txt %}

#### Produced output

![Trends](img/img_chm/wine_trends.svg)
*'Australian wines': Extraction of trends.*

![Trends](img/img_chm/wine_seasonality.svg)
*'Australian wines': Extraction of seasonality.*