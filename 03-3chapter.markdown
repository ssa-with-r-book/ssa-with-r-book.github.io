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
*Exponential signal: One signal and four extraneous roots.*

{% include fragments_ch1/lrr_roots.txt %}

### Fragment 3.1.2 (Parameter estimation for ‘CO2’)

{% include sources_ch1/co2_freq.txt %}

#### Produced output
![Roots](img/img_ch1/co2_roots.svg)
*'CO2': Six signal roots.*

{% include fragments_ch1/co2_freq.txt %}

### Fragment 3.2.1 (Forecasting of ‘CO2’)

{% include sources_ch1/co2_for.txt %}

#### Produced output
![Forecast](img/img_ch1/co2_for1.svg)
*'CO2': A set of recurrent forecasts.*

![Forecast](img/img_ch1/co2_for1a.svg)
*'CO2': Forecast of trend.*

![Forecast](img/img_ch1/co2_for2.svg)
*'CO2': Backward forecast of the signal.*

| ![Forecast](img/img_ch1/co2_for3.svg){: .co2} | ![Forecast](img/img_ch1/co2_for4.svg){: .co2} |

<center><em>‘CO2’: Plots of confidence and prediction intervals for the forecast.</em></center>


### Fragment 3.3.1 (Subspace-based gap filling)

{% include sources_ch1/gapfill.txt %}

#### Produced output
![Forecast](img/img_ch1/gapfill.svg)
*'CO2': Subspace-based gap filling, from the left,
        from the right, and their combination.*

### Fragment 3.3.2 (Iterative gap filling, one gap)

{% include sources_ch1/igapfill1.txt %}

#### Produced output
![Gap filling](img/img_ch1/igapfill.svg)
*'CO2': Iterative gap filling of trend.*

![Gap filling](img/img_ch1/igapfill2.svg)
*'CO2': Iterative gap filling of trend: convergence.*

### Fragment 3.3.3 (Iterative gap filling, several gaps)

{% include sources_ch1/igapfill2.txt %}

#### Produced output

{% include fragments_ch1/igapfill2.txt %}

![Gap filling](img/img_ch1/igapfill3.svg)
*'CO2': Iterative and simultaneous subspace-based gap filling of trend: randomly located gaps.*

### Fragment 3.4.1 (Weighted Cadzow approximation)

{% include sources_ch1/weightedcadzow.txt %}

#### Produced output

![Comparison](img/img_ch1/cadzowforecast.svg)
*'CO2': Approximation of rank 6 by the weighted Cadzow method and its forecast.*

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
*'Elec': Trend forecasting.*

### Fragment 3.5.2 (‘Elec’: combined forecasting)

{% include sources_ch1/elec_comb_for.txt %}

#### Produced output
![Forecast](img/img_ch1/elec_comb_for.svg)
*'Elec': Combined forecasting.*

### Fragment 3.5.3 (‘Cowtemp’: different methods of forecasting)

{% include sources_ch1/cowtemp.txt %}

#### Produced output

{% include fragments_ch1/cowtemp.txt %}

![Forecast](img/img_ch1/cowtemp.svg)
*'Cowtemp': Basic SSA and Toeplitz SSA forecasting.*

### Fragment 3.5.4 (Function for perturbed forecasting intervals)

{% include sources_ch1/perturbation.txt %}

### Fragment 3.5.5 ('Total': stability of forecasting)

{% include sources_ch1/bootstrap.txt %}

#### Produced output
![wcor](img/img_ch1/bootstrap_wcor.svg)
*'Total': **w**-Correlations.*

![Errors](img/img_ch1/bootstrap_err.svg)
*'Total': Sizes of 90% forecasting intervals in dependence on the number of components.*

![Intervals](img/img_ch1/bootstrap1.svg)
*'Total': Perturbed forecasting intervals, ET1.*

![Intervals](img/img_ch1/bootstrap12.svg)
*'Total': Perturbed forecasting intervals, ET1--12.*

![Intervals](img/img_ch1/bootstrap14.svg)
*'Total': Perturbed forecasting intervals, ET1--14.*

![Comparison](img/img_ch1/bootstrap_comparison.svg)
*'Total': Comparison of forecasts by ET1--12 and ET1--14.*

### Fragment 3.5.6 ('Glonass': gap filling)

{% include sources_ch1/glonass_fill.txt %}

#### Produced output

