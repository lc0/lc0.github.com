---
layout: post
title: "The story of your data by R"
date: 2013-09-21 11:19
comments: true
categories: ["R", "data mining", "Stylight", "imagehack"]
---

Data-data-data! Nowaday companies have lots of sorts of different data. Some of them just store data and looking forward to having some insigths,
some already have interesting aggregation and reporting frameworks, there are even some that use data to make data-driven decisions.
But, today I'm going to write blog post not about real busines cases and data-driven decisions, but about interesting data visualization.

Among different sorts of data, we usually have time series datasets, for instance, user signups, some transactions and so on.
The idea of my Friday evening hacking was to write R script, that could visualize such time series. From another side, I wanted to play around with maps in R,
so I decided to create visualization of user signups in terms of user location and grouped by a month of user signup.

{% img center http://i.imgur.com/xX8GLdw.gif 'The story of your data by R' 'The story of your data by R' %}

<!--more-->

MySQL, Windows way
--------------
Usually it's not a problem to connect to your relational database from R. Or at least not a problem when you use a normal operation system.
Unfortunately I'm a big fan of Windows and have some Windows-only software like Tableau. Okay, for my Windows7 x64,
I decided to use [RMySQL](http://cran.r-project.org/web/packages/RMySQL/index.html). The problem I've faced with:

{% codeblock %}
package ‘RMySQL’ is available as a source package but not as a binary
{% endcodeblock %}

To make it compiling for my case I needed to download [MySQL C Connector](http://dev.mysql.com/downloads/connector/c/), after to copy _libmysql.dll_ into MySQL bin folder and set _MYSQL_HOME_

{% gist 6654893 mysql.R %}

GEO-Coding
--------------
First real problem, that I had was geocoding. In my database, I didn't have any information about real users longitude and latitude.
Since, I didn't want to use information from user details, because some people don't fill in such information, some use fake data and so on.
I decided to use information about IP address. I didn't find any decent offline geo-coding solution for R, and since it was the evening of Friday I didn't want to
write any additional R wrappers for any of offline geo-coders.

There are a few geo-coding providers. The biggest are Google, Bing and Yandex, but they have strict limits for numbers of queries.
I decided to use [www.datasciencetoolkit.org](http://www.datasciencetoolkit.org/)

{% gist 6654893 ip2coordinates.R %}

Maps, dots, pictures
--------------
To have decent visialization I needed map providers. There are different map providers: [maps](http://cran.r-project.org/web/packages/maps/),
[RgoogleMaps](http://cran.r-project.org/web/packages/RgoogleMaps/index.html), [ggmap](http://cran.r-project.org/web/packages/ggmap/index.html), [rworldmap](http://cran.r-project.org/web/packages/rworldmap/index.html) and so on. I decided to use [maps](http://cran.r-project.org/web/packages/maps/) mainly because of limitations of other map providers.

The current version of the script:
{% gist 6654893 data-story.R %}

We're going to get pictures like this

{% img center http://i.imgur.com/lj0K76B.png %}

The main goal was to create a nice video with all generated data. To convert PNG images to one MPG file,
I used [ImageMagic](www.imagemagick.org/)

{% codeblock %}
convert -quality 100 -delay 100 *.png stylight-signups.mpg
{% endcodeblock %}

But, even with the _-quality 100_, I had not so good quality of video, especially for HD video.
So, I decided to use GIF instead of video. To convert a set of PNG images to one GIF image we need:

{% codeblock %}
convert -quality 100 -delay 100 *.png -loop 0 stylight-signups.gif
{% endcodeblock %}

{% img center http://i.imgur.com/xX8GLdw.gif 'The story of your data by R' 'The story of your data by R' %}

__PS__<br />
Since I haven't found any decent offline geo-decoder for R, my single-threaded _ip2coordinates_ works pretty slowly. In the next iteration of the script, I'm going to add multi-threading and some caching logic to improve speed of geocoding part of the script.

Another things I want to add to visualization is information about current month and correlation of number of users from the same place
and size of point on the map. Currently I just have one single point for every IP from my database. And of course a nice high resolution 720p video.