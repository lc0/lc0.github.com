---
layout: post
title: "Twitter word cloud with R"
date: 2013-08-25 01:00
comments: true
categories: ["R", "data mining", "Stylight"]
---

Sometimes, during general working days you need more creativity or just to take a look at something from different angle.
Since I work all my time with data, I also had some data-related ideas. I was interested to get the picture of the Twitter mentions.
The ideal case was to build the word cloud of the most popular words from tweets with certain hashtag.

I do like R language, and use it for the most of questions I have about data. Another point here, that R community is quite big and
there are lots of modules for almost every task. So, the main idea was to write a simple R script to analyse a Twitter feed and after build
word cloud of the most popular words.

{% img center /images/stylight_twitter.png 'stylight twitter analysis' 'twitter analysis' %}

<!--more-->

There is a special [TwitteR](http://cran.r-project.org/web/packages/twitteR/) package to connect to Twitter.
The only one issue here, that Twitter has changed the API recently, and to query all the user data you need oAuth.
With some old R scripts, that uses TwitteR you could run into error

{% codeblock %}
Error in twInterfaceObj$doAPICall(paste("users", "show", sep = "/"), params = params,  :
  OAuth authentication is required with Twitter's API v1.1
{% endcodeblock %}

To fix this problem, we would need to obtain a token before. OAuthFactory is described in TwitteR library, so only you need is

{% gist 6330460 OAuthFactory.R %}

After running twitCred$handshake(), you will get a link to Twitter, that sould generate a token. Another problem here,
that if you're going to run this code from RStudio, you probably will be faced with another bug of RStudio, when you couldn't
copy anything from terminal during the active promt. One of the variants to solve the problem is to write the link into a file,
or just to execute it directly in R console, not RStudio.

After typing back the token, we just need to register the token we received with our session.

{% codeblock %}
registerTwitterOAuth(twitCred)
{% endcodeblock %}

Now you could execute all general queries, that required oAuth access before.

{% gist 6330460 main.R %}

and more code to clean twitter feed and build the word cloud

{% gist 6330460 semantic_analysis.R %}

__UPD.__<br />
There is another R script, that has the same problem with oAuth. It's twitterMap.R, by Simply Statistics Blog,
the script builds a map of Twitter followers. For instance:

{% img center http://i.imgur.com/groHFJ9.png 'stylight twitter analysis' 'twitter analysis' %}

To fix this script, we need to use the hack with token we used before. Here is a diff of my changes:

{% gist 6339607 fixes.diff %}

In the same gist I added the fixed version of the [twitterMap.R](https://gist.github.com/lc0/6339607#file-twittermap-r)
