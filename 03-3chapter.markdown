---
layout: layout-bootstrap-tmp
title: "Chapter 3"
categories: examples
permalink: 03-chapter3.html
tags: codeexample
---

# Chapter 3: Parameter estimation, forecasting, gap filling

{% include header.txt %}

### Fragment 3.1.1 (LRRs and roots of characteristic polynomials)

{% include sources_ch1/lrr_roots.txt %}

#### Produced output
![Roots](img/img_ch1/lrr_roots.svg)

{% include fragments_ch1/lrr_roots.txt %}

### Fragment 3.1.2 (Parameter estimation for ‘CO2’)

{% include sources_ch1/co2_freq.txt %}

#### Produced output
![Roots](img/img_ch1/co2_roots.svg)

{% include fragments_ch1/co2_freq.txt %}

### Fragment 3.2.1 (Forecasting of ‘CO2’)

{% include sources_ch1/co2_for.txt %}

#### Produced output
![Forecast](img/img_ch1/co2_for1.svg)
![Forecast](img/img_ch1/co2_for1a.svg)
![Forecast](img/img_ch1/co2_for2.svg)
![Forecast](img/img_ch1/co2_for4.svg)

### Fragment 3.3.1 (Subspace-based gap filling)

{% include sources_ch1/gapfill.txt %}

#### Produced output
![Forecast](img/img_ch1/gapfill.svg)

### Fragment 3.3.2 (Iterative gap filling, one gap)

{% include sources_ch1/igapfill1.txt %}

#### Produced output
![Gap filling](img/img_ch1/igapfill.svg)
![Gap filling](img/img_ch1/igapfill2.svg)

### Fragment 3.3.3 (Iterative gap filling, several gaps)

{% include sources_ch1/igapfill2.txt %}

#### Produced output

{% include fragments_ch1/igapfill2.txt %}

![Gap filling](img/img_ch1/igapfill3.svg)

### Fragment 3.4.1 (Weighted Cadzow approximation)

{% include sources_ch1/weightedcadzow.txt %}

#### Produced output

![Comparison](img/img_ch1/cadzowforecast.svg)

{% include fragments_ch1/weightedcadzow.txt %}

### Fragment 3.4.2 (Accuracy of weighted Cadzow approximation)

Warning: this example takes a lot of computational time.
{:.alert .alert-warning}

{% include sources_ch1/sin_cadzow_sim.txt %}

#### Produced output

{% include fragments_ch1/sin_cadzow_sim.txt %}

### Fragment 3.5.1 (‘Elec’: trend forecasting and iossa)

{% include sources_ch1/elec_trend_for.txt %}

#### Produced output
![Forecast](img/img_ch1/elec_trend_for.svg)

### Fragment 3.5.2 (‘Elec’: combined forecasting)

{% include sources_ch1/elec_comb_for.txt %}

#### Produced output
![Forecast](img/img_ch1/elec_comb_for.svg)

### Fragment 3.5.3 (‘Cowtemp’: different methods of forecasting)

{% include sources_ch1/cowtemp.txt %}

#### Produced output

{% include fragments_ch1/cowtemp.txt %}

![Forecast](img/img_ch1/cowtemp.svg)

### Fragment 3.5.4 (Function for perturbed forecasting intervals)

{% include sources_ch1/perturbation.txt %}

### Fragment 3.5.5 (`Total': stability of forecasting)

{% include sources_ch1/bootstrap.txt %}

#### Produced output
![wcor](img/img_ch1/bootstrap_wcor.svg)
![Errors](img/img_ch1/bootstrap_err.svg)
![Intervals](img/img_ch1/bootstrap1.svg)
![Intervals](img/img_ch1/bootstrap12.svg)
![Intervals](img/img_ch1/bootstrap14.svg)
![Comparison](img/img_ch1/bootstrap_comparison.svg)

### Fragment 3.5.6 (`Glonass': gap filling)

{% include sources_ch1/glonass_fill.txt %}

#### Produced output

![Series](img/img_ch1/glo_na.svg)
![Series](img/img_ch1/glo_short_na.svg)
![Eigenvectors](img/img_ch1/glo_fill_u.svg)
![Eigenvectors](img/img_ch1/glo_fill.svg)
![Periodogram](img/img_ch1/glo_pgram_un.svg)
![Periodogram](img/img_ch1/glo_pgram_fill.svg)

### Fragment 3.5.7 (`Glonass': periodicity extraction after the gap filling)

{% include sources_ch1/glonass_fill_use.txt %}

#### Produced output

![Series](img/img_ch1/glo_day.svg)

{% include fragments_ch1/glonass_fill_use.txt %}

### Fragment 3.5.8 (`FORT': Cadzow iterations)

{% include sources_ch1/wine_cadzow.txt %}

#### Produced output

![Approximation](img/img_ch1/fort_cadzow.svg)

### Fragment 3.5.9 (`FORT': Estimation of parameters by Basic SSA)

{% include sources_ch1/wine_parameters1.txt %}

#### Produced output

{% include fragments_ch1/wine_parameters1.txt %}

### Fragment 3.5.10 (`FORT': Estimation of parameters by Cadzow iterations)

{% include sources_ch1/wine_parameters_inf.txt %}

#### Produced output

{% include fragments_ch1/wine_parameters_inf.txt %}

### Fragment 3.5.11 (`FORT': Estimation of parametric real-valued form)

{% include sources_ch1/wine_parameters_real.txt %}

#### Produced output

{% include fragments_ch1/wine_parameters_real.txt %}

### Fragment 3.5.12 (`Sunspots': Subspace tracking)

{% include sources_ch1/sunspot_tracking.txt %}

#### Produced output

![Trend](img/img_ch1/sunspots.svg)
![Tracking](img/img_ch1/sunspots_per_track.svg)

| ![Hmat](img/img_ch1/sunspots_change22.svg) | ![Hmat](img/img_ch1/sunspots_change44.svg) |
