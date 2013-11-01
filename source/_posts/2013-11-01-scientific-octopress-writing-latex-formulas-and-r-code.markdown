---
layout: post
title: "Scientific Octopress: Writing LaTeX formulas and R code"
date: 2013-11-01 15:19
comments: true
categories: ["Octopress", "LaTeX"]
---

I like Octopress blogging platform, the product is very flexible and also could be hosted even on Github.
For my old posts I added different custom changes to support variety of types of contents or to have some nice design.
Basically, for programming posts it's enough, you could even easily use Github gist hosting code snippets from posts
and lots of other interesting features. But honestly it's only for programming part of me.

From another side, I do like to read some nice researches and every nice research has solid math behind, that make that
paper even more elegant. So my task for today is to be able to share some ideas with possible math profs of them, or even some $$\TeX$$ based
papers.

$$
{coord}(q,d) \cdot \sum_{ t \in q}
\left ( {tf}(t,d) \cdot {idf}(t)^2 \cdot {norm}({field}(t),d) \right )
$$

<!--more-->

LaTeX
--------------
To render markdown, octopress uses the [rdiscount](https://github.com/davidfstr/rdiscount) library, but it doesn't support LaTeX.
I'd use [kramdown](http://kramdown.rubyforge.org/) library to parse LaTeX code. For this we need to add

{% codeblock %}
gem 'kramdown'
{% endcodeblock %}

into our Gemfile. Also in __config.yml_ we need replace markdown interpretator

{% codeblock %}
markdown: kramdown
{% endcodeblock %}

And the last step we need to add JavaScript library to render our math formulas. [MathJax](http://www.mathjax.org/) is good library to render such LaTeX and MathML.
We need to add next code into __

{% codeblock %}
<!-- mathjax config similar to math.stackexchange -->
<script type="text/x-mathjax-config">
MathJax.Hub.Config({
  jax: ["input/TeX", "output/HTML-CSS"],
  tex2jax: {
    inlineMath: [ ['$', '$'] ],
    displayMath: [ ['$$', '$$']],
    processEscapes: true,
    skipTags: ['script', 'noscript', 'style', 'textarea', 'pre', 'code']
  },
  messageStyle: "none",
  "HTML-CSS": { preferredFont: "TeX", availableFonts: ["STIX","TeX"] }
});
</script>
<script src="http://cdn.mathjax.org/mathjax/latest/MathJax.js?config=TeX-AMS_HTML" type="text/javascript"></script>
{% endcodeblock %}

Now we could write things like this

{% codeblock %}
$$
\begin{align}
\mbox{Union: } & A\cup B = \{x\mid x\in A \mbox{ or } x\in B\} \\
\mbox{Concatenation: } & A\circ B  = \{xy\mid x\in A \mbox{ and } y\in B\} \\
\mbox{Star: } & A^\star  = \{x_1x_2\ldots x_k \mid  k\geq 0 \mbox{ and each } x_i\in A\} \\
\end{align}
$$
{% endcodeblock %}

That would be transformed into nice

$$
\begin{align}
\mbox{Union: } & A\cup B = \{x\mid x\in A \mbox{ or } x\in B\} \\
\mbox{Concatenation: } & A\circ B  = \{xy\mid x\in A \mbox{ and } y\in B\} \\
\mbox{Star: } & A^\star  = \{x_1x_2\ldots x_k \mid  k\geq 0 \mbox{ and each } x_i\in A\} \\
\end{align}
$$