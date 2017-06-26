---
layout: layout-bootstrap-tmp
title: "Chapter 2, Section 2.8"
categories: examples
permalink: 02-chapter2-part2.html
tags: codeexample
---

# Chapter 2: SSA analysis of one-dimensional time series, Section 2.8

{% include header.txt %}

### Fragment 2.8.1 (‘Tree rings’: frequency decomposition)

{% include sources_ch1/tree_frequency.txt %}

#### Produced output
![Reconstruction](img/img_ch1/tree_frequency.svg)
*'Tree rings': Frequency decomposition.*

![Periodogram](img/img_ch1/tree_spectrum.svg)
*'Tree rings': Periodograms of the series components.*

### Fragment 2.8.2 (‘FORT’: Basic SSA and Iterative O-SSA trends)

{% include sources_ch1/fort_iossa.txt %}

#### Produced output
![Reconstruction](img/img_ch1/fort_iossa.svg)
*'FORT': Trend reconstruction by Iterative O-SSA for the subseries consisting of points 30-72.*

### Fragment 2.8.3 (‘MotorVehicle’: Decomposition by Sequential SSA)

{% include sources_ch1/sequential_trend.txt %}

#### Produced output
![Reconstruction](img/img_ch1/motor_trend12.svg)
*'MotorVehicle': Trend extracted by Basic SSA with small window length L=12.*

### Fragments 2.8.4 (‘MotorVehicle’: Decomposition by DerivSSA) and 2.8.5 (‘MotorVehicle’: finding noise envelope)

{% include sources_ch1/derivssa_trend.txt %}
{% include sources_ch1/envelope.txt %}

#### Produced output
![Reconstruction](img/img_ch1/motor_decomposition.svg)
*'MotorVehicle': Decomposition by DerivSSA with L=264.*

{% include fragments_ch1/derivssa_trend.txt %}

![Envelope](img/img_ch1/motor_envelope.svg)
*'MotorVehicle': Residuals with envelopes.*

### Fragment 2.8.6 (‘US unemployment’: Improvement by DerivSSA)

{% include sources_ch1/unempl_fossa.txt %}

#### Produced output
![Reconstruction](img/img_ch1/unempl_fossa.svg)
*'US unemployment': Decompositions by Basic SSA and DerivSSA.*

### Fragment 2.8.7 (‘Hotel’: SSA with projection, linear trend detection)

{% include sources_ch1/hotel_centering.txt %}

#### Produced output
![Comparison](img/img_ch1/hotel_centering.svg)
*'Hotel': SSA with projection, linear trend detection.*

### Fragment 2.8.8 (‘Hotel’: Iterative O-SSA, linear trend detection)

{% include sources_ch1/hotel_iossa.txt %}

#### Produced output
![Comparison](img/img_ch1/hotel_iossa.svg)
*'Hotel': Iterative O-SSA, linear trend detection.*

### Fragment 2.8.9 (‘PayNSA’: Automatically identified trend)
{% include sources_ch1/auto_grouping.txt %}

#### Produced output

{% include fragments_ch1/auto_grouping.txt %}

![Relative contribution](img/img_ch1/auto_trend_plot.svg)
*Contributions of trend components.*

![Reconstruction](img/img_ch1/auto_trend.svg)
*'PayNSA': Automatically identified trend.*

![Contributions](img/img_ch1/auto_seas_plot.svg)
*'PayNSA': Contributions of seasonal components, ordered by their values (left)
        and ordered by component numbers (right) for different frequency ranges.*

![Reconstruction](img/img_ch1/auto_seas.svg)
*'PayNSA': Automatically identified seasonal component.*

![Periodogram](img/img_ch1/auto_seas_spec.svg)
*'PayNSA': Log-periodogram of original and seasonally-adjusted series.*

### Fragment 2.8.10 (‘Elec’: Log-transformation)

{% include sources_ch1/elec_mult.txt %}

#### Produced output
![Comparison](img/img_ch1/elec_mult.svg)
*'Elec': Decomposition for initial and log-transformed data.*
