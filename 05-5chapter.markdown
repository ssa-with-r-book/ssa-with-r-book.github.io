---
layout: layout-bootstrap-tmp
title: "Chapter 5"
categories: examples
permalink: 05-chapter5.html
tags: codeexample
---

# Chapter 5: Image processing

{% include header.txt %}

### Fragments 5.1.1 ('Mars': Input), 5.1.2 ('Mars': Decomposition with `svd.method = "svd"`), 5.1.3 ('Mars': Decomposition with `svd.method = "eigen"`)

{% include sources_ch2d/Mars_input.txt %}
{% include sources_ch2d/Mars_25_dec_svd.txt %}
{% include sources_ch2d/Mars_25_dec_eigen.txt %}

#### Produced output

{% include fragments_ch2d/Mars_25_dec_eigen.txt %}

### Fragments 5.1.4 ('Mars': Decomposition) and 5.1.5 ('Mars': Reconstruction)

{% include sources_ch2d/Mars_25_dec.txt %}
{% include sources_ch2d/Mars_25_rec.txt %}

#### Produced output

![Reconstruction](img/img_ch2d/Mars_25_rec.svg)
*'Mars': Separated periodic noise, (L<sub>x</sub>, L<sub>y</sub>)=(25, 25).*

{% include fragments_ch2d/Mars_25_dec.txt %}

### Fragment 5.1.6 ('Mars': Decomposition)

{% include sources_ch2d/Mars_25_ident.txt %}

#### Produced output

![Eigenarrays](img/img_ch2d/Mars_25_ident_psi.svg)
*'Mars': Eigenarrays, (L<sub>x</sub>, L<sub>y</sub>)=(25, 25).*

![Wcor](img/img_ch2d/Mars_25_ident_wcor.svg)
*'Mars': **w**-Correlations (L<sub>x</sub>, L<sub>y</sub>)=(25, 25).*

### Fragment 5.1.7 ('Mars': Reconstruction)

{% include sources_ch2d/Mars_160_80_rec.txt %}

#### Produced output

![Reconstruction](img/img_ch2d/Mars_160_80_rec.svg)
*'Mars': Reconstruction (L<sub>x</sub>, L<sub>y</sub>)=(160, 80).*

{% include fragments_ch2d/Mars_160_80_rec.txt %}

### Fragments 5.2.1 (Auxiliary plot of 2D image) and 5.2.2 ('Mars': Mask specification and decomposition)

{% include sources_ch2d/2dssa_plots.txt %}
{% include sources_ch2d/Mars_shaped_dec.txt %}

#### Produced output

| ![Mask](img/img_ch2d/Mars_shaped_mask_0.svg) | ![Mask](img/img_ch2d/Mars_shaped_mask_1.svg) | ![Mask](img/img_ch2d/Mars_shaped_mask_res.svg) |

<center><em>'Mars' masks specification. Left: specified by <code>NA</code>, center:
            the parameter <code>mask</code>, right: resulting mask.
            White and black colors correspond to <code>TRUE</code> and <code>FALSE</code> respectively.</em></center>

{% include fragments_ch2d/Mars_shaped_dec.txt %}

### Fragment 5.2.3 ('Mars': Reconstruction)

{% include sources_ch2d/Mars_shaped_rec.txt %}

#### Produced output

![Reconstruction](img/img_ch2d/Mars_shaped_rec.svg)
*'Mars': Reconstruction, ShSSA.*

### Fragments 5.2.4 ('Mars': Identification) and 5.2.5 ('Mars': Improvement by DerivSSA)

{% include sources_ch2d/Mars_shaped_ident.txt %}

{% include sources_ch2d/Mars_shaped_fossa.txt %}

#### Produced output

![Eigenarrays](img/img_ch2d/Mars_shaped_ident_psi.svg)
*'Mars': Eigenarrays, ShSSA.*

![Eigenarrays](img/img_ch2d/Mars_shaped_fossa_ident_psi.svg)
*'Mars': Eigenarrays, ShSSA; improvement by DerivSSA.*

| ![Wcor](img/img_ch2d/Mars_shaped_ident_wcor.svg) | ![Contributions](img/img_ch2d/Mars_shaped_fossa_ident_wcor.svg) |

<center><em>'Mars': <b>w</b>-Correlations, ShSSA: initial (left) and after DerivSSA.</em></center>

