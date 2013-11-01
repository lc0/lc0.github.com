---
layout: post
title: "Scientific Octopress: Writing LaTeX formulas and R code"
date: 2013-11-01 15:19
comments: true
categories: ["Octopress", "LaTeX", "MathJs"]
---

I like blogging platform Octopress, the product is very flexible and also could be hosted even on Github.
For my old posts I've added different custom changes to support variety of types of contents and to have a nice design.
Basically, for programming posts it's enough, you could even easily use Github gist for hosting code snippets from posts
and lots of other interesting features. But, honestly, it's only for programming part of me.

From another side, I do like to read some nice researches and every nice research has solid math behind, that make that
paper even more elegant. So my task for today is to be able to share some ideas with possible math proofs of them, or even some $$\TeX$$ based
papers.

$$
{coord}(q,d) \cdot \sum_{ t \in q}
\left ( {tf}(t,d) \cdot {idf}(t)^2 \cdot {norm}({field}(t),d) \right )
$$

<!--more-->

LaTeX
--------------
To render markdown, Octopress uses the [rdiscount](https://github.com/davidfstr/rdiscount) library, but it doesn't support LaTeX.
I decided to use [kramdown](http://kramdown.rubyforge.org/) library to parse TeX code. For this we need to add

{% codeblock %}
gem 'kramdown'
{% endcodeblock %}

into our _Gemfile_. Also in __config.yml_ markdown interpretator option must ben replace with

{% codeblock %}
markdown: kramdown
{% endcodeblock %}

And the last step, we need to add JavaScript library to render our math formulas. [MathJax](http://www.mathjax.org/) is a good library to render such LaTeX and MathML. We need to add next code into _source\_layouts\default.html_

{% gist d9ac107689a57507ca73 mathjax.html %}

Now we could write things like this

{% gist d9ac107689a57507ca73 simple.tex %}

That would be transformed into this

$$
\begin{align}
\mbox{Union: } & A\cup B = \{x\mid x\in A \mbox{ or } x\in B\} \\
\mbox{Concatenation: } & A\circ B  = \{xy\mid x\in A \mbox{ and } y\in B\} \\
\mbox{Star: } & A^\star  = \{x_1x_2\ldots x_k \mid  k\geq 0 \mbox{ and each } x_i\in A\} \\
\end{align}
$$