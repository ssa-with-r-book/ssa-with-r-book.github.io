---
layout: layout-bootstrap-tmp
title: "'Rssa'"
categories: examples
permalink: rssa-package.html
tags: mainmenu
---

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