| ![Wcor](img/img_ch2d/Mars_shaped_eval.svg) | ![Contributions](img/img_ch2d/Mars_shaped_fossa_eval.svg) |

<center><em>'Mars': Contribution of elementary components, ShSSA: initial (left) and after DerivSSA.</em></center>

### Fragment 5.3.1 ('Mars': Parameter estimation with 2D-ESPRIT)

{% include sources_ch2d/Mars_160_80_esprit.txt %}

#### Produced output

![Roots](img/img_ch2d/Mars_160_80_esprit.svg)
*'Mars': Parameter estimation with 2D-ESPRIT, (L<sub>x</sub>, L<sub>y</sub>)=(160, 80).*

![Eigenarrays](img/img_ch2d/Mars_160_80_psi.svg)
*'Mars': Eigenarrays corresponding to the periodic noise, (L<sub>x</sub>, L<sub>y</sub>)=(160, 80).*

{% include fragments_ch2d/Mars_160_80_esprit.txt %}

### Fragment 5.3.2 ('Mars': Parameter estimation with Shaped 2D-ESPRIT)

{% include sources_ch2d/Mars_shaped_esprit.txt %}

#### Produced output

{% include fragments_ch2d/Mars_shaped_esprit.txt %}

### Fragment 5.4.1 (Mars: magnified reconstructions by 2D-SSA and ShSSA)

{% include sources_ch2d/Mars_rect_vs_shaped.txt %}

#### Produced output

![Comparison](img/img_ch2d/Mars_rect_vs_shaped.svg)
*'Mars': comparison of texture reconstructions by 2D-SSA and ShSSA.*

### Fragment 5.4.2 ('Brecon Beacons': Decomposition)

{% include sources_ch2d/2dssa_brecon_dec.txt %}

#### Produced output

![Eigenarrays](img/img_ch2d/2dssa_brecon_ident_psi.svg)
*'Brecon Beacons': 8 x 8 windows, eigenarrays.*

### Fragment 5.4.3 ('Brecon Beacons': Reconstruction)

{% include sources_ch2d/2dssa_brecon_rec.txt %}

#### Produced output

![Reconstruction](img/img_ch2d/2dssa_brecon_rec.svg)
*'Brecon Beacons': 8 x 8 window, reconstructions (𝕏&#771;<sub>k</sub>).*

![Reconstruction](img/img_ch2d/2dssa_brecon_rec_cumsum.svg)
*'Brecon Beacons': 8 x 8 window, cumulative reconstructions (𝕐&#771;<sub>k</sub>).*

### Fragments 5.4.4 (2D-SSA: centered DFT) and 5.4.5 (2D-SSA: DFT of cumulative reconstructions)

{% include sources_ch2d/2dssa_DFT.txt %}
{% include sources_ch2d/2dssa_brecon_rec_dft.txt %}

#### Produced output

| ![Reconstruction](img/img_ch2d/brecon_rec_cumrest1_dft.svg) | ![Reconstruction](img/img_ch2d/brecon_rec_cumrest2_dft.svg) | ![Reconstruction](img/img_ch2d/brecon_rec_cumrest3_dft.svg) |

<center><em>'Brecon Beacons': 8 x 8 window, absolute values of the DFT
                 of 𝕏 - 𝕐&#771;<sub>k</sub>, k=1,2,3.</em></center>

### Fragments 5.4.6 ('Kruppel': Analysis of data given on a cylinder)

{% include sources_ch2d/2dssa_circular_ex.txt %}

#### Produced output

![Factor vectors](img/img_ch2d/circular_factor.svg)
*'Kruppel': Factor vectors.*

![Reconstruction](img/img_ch2d/Circular_reconstructed.svg)
*'Kruppel': Original image, reconstruction and residual.*

### Fragments 5.4.7 ('Monet': decomposition by multivariate 2D-SSA)

{% include sources_ch2d/image_color.txt %}

#### Produced output

| ![Original](img/img_ch2d/image_color.svg) | ![Smooth](img/img_ch2d/image_rec_color.svg) |

<center><em>'Monet': Initial (left) and smoothed (right) images.</em></center>

![Eigenarrays](img/img_ch2d/image_eigen.svg)
*'Monet': Eigenarrays.*

![Channels](img/img_ch2d/image_res.svg)
*'Monet': Three channels of the reconstructed and residual images.*
