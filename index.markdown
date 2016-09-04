---
layout: layout-bootstrap-tmp
title: "About book"
categories: examples
permalink: index.html
tags: mainpage
---
<div class="jumbotron">
	<div class="row">
		<div class="container col-md-8">
			<h2>Singular Spectrum Analysis with R</h2>

			<p><em>by Nina Golyandina, Anton Korobeynikov, Anatoly Zhigljavsky </em><br/>

			<a href="http://springer.com">Springer</a>, 2017
			</p>
			<p class = "description"> Singular Spectrum Analysis (SSA)
			is a well-known  methodology of analysis and forecasting of time series
			 and, since quite recently, of digital images and other objects  which are not necessarily
			of planar or rectangular shape  and may contain gaps. </p>

			<p class = "description"> This book has the following goals:
				<ul>
					<li> to present the up-to-date SSA methodology, including multidimensional extensions,
			in the form accessible to a very wide circle of users,</li>
					<li> to interconnect a variety of versions of SSA into a single  tool,</li>
					<li> to show the diverse tasks  that SSA can be used for,</li>
					<li> to formally describe  the main SSA methods and algorithms, and</li>
					<li>to make a tutorial on the "Rssa" package.</li>
				</ul>
			 </p>			
		</div>
		<div class="container col-md-4">
			<img src="img/abstract_cover_placeholder.png" class = "img-responsive" width = "260pt">
		</div>
	</div>
	<div class="row">
		<div class = "container extraspacing">
			<a href="https://amazon.com" class="btn btn-primary btn-lg" role="button"><span class="glyphicon glyphicon-book"></span> Watch it at Amazon</a>
		</div>
	</div>
</div>


# Contents of the book

1.	Introduction: Overview
	-	General Scheme of the SSA family and the main concepts
	-	Different versions of SSA
	-	Separability in SSA
	-	Forecasting, interpolation, low-rank approximation and parameter estimation in SSA
	-	The package
	-	Literature notes

2.	SSA analysis of one-dimensional time series
	-	Basic SSA
	-	Toeplitz SSA
	-	SSA with projection
	-	Iterative Oblique SSA
	-	Filter-adjusted O-SSA and SSA with derivatives
	-	Shaped 1D-SSA
	-	Automatic grouping in SSA
	-	Case studies
3.	Parameter estimation, forecasting, gap filling
	-	Parameter estimation
	-	Forecasting
	-	Gap filling
	-	Structured low-rank approximation
	-	Case studies
4.	SSA for multivariate time series
	-	Complex SSA 
	-	MSSA Analysis
	-	MSSA forecasting
	-	Case studies
5.	Image processing
	-	2D-SSA
	-	Shaped 2D-SSA
	-	2D ESPRIT
	-	Case studies

# "Rssa" package

[R-package](http://www.r-project.org/) `Rssa` provides effective, comfortable and accessible implementation for SSA.
`Rssa` is well documented and contains many standard and non-standard tools for time series analysis and forecasting and image processing; it also has many visual tools which are useful for making proper choice of SSA parameters and examination of results. `Rssa` is the only SSA implementation available from CRAN and is almost certainly the most efficient implementation of SSA.

You need to run the following code to install the package from [CRAN](http://cran.r-project.org/web/packages/Rssa/).
{% highlight r %}
install.packages("Rssa")
{% endhighlight %}

Note for Linux/MacOS users: "Rssa" package needs compilation. It means that you must have suitable build enviroment. The package also depends on [fftw](http://www.fftw.org/){:class="alert-link"} library, which can be installed by running "apt-get install libfftw3-bin libfftw3-dev" (Ubuntu Linux) or "brew install fftw" (MacOS, homebrew).
{:.alert .alert-warning}


You can also find latest version at [Rssa GitHub repository]( https://github.com/asl/rssa/ "Rssa GitHub link"), and [build it manually](https://cran.r-project.org/doc/contrib/Leisch-CreatingPackages.pdf) or using Hadley's package [`devtools`]( http://cran.r-project.org/web/packages/devtools/index.html "devtools package CRAN page"):
{% highlight r %}
install.packages("devtools")
library(devtools)
install_github("asl/rssa")
{% endhighlight %}
Be careful, `devtools` package has some additional dependences.

<!-- # Support

This work is supported by the NG13-083 grant of Dynasty Foundation.
 -->