![Series](img/img_ch1/glo_na.svg)
*'Glonass': Initial series with gaps.*

![Series](img/img_ch1/glo_short_na.svg)
*'Glonass': A subseries with a gap (left) and with the suppressed gap (right).*

![Eigenvectors](img/img_ch1/glo_fill_u.svg)
*'Glonass': Eigenvectors for the series with gaps, L=72.*

![Series](img/img_ch1/glo_fill.svg)
*'Glonass': A subseries with the filled gap.*

![Periodogram](img/img_ch1/glo_pgram_un.svg)
*'Glonass': Periodogram of the series with suppressed gaps.*

![Periodogram](img/img_ch1/glo_pgram_fill.svg)
*'Glonass': Periodogram of the series with filled gaps.*

### Fragment 3.5.7 ('Glonass': periodicity extraction after the gap filling)

{% include sources_ch1/glonass_fill_use.txt %}

#### Produced output

![Series](img/img_ch1/glo_day.svg)
*'Glonass': A subseries with the 12-hours periodicity; it is extracted from the series with filled gaps and L=52416.*

{% include fragments_ch1/glonass_fill_use.txt %}

### Fragment 3.5.8 ('FORT': Cadzow iterations)

{% include sources_ch1/wine_cadzow.txt %}

#### Produced output

![Approximation](img/img_ch1/fort_cadzow.svg)
*'FORT': Approximation by a series of finite rank.*

### Fragment 3.5.9 ('FORT': Estimation of parameters by Basic SSA)

{% include sources_ch1/wine_parameters1.txt %}

#### Produced output

{% include fragments_ch1/wine_parameters1.txt %}

### Fragment 3.5.10 ('FORT': Estimation of parameters by Cadzow iterations)

{% include sources_ch1/wine_parameters_inf.txt %}

#### Produced output

{% include fragments_ch1/wine_parameters_inf.txt %}

### Fragment 3.5.11 ('FORT': Estimation of parametric real-valued form)

{% include sources_ch1/wine_parameters_real.txt %}

#### Produced output

{% include fragments_ch1/wine_parameters_real.txt %}

### Fragment 3.5.12 ('Sunspots': Subspace tracking)

{% include sources_ch1/sunspot_tracking.txt %}

#### Produced output

![Trend](img/img_ch1/sunspots.svg)
![Tracking](img/img_ch1/sunspots_per_track.svg)
*'Sunspots': Trend extraction (top), subspace tracking of residuals
    with B=22 (middle) and B=44 (bottom).*

| ![Hmat](img/img_ch1/sunspots_change22.svg) | ![Hmat](img/img_ch1/sunspots_change44.svg) |

<center><em>'Sunspots': Heterogeneity matrices
    B=22 (left) and B=44 (right).</em></center>

### Fragment 3.5.13 (Functions for the search of optimal parameters)
{% include sources_ch1/optpar_functions.txt %}

### Fragment 3.5.14 ('Bookings': Search for optimal parameters)
{% include sources_ch1/optpar_search.txt %}

![RMSE](img/img_ch1/optpar_map.svg)
*'Bookings': Dependence of RMSE on L for different numbers of components.*

### Fragment 3.5.15 ('Bookings': Forecast with optimal parameters)
{% include sources_ch1/optpar_forecast.txt %}

![Forecst](img/img_ch1/optpar_for.svg)
*'Bookings': Forecast with optimal parameters.*

![Forecst](img/img_ch1/optpar_for_last.svg)
*'Bookings': Forecast with optimal parameters for last points.*


### Fragments 3.5.16 ('Sweetwhite':  training and test periods) and 3.5.17 ('Sweetwhite':  Search for SSA parameters)
{% include sources_ch1/compar_training_test.txt %}

{% include sources_ch1/compar_ssa_optpar.txt %}

### Fragment 3.5.18 ('Sweetwhite':  Comparison of SSA, ARIMA and ETS)
{% include sources_ch1/compar_forecast.txt %}

{% include fragments_ch1/compar_forecast.txt %}

![ETS](img/img_ch1/ets_for.svg)
*'Sweetwhite': ETS forecast with optimal parameters.*

![ETS](img/img_ch1/arima_for.svg)
*'Sweetwhite': ARIMA forecast with optimal parameters.*

![ETS](img/img_ch1/ssa_for.svg)
*'Sweetwhite': SSA forecast with optimal parameters.*