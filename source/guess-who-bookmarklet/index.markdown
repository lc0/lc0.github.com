---
layout: page
title: "Guess Who bookmarklet for the Friday name game"
date: 2013-04-26 14:05
comments: true
sharing: true
footer: true
---


Just drag and drop this link onto your bookmarks bar. After open our people site and click the bookmarklet from your bookmarks bar.

<a href="javascript:void(function(){var v=&quot;1.3.2&quot;;var correct=0;if(window.jQuery===undefined||window.jQuery.fn.jquery&lt;v){var done=false;var script=document.createElement(&quot;script&quot;);script.src=&quot;http://ajax.googleapis.com/ajax/libs/jquery/&quot;+v+&quot;/jquery.min.js&quot;;script.onload=script.onreadystatechange=function(){if(!done&amp;&amp;(!this.readyState||this.readyState==&quot;loaded&quot;||this.readyState==&quot;complete&quot;)){done=true;initMyBookmarklet();}};document.getElementsByTagName(&quot;head&quot;)[0].appendChild(script);}else{initMyBookmarklet();}function getRandomStylighter(people){var number=Math.floor((Math.random()*people.length)+1);return people[number]}function initMyBookmarklet(){(window.myBookmarklet=function(){var people=$('.thumbnail');var stylighter=getRandomStylighter(people);$('#wikiframe').remove();$('body').append(&quot;&lt;div id='wikiframe'&gt;&lt;div id='wikiframe_veil' style=''&gt;&lt;p&gt;Loading...&lt;/p&gt;&lt;/div&gt;\n&lt;div id=\&quot;stylighter\&quot;&gt;&quot;+$(stylighter).html()+&quot; &lt;/div&gt;\n&lt;style type='text/css'&gt;\n.container {display: none}#wikiframe_veil { display: none; position: fixed; width: 100%; height: 100%; top: 0; left: 0; background-color: rgba(255,255,255,.25); cursor: pointer; z-index: 900; } \n       #wikiframe_veil p { color: black; font: normal normal bold 20px/20px Helvetica, sans-serif; position: absolute; top: 50%; left: 50%; width: 10em; margin: -10px auto 0 -5em; text-align: center; } \n       #wikiframe #stylighter { display: none; position: fixed; top: 10%; left: 40%; width: 250px; z-index: 999; border: 10px solid rgba(0,0,0,.5); margin: -5px 0 0 -5px; background-color: white; } #wikiframe #stylighter h2 {display: none} \n&lt;/style&gt;\n&lt;/div&gt;&quot;);$('#wikiframe #stylighter').slideDown(500);setTimeout(function(){var name=prompt(&quot;Please enter the name of Stylighter&quot;,&quot;&quot;);if(name==$('#wikiframe #stylighter h2').text().split(' ')[0]){correct++;alert('Yes you\'re right. It\'s '+$('#wikiframe #stylighter h2').text());}else{alert('No,sorry, it\'s '+$('#wikiframe #stylighter h2').text());}initMyBookmarklet();},3000);})();}})();">Guess Who?</a>

and some JavaScript code of it:
{% gist 712e4a074ad781fbd97b people.js %}