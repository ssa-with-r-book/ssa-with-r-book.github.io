---
layout: layout-bootstrap-tmp
title: "About book"
categories: examples
permalink: index.html
tags: mainpage
---
<div class="jumbotron">
  <div class="container">
<h2>Singular Spectrum Analysis with R</h2>

<p>by Nina Golyandina, Anton Korobeynikov, Anatoly Zhigljavsky <br/>

<a href="http://springer.com">Springer</a>, 2017
</p>
<p><a href="https://amazon.com" class="btn btn-primary btn-lg" role="button"><span class="glyphicon glyphicon-book"></span> Watch it at Amazon</a></p>
</div>
</div>

# Package features

1.	Loading data from files given in the following formats
(x,y, gene expression).
2.	Decomposition of data
	-	Transformation of data to the scale 0-100% by AP and DV coordinates
	-	Choice of rectangular area for analysis
	-	Regularization of data (interpolation to regular grid), the step of the grid can be set.
	-	Decomposition of regularized data by the 2D-SSA method
	-	Interpolation of data to initial coordinates.
3.	Checking the decomposition quality
	- Profiles of patterns along AP or DV axis
	- Profiles of noise along AP or DV axis
4.	Analysis of residuals, model of residuals
	-	Graphs of dependence of noise on patters, 
	-	Estimation of noise model: additive, multiplicative or Poissonian model.
5.	Pictures with the results of decomposition in 2D or 3D forms.

# Installation

The package is implemented as an [R-package](http://www.r-project.org/ ).

Latest binary build for Windows could be found [here]( http://BioSSA.github.io/BioSSA_0.1.zip "BioSSA Windows binary build").

It essentially uses the [Rssa]( http://cran.r-project.org/web/packages/Rssa/ "Rssa link") package.
You can also watch [Rssa GitHub repository]( https://github.com/asl/rssa/ "Rssa GitHub link").

Also it uses multidimensional spatial interpolation procedures from our `LinearInterpolator` package, which requires the
[CGAL]( http://www.cgal.org/ "CGAL official cite") library to be installed. For Windows `CGAL` compilation is rather complicated, so
it's better to use [precompiled binary] (http://BioSSA.github.io/LinearInterpolator_0.1.zip).

You can install both `LinearInterpolator` and `BioSSA` packages from GitHub directly (using Hadley's package [`devtools`]( http://cran.r-project.org/web/packages/devtools/index.html "devtools package CRAN page" ))
by the following code:
{% highlight r %}
install.packages("devtools")
library(devtools)
install_github("BioSSA/LinearInterpolator")
install_github("BioSSA/BioSSA")
{% endhighlight %}
Be careful, `devtools` package has some additional dependences.

# Method

Decomposition of the image into a sum of pattern and noise is fulfilled
by Shaped 2D/3D Singular Spectrum Analysis.

# Support

This work is supported by the NG13-083 grant of Dynasty Foundation.
