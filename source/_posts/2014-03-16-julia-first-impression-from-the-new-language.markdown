---
layout: post
title: "Julia: first impressions from the new language"
date: 2014-03-16 18:33
comments: true
categories: [R, Julia, languages]
---

One big difference what we have today and what we had 20 years in IT is a number of actively developing and supporting technologies and even programming languages. Yes, some of them will be depricated just a couple years after the birth, but still you could actually feel the freedom of new technologies. Of course, the fact that we have some laguages won't make a big difference for real production tasks or enterprice field, but still you have some variants to compare, and I do belive, that if something is much better, than other existing competitors in the end of the day it will win the fight with something much less efficient.

In my daily routine I often use R for some tasks, mainly because it quite powerful in variety of statistical libraries, and not only, also because you could quite easily and fast iterate and get simple visualization of your results. Especially with all these powerfull libraries like ggplot2 and so on.

{% img center http://julia.readthedocs.org/en/latest/_static/julia-logo.svg 'Julia performance comparison' %}

From another point, there is another promising programming language [Julia](http://julialang.org/) or [Julialang](http://julialang.org/). So Julia is a new prgramming language, first appeared in 2012 at MIT. It's a high-level dynamic programming language designed to address the requirements of high-performance and scientific computations. Julia is written in C, C++ and Schema using the LLVM compiler framework.

{% img center /images/julia.png 'Julia performance comparison' %}

<!--more-->

Some features from the official website:

* Multiple dispatch: providing ability to define function behavior across many combinations of argument types
* Dynamic type system: types for documentation, optimization, and dispatch
* Good performance, approaching that of statically-compiled languages like C
* Built-in package manager
* Lisp-like macros and other metaprogramming facilities
* Call Python functions: use the PyCall package
* Call C functions directly: no wrappers or special APIs
* Powerful shell-like capabilities for managing other processes
* Designed for parallelism and distributed computation
* Coroutines: lightweight “green” threading
* User-defined types are as fast and compact as built-ins
* Automatic generation of efficient, specialized code for different argument * types
* Elegant and extensible conversions and promotions for numeric and other * types
* Efficient support for Unicode, including but not limited to UTF-8
* MIT licensed: free and open source

Enough, with features description, some feedback I had during a couple days performing a simple analysis.

The very first issue I’ve been faced with, was that Julia just didn’t work for me with another [JuliaStudio](https://github.com/forio/julia-studio) from Forio. I used for my tests a cmahine with Windows7

```
fatal: error thrown and no exception handler available.
Base.SystemError(prefix="mkdir", errnum::Int32)
```

After with downloading the last pre-relese julia v.0.3.0 I’ve found where exactly happening that system error. Fortunately for me, in the last version of Julia, you could see much more details what is actually wrong with that error.

```
ERROR: mkdir: No such file or directory
 in systemerror at error.jl:39
while loading C:\Julia 0.3.0-prerelease\etc\julia\juliarc.jl, in expression star
ting on line 12
```

After was able to find that I have problems with creating a new folder for network share where my Windows domain controller save my AppData folder. For the fast fix we need *AppData* to *USERPROFILE* in \etc\julia\juliarc.jl

for now I just use Sublime text in combination with

Gadfly.jl looked quite good for plotting tasks also you would need Cairo like a plotting driver https://github.com/dcjones/Gadfly.jl

```
ERROR: Cairo must be installed to use the PNG backend.
 in PNG at C:\Users\khomenkos.AWESOME\.julia\v0.3\Compose\src\Compose.jl:73
```

Everyone likes vissualizations, but sometimes it's quite difficult to make visualizations more interructive
D3

joinpath(Pkg.dir("Gadfly"), "src", "gadfly.js")

<script src="http://d3js.org/d3.v3.min.js"></script>
<script src="gadfly.js"></script>

<!-- Placed whereever you want the graphic to be rendered. -->
<div id="my_chart"></div>
<script src="mammals.js"></script>
<script>
draw("#my_chart");
</script>


http://d3js.org/

p = plot(dataset("car", "SLID"), x="Wages", color="Language", Geom.histogram)
draw(D3("mammals.js", 6inch, 6inch), p)

file:///C:/Julia%200.3.0-prerelease/test.html

In the middle of the process it just worked for me, but i didn’t change anything related

For a long time i had problems with Pkg.add("IJulia"). Mainly because my ipython was not in PATH environment and because of it IJulia were not about to find the path of Ipython and setup the profile for Julia.

Still missing lots of simple function like table, when you want to see distribution of for every type of factors.
There is a web page to show some of synonyms
 http://www.johnmyleswhite.com/notebook/2012/04/09/comparing-julia-and-rs-vocabularies/

Another issues, documentation, I was missing some very simple functions like table from R and almost gave up, only after twitter I found that there is another package, that could actually help me with that.
counts = countmap(gdf["x2"])
Another problem is dataframes, they are not the part of core, but you could install and use the DataFrames package https://github.com/JuliaStats/DataFrames.jl
The problem I’ve faced was creating new column, in R I never even thought about it, I just created it and used, here it’s not so easy

Connecting to different data sources with Julia http://randyzwitch.com/julia-import-data/
log parsing https://rtcamp.com/tutorials/nginx/log-parsing/


http://mashable.com/2013/07/05/google-tools/?utm_cid=mash-com-fb-main-link

http://wesmckinney.com/blog/?p=475


http://www.stat.wisc.edu/~bates/JuliaForRProgrammers.pdf

http://nbviewer.ipython.org/github/john9631/JuliaDocs/blob/master/GadflyTutorial/GadflyTutorial.ipynb
