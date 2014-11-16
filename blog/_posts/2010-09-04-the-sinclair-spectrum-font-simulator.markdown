---
layout: post
status: publish
published: true
title: The Sinclair Spectrum font simulator
author:
  display_name: sam
  login: sam
  email: sam@orgraphone.org
  url: http://orgraphone.org
author_login: sam
author_email: sam@orgraphone.org
author_url: http://orgraphone.org
excerpt: "This one goes out on a whole new axis of pointlessness, but here it is:\r\n\r\nI
  wrote a <a href=\"http://toys.param3.com/sinclair/\">PHP version of this</a> a long
  time ago, but it was kind of limited (and PHP sucks). So I've now rewritten it in
  python to be much more flexible. So what can it do?\r\n\r\n<h2>Console version</h2>\r\n\r\n<code>./console_spectrum.py
  1982</code> will generate this:\r\n\r\n<pre>\r\n                                                                        \r\n
  \             OOOO          OOOOOOOO        OOOOOOOO        OOOOOOOO    \r\n</pre>"
wordpress_id: 35
date: '2010-09-04 21:50:16 +0100'
date_gmt: '2010-09-04 21:50:16 +0100'
tags:
- python
- code
comments: []
---
<p>This one goes out on a whole new axis of pointlessness, but here it is:</p>
<p>I wrote a PHP version of this a long time ago, but it was kind of limited (and PHP sucks). So I've now rewritten it in python to be much more flexible. So what can it do?</p>
<h2>Console version</h2>
<p><code>./console_spectrum.py 1982</code> will generate this:</p>
<pre>              OOOO          OOOOOOOO        OOOOOOOO        OOOOOOOO
            OO  OO        OO        OO    OO        OO    OO        OO
                OO        OO        OO      OOOOOOOO                OO
                OO          OOOOOOOOOO    OO        OO      OOOOOOOO
                OO                  OO    OO        OO    OO
            OOOOOOOOOO      OOOOOOOO        OOOOOOOO      OOOOOOOOOOOO</pre>
<p>There's an option to use a different character to draw the thing, and that's about. It could really do with an option to specify a colour, too...</p>
<h2>HTML table version</h2>
<p>OK, so this is the good stuff. <code>./html_spectrum.py Sinclair</code> will generate the HTML for this:</p>
<table class="spectrum" cellspacing="0" cellpadding="0">
<tbody>
<tr>
<td class="off" style="width: 3px; background-color: transparent; height: 3px;"></td>
<td class="off" style="width: 3px; background-color: transparent;"></td>
<td class="off" style="width: 3px; background-color: transparent;"></td>
<td class="off" style="width: 3px; background-color: transparent;"></td>
<td class="off" style="width: 3px; background-color: transparent;"></td>
<td class="off" style="width: 3px; background-color: transparent;"></td>
<td class="off" style="width: 3px; background-color: transparent;"></td>
<td class="off" style="width: 3px; background-color: transparent;"></td>
<td class="off" style="width: 3px; background-color: transparent;"></td>
<td class="off" style="width: 3px; background-color: transparent;"></td>
<td class="off" style="width: 3px; background-color: transparent;"></td>
<td class="off" style="width: 3px; background-color: transparent;"></td>
<td class="off" style="width: 3px; background-color: transparent;"></td>
<td class="off" style="width: 3px; background-color: transparent;"></td>
<td class="off" style="width: 3px; background-color: transparent;"></td>
<td class="off" style="width: 3px; background-color: transparent;"></td>
<td class="off" style="width: 3px; background-color: transparent;"></td>
<td class="off" style="width: 3px; background-color: transparent;"></td>
<td class="off" style="width: 3px; background-color: transparent;"></td>
<td class="off" style="width: 3px; background-color: transparent;"></td>
<td class="off" style="width: 3px; background-color: transparent;"></td>
<td class="off" style="width: 3px; background-color: transparent;"></td>
<td class="off" style="width: 3px; background-color: transparent;"></td>
<td class="off" style="width: 3px; background-color: transparent;"></td>
<td class="off" style="width: 3px; background-color: transparent;"></td>
<td class="off" style="width: 3px; background-color: transparent;"></td>
<td class="off" style="width: 3px; background-color: transparent;"></td>
<td class="off" style="width: 3px; background-color: transparent;"></td>
<td class="off" style="width: 3px; background-color: transparent;"></td>
<td class="off" style="width: 3px; background-color: transparent;"></td>
<td class="off" style="width: 3px; background-color: transparent;"></td>
<td class="off" style="width: 3px; background-color: transparent;"></td>
<td class="off" style="width: 3px; background-color: transparent;"></td>
<td class="off" style="width: 3px; background-color: transparent;"></td>
<td class="off" style="width: 3px; background-color: transparent;"></td>
<td class="off" style="width: 3px; background-color: transparent;"></td>
<td class="off" style="width: 3px; background-color: transparent;"></td>
<td class="off" style="width: 3px; background-color: transparent;"></td>
<td class="off" style="width: 3px; background-color: transparent;"></td>
<td class="off" style="width: 3px; background-color: transparent;"></td>
<td class="off" style="width: 3px; background-color: transparent;"></td>
<td class="off" style="width: 3px; background-color: transparent;"></td>
<td class="off" style="width: 3px; background-color: transparent;"></td>
<td class="off" style="width: 3px; background-color: transparent;"></td>
<td class="off" style="width: 3px; background-color: transparent;"></td>
<td class="off" style="width: 3px; background-color: transparent;"></td>
<td class="off" style="width: 3px; background-color: transparent;"></td>
<td class="off" style="width: 3px; background-color: transparent;"></td>
<td class="off" style="width: 3px; background-color: transparent;"></td>
<td class="off" style="width: 3px; background-color: transparent;"></td>
<td class="off" style="width: 3px; background-color: transparent;"></td>
<td class="off" style="width: 3px; background-color: transparent;"></td>
<td class="off" style="width: 3px; background-color: transparent;"></td>
<td class="off" style="width: 3px; background-color: transparent;"></td>
<td class="off" style="width: 3px; background-color: transparent;"></td>
<td class="off" style="width: 3px; background-color: transparent;"></td>
<td class="off" style="width: 3px; background-color: transparent;"></td>
<td class="off" style="width: 3px; background-color: transparent;"></td>
<td class="off" style="width: 3px; background-color: transparent;"></td>
<td class="off" style="width: 3px; background-color: transparent;"></td>
<td class="off" style="width: 3px; background-color: transparent;"></td>
<td class="off" style="width: 3px; background-color: transparent;"></td>
<td class="off" style="width: 3px; background-color: transparent;"></td>
<td class="off" style="width: 3px; background-color: transparent;"></td>
</tr>
<tr>
<td class="off" style="background-color: transparent; height: 3px;" colspan="64"></td>
</tr>
<tr>
<td class="off" style="background-color: transparent; height: 3px;" colspan="2"></td>
<td class="on" style="background-color: #f00;" colspan="4"></td>
<td class="off" style="background-color: transparent;" colspan="5"></td>
<td class="on" style="background-color: #f00;"></td>
<td class="off" style="background-color: transparent;" colspan="23"></td>
<td class="on" style="background-color: #f00;"></td>
<td class="off" style="background-color: transparent;" colspan="15"></td>
<td class="on" style="background-color: #f00;"></td>
<td class="off" style="background-color: transparent;" colspan="12"></td>
</tr>
<tr>
<td class="off" style="background-color: transparent; height: 3px;"></td>
<td class="on" style="background-color: #f00;"></td>
<td class="off" style="background-color: transparent;" colspan="15"></td>
<td class="on" style="background-color: #f00;" colspan="4"></td>
<td class="off" style="background-color: transparent;" colspan="6"></td>
<td class="on" style="background-color: #f00;" colspan="3"></td>
<td class="off" style="background-color: transparent;" colspan="5"></td>
<td class="on" style="background-color: #f00;"></td>
<td class="off" style="background-color: transparent;" colspan="6"></td>
<td class="on" style="background-color: #f00;" colspan="3"></td>
<td class="off" style="background-color: transparent;" colspan="14"></td>
<td class="on" style="background-color: #f00;" colspan="3"></td>
<td class="off" style="background-color: transparent;" colspan="2"></td>
</tr>
<tr>
<td class="off" style="background-color: transparent; height: 3px;" colspan="2"></td>
<td class="on" style="background-color: #f00;" colspan="4"></td>
<td class="off" style="background-color: transparent;" colspan="4"></td>
<td class="on" style="background-color: #f00;" colspan="2"></td>
<td class="off" style="background-color: transparent;" colspan="5"></td>
<td class="on" style="background-color: #f00;"></td>
<td class="off" style="background-color: transparent;" colspan="3"></td>
<td class="on" style="background-color: #f00;"></td>
<td class="off" style="background-color: transparent;" colspan="4"></td>
<td class="on" style="background-color: #f00;"></td>
<td class="off" style="background-color: transparent;" colspan="8"></td>
<td class="on" style="background-color: #f00;"></td>
<td class="off" style="background-color: transparent;" colspan="9"></td>
<td class="on" style="background-color: #f00;"></td>
<td class="off" style="background-color: transparent;" colspan="4"></td>
<td class="on" style="background-color: #f00;" colspan="2"></td>
<td class="off" style="background-color: transparent;" colspan="6"></td>
<td class="on" style="background-color: #f00;"></td>
<td class="off" style="background-color: transparent;" colspan="5"></td>
</tr>
<tr>
<td class="off" style="background-color: transparent; height: 3px;" colspan="6"></td>
<td class="on" style="background-color: #f00;"></td>
<td class="off" style="background-color: transparent;" colspan="4"></td>
<td class="on" style="background-color: #f00;"></td>
<td class="off" style="background-color: transparent;" colspan="5"></td>
<td class="on" style="background-color: #f00;"></td>
<td class="off" style="background-color: transparent;" colspan="3"></td>
<td class="on" style="background-color: #f00;"></td>
<td class="off" style="background-color: transparent;" colspan="4"></td>
<td class="on" style="background-color: #f00;"></td>
<td class="off" style="background-color: transparent;" colspan="8"></td>
<td class="on" style="background-color: #f00;"></td>
<td class="off" style="background-color: transparent;" colspan="6"></td>
<td class="on" style="background-color: #f00;" colspan="4"></td>
<td class="off" style="background-color: transparent;" colspan="5"></td>
<td class="on" style="background-color: #f00;"></td>
<td class="off" style="background-color: transparent;" colspan="6"></td>
<td class="on" style="background-color: #f00;"></td>
<td class="off" style="background-color: transparent;" colspan="5"></td>
</tr>
<tr>
<td class="off" style="background-color: transparent; height: 3px;"></td>
<td class="on" style="background-color: #f00;"></td>
<td class="off" style="background-color: transparent;" colspan="4"></td>
<td class="on" style="background-color: #f00;"></td>
<td class="off" style="background-color: transparent;" colspan="4"></td>
<td class="on" style="background-color: #f00;"></td>
<td class="off" style="background-color: transparent;" colspan="5"></td>
<td class="on" style="background-color: #f00;"></td>
<td class="off" style="background-color: transparent;" colspan="3"></td>
<td class="on" style="background-color: #f00;"></td>
<td class="off" style="background-color: transparent;" colspan="4"></td>
<td class="on" style="background-color: #f00;"></td>
<td class="off" style="background-color: transparent;" colspan="8"></td>
<td class="on" style="background-color: #f00;"></td>
<td class="off" style="background-color: transparent;" colspan="5"></td>
<td class="on" style="background-color: #f00;"></td>
<td class="off" style="background-color: transparent;" colspan="3"></td>
<td class="on" style="background-color: #f00;"></td>
<td class="off" style="background-color: transparent;" colspan="5"></td>
<td class="on" style="background-color: #f00;"></td>
<td class="off" style="background-color: transparent;" colspan="6"></td>
<td class="on" style="background-color: #f00;"></td>
<td class="off" style="background-color: transparent;" colspan="5"></td>
</tr>
<tr>
<td class="off" style="background-color: transparent; height: 3px;" colspan="2"></td>
<td class="on" style="background-color: #f00;" colspan="4"></td>
<td class="off" style="background-color: transparent;" colspan="4"></td>
<td class="on" style="background-color: #f00;" colspan="3"></td>
<td class="off" style="background-color: transparent;" colspan="4"></td>
<td class="on" style="background-color: #f00;"></td>
<td class="off" style="background-color: transparent;" colspan="3"></td>
<td class="on" style="background-color: #f00;"></td>
<td class="off" style="background-color: transparent;" colspan="5"></td>
<td class="on" style="background-color: #f00;" colspan="3"></td>
<td class="off" style="background-color: transparent;" colspan="6"></td>
<td class="on" style="background-color: #f00;" colspan="2"></td>
<td class="off" style="background-color: transparent;" colspan="4"></td>
<td class="on" style="background-color: #f00;" colspan="4"></td>
<td class="off" style="background-color: transparent;" colspan="4"></td>
<td class="on" style="background-color: #f00;" colspan="3"></td>
<td class="off" style="background-color: transparent;" colspan="5"></td>
<td class="on" style="background-color: #f00;"></td>
<td class="off" style="background-color: transparent;" colspan="5"></td>
</tr>
<tr>
<td class="off" style="background-color: transparent; height: 3px;" colspan="64"></td>
</tr>
</tbody>
</table>
<p>The <code>-s</code> (size) option lets us make a</p>
<table class="spectrum" cellspacing="0" cellpadding="0">
<tbody>
<tr>
<td class="off" style="width: 1px; background-color: transparent; height: 1px;"></td>
<td class="off" style="width: 1px; background-color: transparent;"></td>
<td class="off" style="width: 1px; background-color: transparent;"></td>
<td class="off" style="width: 1px; background-color: transparent;"></td>
<td class="off" style="width: 1px; background-color: transparent;"></td>
<td class="off" style="width: 1px; background-color: transparent;"></td>
<td class="off" style="width: 1px; background-color: transparent;"></td>
<td class="off" style="width: 1px; background-color: transparent;"></td>
<td class="off" style="width: 1px; background-color: transparent;"></td>
<td class="off" style="width: 1px; background-color: transparent;"></td>
<td class="off" style="width: 1px; background-color: transparent;"></td>
<td class="off" style="width: 1px; background-color: transparent;"></td>
<td class="off" style="width: 1px; background-color: transparent;"></td>
<td class="off" style="width: 1px; background-color: transparent;"></td>
<td class="off" style="width: 1px; background-color: transparent;"></td>
<td class="off" style="width: 1px; background-color: transparent;"></td>
<td class="off" style="width: 1px; background-color: transparent;"></td>
<td class="off" style="width: 1px; background-color: transparent;"></td>
<td class="off" style="width: 1px; background-color: transparent;"></td>
<td class="off" style="width: 1px; background-color: transparent;"></td>
<td class="off" style="width: 1px; background-color: transparent;"></td>
<td class="off" style="width: 1px; background-color: transparent;"></td>
<td class="off" style="width: 1px; background-color: transparent;"></td>
<td class="off" style="width: 1px; background-color: transparent;"></td>
<td class="off" style="width: 1px; background-color: transparent;"></td>
<td class="off" style="width: 1px; background-color: transparent;"></td>
<td class="off" style="width: 1px; background-color: transparent;"></td>
<td class="off" style="width: 1px; background-color: transparent;"></td>
<td class="off" style="width: 1px; background-color: transparent;"></td>
<td class="off" style="width: 1px; background-color: transparent;"></td>
<td class="off" style="width: 1px; background-color: transparent;"></td>
<td class="off" style="width: 1px; background-color: transparent;"></td>
<td class="off" style="width: 1px; background-color: transparent;"></td>
<td class="off" style="width: 1px; background-color: transparent;"></td>
<td class="off" style="width: 1px; background-color: transparent;"></td>
<td class="off" style="width: 1px; background-color: transparent;"></td>
<td class="off" style="width: 1px; background-color: transparent;"></td>
<td class="off" style="width: 1px; background-color: transparent;"></td>
<td class="off" style="width: 1px; background-color: transparent;"></td>
<td class="off" style="width: 1px; background-color: transparent;"></td>
<td class="off" style="width: 1px; background-color: transparent;"></td>
<td class="off" style="width: 1px; background-color: transparent;"></td>
<td class="off" style="width: 1px; background-color: transparent;"></td>
<td class="off" style="width: 1px; background-color: transparent;"></td>
<td class="off" style="width: 1px; background-color: transparent;"></td>
<td class="off" style="width: 1px; background-color: transparent;"></td>
<td class="off" style="width: 1px; background-color: transparent;"></td>
<td class="off" style="width: 1px; background-color: transparent;"></td>
<td class="off" style="width: 1px; background-color: transparent;"></td>
<td class="off" style="width: 1px; background-color: transparent;"></td>
<td class="off" style="width: 1px; background-color: transparent;"></td>
<td class="off" style="width: 1px; background-color: transparent;"></td>
<td class="off" style="width: 1px; background-color: transparent;"></td>
<td class="off" style="width: 1px; background-color: transparent;"></td>
<td class="off" style="width: 1px; background-color: transparent;"></td>
<td class="off" style="width: 1px; background-color: transparent;"></td>
<td class="off" style="width: 1px; background-color: transparent;"></td>
<td class="off" style="width: 1px; background-color: transparent;"></td>
<td class="off" style="width: 1px; background-color: transparent;"></td>
<td class="off" style="width: 1px; background-color: transparent;"></td>
<td class="off" style="width: 1px; background-color: transparent;"></td>
<td class="off" style="width: 1px; background-color: transparent;"></td>
<td class="off" style="width: 1px; background-color: transparent;"></td>
<td class="off" style="width: 1px; background-color: transparent;"></td>
<td class="off" style="width: 1px; background-color: transparent;"></td>
<td class="off" style="width: 1px; background-color: transparent;"></td>
<td class="off" style="width: 1px; background-color: transparent;"></td>
<td class="off" style="width: 1px; background-color: transparent;"></td>
<td class="off" style="width: 1px; background-color: transparent;"></td>
<td class="off" style="width: 1px; background-color: transparent;"></td>
<td class="off" style="width: 1px; background-color: transparent;"></td>
<td class="off" style="width: 1px; background-color: transparent;"></td>
<td class="off" style="width: 1px; background-color: transparent;"></td>
<td class="off" style="width: 1px; background-color: transparent;"></td>
<td class="off" style="width: 1px; background-color: transparent;"></td>
<td class="off" style="width: 1px; background-color: transparent;"></td>
<td class="off" style="width: 1px; background-color: transparent;"></td>
<td class="off" style="width: 1px; background-color: transparent;"></td>
<td class="off" style="width: 1px; background-color: transparent;"></td>
<td class="off" style="width: 1px; background-color: transparent;"></td>
</tr>
<tr>
<td class="off" style="background-color: transparent; height: 1px;" colspan="80"></td>
</tr>
<tr>
<td class="off" style="background-color: transparent; height: 1px;" colspan="3"></td>
<td class="on" style="background-color: #f00;"></td>
<td class="off" style="background-color: transparent;" colspan="7"></td>
<td class="on" style="background-color: #f00;"></td>
<td class="off" style="background-color: transparent;" colspan="7"></td>
<td class="on" style="background-color: #f00;"></td>
<td class="off" style="background-color: transparent;" colspan="7"></td>
<td class="on" style="background-color: #f00;"></td>
<td class="off" style="background-color: transparent;" colspan="7"></td>
<td class="on" style="background-color: #f00;"></td>
<td class="off" style="background-color: transparent;" colspan="44"></td>
</tr>
<tr>
<td class="off" style="background-color: transparent; height: 1px;" colspan="3"></td>
<td class="on" style="background-color: #f00;"></td>
<td class="off" style="background-color: transparent;" colspan="14"></td>
<td class="on" style="background-color: #f00;" colspan="3"></td>
<td class="off" style="background-color: transparent;" colspan="5"></td>
<td class="on" style="background-color: #f00;" colspan="3"></td>
<td class="off" style="background-color: transparent;" colspan="6"></td>
<td class="on" style="background-color: #f00;"></td>
<td class="off" style="background-color: transparent;" colspan="6"></td>
<td class="on" style="background-color: #f00;" colspan="3"></td>
<td class="off" style="background-color: transparent;" colspan="13"></td>
<td class="on" style="background-color: #f00;" colspan="3"></td>
<td class="off" style="background-color: transparent;" colspan="4"></td>
<td class="on" style="background-color: #f00;" colspan="4"></td>
<td class="off" style="background-color: transparent;" colspan="5"></td>
<td class="on" style="background-color: #f00;" colspan="3"></td>
<td class="off" style="background-color: transparent;" colspan="3"></td>
</tr>
<tr>
<td class="off" style="background-color: transparent; height: 1px;" colspan="3"></td>
<td class="on" style="background-color: #f00;"></td>
<td class="off" style="background-color: transparent;" colspan="6"></td>
<td class="on" style="background-color: #f00;" colspan="2"></td>
<td class="off" style="background-color: transparent;" colspan="7"></td>
<td class="on" style="background-color: #f00;"></td>
<td class="off" style="background-color: transparent;" colspan="7"></td>
<td class="on" style="background-color: #f00;"></td>
<td class="off" style="background-color: transparent;" colspan="7"></td>
<td class="on" style="background-color: #f00;"></td>
<td class="off" style="background-color: transparent;" colspan="5"></td>
<td class="on" style="background-color: #f00;"></td>
<td class="off" style="background-color: transparent;" colspan="3"></td>
<td class="on" style="background-color: #f00;"></td>
<td class="off" style="background-color: transparent;" colspan="11"></td>
<td class="on" style="background-color: #f00;"></td>
<td class="off" style="background-color: transparent;" colspan="3"></td>
<td class="on" style="background-color: #f00;"></td>
<td class="off" style="background-color: transparent;" colspan="3"></td>
<td class="on" style="background-color: #f00;"></td>
<td class="off" style="background-color: transparent;" colspan="3"></td>
<td class="on" style="background-color: #f00;"></td>
<td class="off" style="background-color: transparent;" colspan="3"></td>
<td class="on" style="background-color: #f00;"></td>
<td class="off" style="background-color: transparent;" colspan="3"></td>
<td class="on" style="background-color: #f00;"></td>
<td class="off" style="background-color: transparent;" colspan="2"></td>
</tr>
<tr>
<td class="off" style="background-color: transparent; height: 1px;" colspan="3"></td>
<td class="on" style="background-color: #f00;"></td>
<td class="off" style="background-color: transparent;" colspan="7"></td>
<td class="on" style="background-color: #f00;"></td>
<td class="off" style="background-color: transparent;" colspan="7"></td>
<td class="on" style="background-color: #f00;"></td>
<td class="off" style="background-color: transparent;" colspan="7"></td>
<td class="on" style="background-color: #f00;"></td>
<td class="off" style="background-color: transparent;" colspan="7"></td>
<td class="on" style="background-color: #f00;"></td>
<td class="off" style="background-color: transparent;" colspan="5"></td>
<td class="on" style="background-color: #f00;" colspan="4"></td>
<td class="off" style="background-color: transparent;" colspan="12"></td>
<td class="on" style="background-color: #f00;"></td>
<td class="off" style="background-color: transparent;" colspan="3"></td>
<td class="on" style="background-color: #f00;"></td>
<td class="off" style="background-color: transparent;" colspan="3"></td>
<td class="on" style="background-color: #f00;"></td>
<td class="off" style="background-color: transparent;" colspan="3"></td>
<td class="on" style="background-color: #f00;"></td>
<td class="off" style="background-color: transparent;" colspan="3"></td>
<td class="on" style="background-color: #f00;" colspan="4"></td>
<td class="off" style="background-color: transparent;" colspan="3"></td>
</tr>
<tr>
<td class="off" style="background-color: transparent; height: 1px;" colspan="3"></td>
<td class="on" style="background-color: #f00;"></td>
<td class="off" style="background-color: transparent;" colspan="7"></td>
<td class="on" style="background-color: #f00;"></td>
<td class="off" style="background-color: transparent;" colspan="7"></td>
<td class="on" style="background-color: #f00;"></td>
<td class="off" style="background-color: transparent;" colspan="7"></td>
<td class="on" style="background-color: #f00;"></td>
<td class="off" style="background-color: transparent;" colspan="7"></td>
<td class="on" style="background-color: #f00;"></td>
<td class="off" style="background-color: transparent;" colspan="5"></td>
<td class="on" style="background-color: #f00;"></td>
<td class="off" style="background-color: transparent;" colspan="15"></td>
<td class="on" style="background-color: #f00;"></td>
<td class="off" style="background-color: transparent;" colspan="3"></td>
<td class="on" style="background-color: #f00;"></td>
<td class="off" style="background-color: transparent;" colspan="3"></td>
<td class="on" style="background-color: #f00;"></td>
<td class="off" style="background-color: transparent;" colspan="3"></td>
<td class="on" style="background-color: #f00;"></td>
<td class="off" style="background-color: transparent;" colspan="3"></td>
<td class="on" style="background-color: #f00;"></td>
<td class="off" style="background-color: transparent;" colspan="6"></td>
</tr>
<tr>
<td class="off" style="background-color: transparent; height: 1px;" colspan="4"></td>
<td class="on" style="background-color: #f00;" colspan="2"></td>
<td class="off" style="background-color: transparent;" colspan="4"></td>
<td class="on" style="background-color: #f00;" colspan="3"></td>
<td class="off" style="background-color: transparent;" colspan="7"></td>
<td class="on" style="background-color: #f00;" colspan="2"></td>
<td class="off" style="background-color: transparent;" colspan="6"></td>
<td class="on" style="background-color: #f00;" colspan="2"></td>
<td class="off" style="background-color: transparent;" colspan="6"></td>
<td class="on" style="background-color: #f00;" colspan="2"></td>
<td class="off" style="background-color: transparent;" colspan="4"></td>
<td class="on" style="background-color: #f00;" colspan="4"></td>
<td class="off" style="background-color: transparent;" colspan="12"></td>
<td class="on" style="background-color: #f00;" colspan="3"></td>
<td class="off" style="background-color: transparent;" colspan="4"></td>
<td class="on" style="background-color: #f00;"></td>
<td class="off" style="background-color: transparent;" colspan="3"></td>
<td class="on" style="background-color: #f00;"></td>
<td class="off" style="background-color: transparent;" colspan="4"></td>
<td class="on" style="background-color: #f00;" colspan="4"></td>
<td class="off" style="background-color: transparent;" colspan="2"></td>
</tr>
<tr>
<td class="off" style="background-color: transparent; height: 1px;" colspan="80"></td>
</tr>
</tbody>
</table>
<p>or a</p>
<table class="spectrum" cellspacing="0" cellpadding="0">
<tbody>
<tr>
<td class="off" style="width: 6px; background-color: transparent; height: 6px;"></td>
<td class="off" style="width: 6px; background-color: transparent;"></td>
<td class="off" style="width: 6px; background-color: transparent;"></td>
<td class="off" style="width: 6px; background-color: transparent;"></td>
<td class="off" style="width: 6px; background-color: transparent;"></td>
<td class="off" style="width: 6px; background-color: transparent;"></td>
<td class="off" style="width: 6px; background-color: transparent;"></td>
<td class="off" style="width: 6px; background-color: transparent;"></td>
<td class="off" style="width: 6px; background-color: transparent;"></td>
<td class="off" style="width: 6px; background-color: transparent;"></td>
<td class="off" style="width: 6px; background-color: transparent;"></td>
<td class="off" style="width: 6px; background-color: transparent;"></td>
<td class="off" style="width: 6px; background-color: transparent;"></td>
<td class="off" style="width: 6px; background-color: transparent;"></td>
<td class="off" style="width: 6px; background-color: transparent;"></td>
<td class="off" style="width: 6px; background-color: transparent;"></td>
<td class="off" style="width: 6px; background-color: transparent;"></td>
<td class="off" style="width: 6px; background-color: transparent;"></td>
<td class="off" style="width: 6px; background-color: transparent;"></td>
<td class="off" style="width: 6px; background-color: transparent;"></td>
<td class="off" style="width: 6px; background-color: transparent;"></td>
<td class="off" style="width: 6px; background-color: transparent;"></td>
<td class="off" style="width: 6px; background-color: transparent;"></td>
<td class="off" style="width: 6px; background-color: transparent;"></td>
<td class="off" style="width: 6px; background-color: transparent;"></td>
<td class="off" style="width: 6px; background-color: transparent;"></td>
<td class="off" style="width: 6px; background-color: transparent;"></td>
<td class="off" style="width: 6px; background-color: transparent;"></td>
<td class="off" style="width: 6px; background-color: transparent;"></td>
<td class="off" style="width: 6px; background-color: transparent;"></td>
<td class="off" style="width: 6px; background-color: transparent;"></td>
<td class="off" style="width: 6px; background-color: transparent;"></td>
<td class="off" style="width: 6px; background-color: transparent;"></td>
<td class="off" style="width: 6px; background-color: transparent;"></td>
<td class="off" style="width: 6px; background-color: transparent;"></td>
<td class="off" style="width: 6px; background-color: transparent;"></td>
<td class="off" style="width: 6px; background-color: transparent;"></td>
<td class="off" style="width: 6px; background-color: transparent;"></td>
<td class="off" style="width: 6px; background-color: transparent;"></td>
<td class="off" style="width: 6px; background-color: transparent;"></td>
<td class="off" style="width: 6px; background-color: transparent;"></td>
<td class="off" style="width: 6px; background-color: transparent;"></td>
<td class="off" style="width: 6px; background-color: transparent;"></td>
<td class="off" style="width: 6px; background-color: transparent;"></td>
<td class="off" style="width: 6px; background-color: transparent;"></td>
<td class="off" style="width: 6px; background-color: transparent;"></td>
<td class="off" style="width: 6px; background-color: transparent;"></td>
<td class="off" style="width: 6px; background-color: transparent;"></td>
<td class="off" style="width: 6px; background-color: transparent;"></td>
<td class="off" style="width: 6px; background-color: transparent;"></td>
<td class="off" style="width: 6px; background-color: transparent;"></td>
<td class="off" style="width: 6px; background-color: transparent;"></td>
<td class="off" style="width: 6px; background-color: transparent;"></td>
<td class="off" style="width: 6px; background-color: transparent;"></td>
<td class="off" style="width: 6px; background-color: transparent;"></td>
<td class="off" style="width: 6px; background-color: transparent;"></td>
</tr>
<tr>
<td class="off" style="background-color: transparent; height: 6px;" colspan="56"></td>
</tr>
<tr>
<td class="off" style="background-color: transparent; height: 6px;" colspan="2"></td>
<td class="on" style="background-color: #f00;"></td>
<td class="off" style="background-color: transparent;" colspan="8"></td>
<td class="on" style="background-color: #f00;"></td>
<td class="off" style="background-color: transparent;" colspan="44"></td>
</tr>
<tr>
<td class="off" style="background-color: transparent; height: 6px;" colspan="2"></td>
<td class="on" style="background-color: #f00;"></td>
<td class="off" style="background-color: transparent;" colspan="15"></td>
<td class="on" style="background-color: #f00;" colspan="4"></td>
<td class="off" style="background-color: transparent;" colspan="12"></td>
<td class="on" style="background-color: #f00;" colspan="3"></td>
<td class="off" style="background-color: transparent;" colspan="4"></td>
<td class="on" style="background-color: #f00;" colspan="4"></td>
<td class="off" style="background-color: transparent;" colspan="5"></td>
<td class="on" style="background-color: #f00;" colspan="3"></td>
<td class="off" style="background-color: transparent;" colspan="3"></td>
</tr>
<tr>
<td class="off" style="background-color: transparent; height: 6px;" colspan="2"></td>
<td class="on" style="background-color: #f00;" colspan="4"></td>
<td class="off" style="background-color: transparent;" colspan="4"></td>
<td class="on" style="background-color: #f00;" colspan="2"></td>
<td class="off" style="background-color: transparent;" colspan="5"></td>
<td class="on" style="background-color: #f00;"></td>
<td class="off" style="background-color: transparent;" colspan="3"></td>
<td class="on" style="background-color: #f00;"></td>
<td class="off" style="background-color: transparent;" colspan="11"></td>
<td class="on" style="background-color: #f00;"></td>
<td class="off" style="background-color: transparent;" colspan="3"></td>
<td class="on" style="background-color: #f00;"></td>
<td class="off" style="background-color: transparent;" colspan="3"></td>
<td class="on" style="background-color: #f00;"></td>
<td class="off" style="background-color: transparent;" colspan="3"></td>
<td class="on" style="background-color: #f00;"></td>
<td class="off" style="background-color: transparent;" colspan="3"></td>
<td class="on" style="background-color: #f00;"></td>
<td class="off" style="background-color: transparent;" colspan="3"></td>
<td class="on" style="background-color: #f00;"></td>
<td class="off" style="background-color: transparent;" colspan="2"></td>
</tr>
<tr>
<td class="off" style="background-color: transparent; height: 6px;" colspan="2"></td>
<td class="on" style="background-color: #f00;"></td>
<td class="off" style="background-color: transparent;" colspan="3"></td>
<td class="on" style="background-color: #f00;"></td>
<td class="off" style="background-color: transparent;" colspan="4"></td>
<td class="on" style="background-color: #f00;"></td>
<td class="off" style="background-color: transparent;" colspan="5"></td>
<td class="on" style="background-color: #f00;"></td>
<td class="off" style="background-color: transparent;" colspan="3"></td>
<td class="on" style="background-color: #f00;"></td>
<td class="off" style="background-color: transparent;" colspan="11"></td>
<td class="on" style="background-color: #f00;"></td>
<td class="off" style="background-color: transparent;" colspan="3"></td>
<td class="on" style="background-color: #f00;"></td>
<td class="off" style="background-color: transparent;" colspan="3"></td>
<td class="on" style="background-color: #f00;"></td>
<td class="off" style="background-color: transparent;" colspan="3"></td>
<td class="on" style="background-color: #f00;"></td>
<td class="off" style="background-color: transparent;" colspan="3"></td>
<td class="on" style="background-color: #f00;" colspan="4"></td>
<td class="off" style="background-color: transparent;" colspan="3"></td>
</tr>
<tr>
<td class="off" style="background-color: transparent; height: 6px;" colspan="2"></td>
<td class="on" style="background-color: #f00;"></td>
<td class="off" style="background-color: transparent;" colspan="3"></td>
<td class="on" style="background-color: #f00;"></td>
<td class="off" style="background-color: transparent;" colspan="4"></td>
<td class="on" style="background-color: #f00;"></td>
<td class="off" style="background-color: transparent;" colspan="6"></td>
<td class="on" style="background-color: #f00;" colspan="4"></td>
<td class="off" style="background-color: transparent;" colspan="11"></td>
<td class="on" style="background-color: #f00;"></td>
<td class="off" style="background-color: transparent;" colspan="3"></td>
<td class="on" style="background-color: #f00;"></td>
<td class="off" style="background-color: transparent;" colspan="3"></td>
<td class="on" style="background-color: #f00;"></td>
<td class="off" style="background-color: transparent;" colspan="3"></td>
<td class="on" style="background-color: #f00;"></td>
<td class="off" style="background-color: transparent;" colspan="3"></td>
<td class="on" style="background-color: #f00;"></td>
<td class="off" style="background-color: transparent;" colspan="6"></td>
</tr>
<tr>
<td class="off" style="background-color: transparent; height: 6px;" colspan="2"></td>
<td class="on" style="background-color: #f00;" colspan="4"></td>
<td class="off" style="background-color: transparent;" colspan="4"></td>
<td class="on" style="background-color: #f00;" colspan="3"></td>
<td class="off" style="background-color: transparent;" colspan="8"></td>
<td class="on" style="background-color: #f00;"></td>
<td class="off" style="background-color: transparent;" colspan="12"></td>
<td class="on" style="background-color: #f00;" colspan="3"></td>
<td class="off" style="background-color: transparent;" colspan="4"></td>
<td class="on" style="background-color: #f00;"></td>
<td class="off" style="background-color: transparent;" colspan="3"></td>
<td class="on" style="background-color: #f00;"></td>
<td class="off" style="background-color: transparent;" colspan="4"></td>
<td class="on" style="background-color: #f00;" colspan="4"></td>
<td class="off" style="background-color: transparent;" colspan="2"></td>
</tr>
<tr>
<td class="off" style="background-color: transparent; height: 6px;" colspan="18"></td>
<td class="on" style="background-color: #f00;" colspan="3"></td>
<td class="off" style="background-color: transparent;" colspan="35"></td>
</tr>
</tbody>
</table>
<p>and the <code>-c</code> (colour) option lets us make a</p>
<table class="spectrum" cellspacing="0" cellpadding="0">
<tbody>
<tr>
<td class="off" style="width: 3px; background-color: transparent; height: 3px;"></td>
<td class="off" style="width: 3px; background-color: transparent;"></td>
<td class="off" style="width: 3px; background-color: transparent;"></td>
<td class="off" style="width: 3px; background-color: transparent;"></td>
<td class="off" style="width: 3px; background-color: transparent;"></td>
<td class="off" style="width: 3px; background-color: transparent;"></td>
<td class="off" style="width: 3px; background-color: transparent;"></td>
<td class="off" style="width: 3px; background-color: transparent;"></td>
<td class="off" style="width: 3px; background-color: transparent;"></td>
<td class="off" style="width: 3px; background-color: transparent;"></td>
<td class="off" style="width: 3px; background-color: transparent;"></td>
<td class="off" style="width: 3px; background-color: transparent;"></td>
<td class="off" style="width: 3px; background-color: transparent;"></td>
<td class="off" style="width: 3px; background-color: transparent;"></td>
<td class="off" style="width: 3px; background-color: transparent;"></td>
<td class="off" style="width: 3px; background-color: transparent;"></td>
<td class="off" style="width: 3px; background-color: transparent;"></td>
<td class="off" style="width: 3px; background-color: transparent;"></td>
<td class="off" style="width: 3px; background-color: transparent;"></td>
<td class="off" style="width: 3px; background-color: transparent;"></td>
<td class="off" style="width: 3px; background-color: transparent;"></td>
<td class="off" style="width: 3px; background-color: transparent;"></td>
<td class="off" style="width: 3px; background-color: transparent;"></td>
<td class="off" style="width: 3px; background-color: transparent;"></td>
<td class="off" style="width: 3px; background-color: transparent;"></td>
<td class="off" style="width: 3px; background-color: transparent;"></td>
<td class="off" style="width: 3px; background-color: transparent;"></td>
<td class="off" style="width: 3px; background-color: transparent;"></td>
<td class="off" style="width: 3px; background-color: transparent;"></td>
<td class="off" style="width: 3px; background-color: transparent;"></td>
<td class="off" style="width: 3px; background-color: transparent;"></td>
<td class="off" style="width: 3px; background-color: transparent;"></td>
<td class="off" style="width: 3px; background-color: transparent;"></td>
<td class="off" style="width: 3px; background-color: transparent;"></td>
<td class="off" style="width: 3px; background-color: transparent;"></td>
<td class="off" style="width: 3px; background-color: transparent;"></td>
<td class="off" style="width: 3px; background-color: transparent;"></td>
<td class="off" style="width: 3px; background-color: transparent;"></td>
<td class="off" style="width: 3px; background-color: transparent;"></td>
<td class="off" style="width: 3px; background-color: transparent;"></td>
<td class="off" style="width: 3px; background-color: transparent;"></td>
<td class="off" style="width: 3px; background-color: transparent;"></td>
<td class="off" style="width: 3px; background-color: transparent;"></td>
<td class="off" style="width: 3px; background-color: transparent;"></td>
<td class="off" style="width: 3px; background-color: transparent;"></td>
<td class="off" style="width: 3px; background-color: transparent;"></td>
<td class="off" style="width: 3px; background-color: transparent;"></td>
<td class="off" style="width: 3px; background-color: transparent;"></td>
<td class="off" style="width: 3px; background-color: transparent;"></td>
<td class="off" style="width: 3px; background-color: transparent;"></td>
<td class="off" style="width: 3px; background-color: transparent;"></td>
<td class="off" style="width: 3px; background-color: transparent;"></td>
<td class="off" style="width: 3px; background-color: transparent;"></td>
<td class="off" style="width: 3px; background-color: transparent;"></td>
<td class="off" style="width: 3px; background-color: transparent;"></td>
<td class="off" style="width: 3px; background-color: transparent;"></td>
<td class="off" style="width: 3px; background-color: transparent;"></td>
<td class="off" style="width: 3px; background-color: transparent;"></td>
<td class="off" style="width: 3px; background-color: transparent;"></td>
<td class="off" style="width: 3px; background-color: transparent;"></td>
<td class="off" style="width: 3px; background-color: transparent;"></td>
<td class="off" style="width: 3px; background-color: transparent;"></td>
<td class="off" style="width: 3px; background-color: transparent;"></td>
<td class="off" style="width: 3px; background-color: transparent;"></td>
<td class="off" style="width: 3px; background-color: transparent;"></td>
<td class="off" style="width: 3px; background-color: transparent;"></td>
<td class="off" style="width: 3px; background-color: transparent;"></td>
<td class="off" style="width: 3px; background-color: transparent;"></td>
<td class="off" style="width: 3px; background-color: transparent;"></td>
<td class="off" style="width: 3px; background-color: transparent;"></td>
<td class="off" style="width: 3px; background-color: transparent;"></td>
<td class="off" style="width: 3px; background-color: transparent;"></td>
</tr>
<tr>
<td class="off" style="background-color: transparent; height: 3px;" colspan="72"></td>
</tr>
<tr>
<td class="off" style="background-color: transparent; height: 3px;" colspan="72"></td>
</tr>
<tr>
<td class="off" style="background-color: transparent; height: 3px;" colspan="2"></td>
<td class="on" style="background-color: #0f0;" colspan="4"></td>
<td class="off" style="background-color: transparent;" colspan="5"></td>
<td class="on" style="background-color: #0f0;" colspan="3"></td>
<td class="off" style="background-color: transparent;" colspan="4"></td>
<td class="on" style="background-color: #0f0;" colspan="3"></td>
<td class="off" style="background-color: transparent;" colspan="5"></td>
<td class="on" style="background-color: #0f0;" colspan="3"></td>
<td class="off" style="background-color: transparent;" colspan="4"></td>
<td class="on" style="background-color: #0f0;" colspan="4"></td>
<td class="off" style="background-color: transparent;" colspan="13"></td>
<td class="on" style="background-color: #0f0;" colspan="3"></td>
<td class="off" style="background-color: transparent;" colspan="4"></td>
<td class="on" style="background-color: #0f0;" colspan="4"></td>
<td class="off" style="background-color: transparent;" colspan="5"></td>
<td class="on" style="background-color: #0f0;" colspan="3"></td>
<td class="off" style="background-color: transparent;" colspan="3"></td>
</tr>
<tr>
<td class="off" style="background-color: transparent; height: 3px;"></td>
<td class="on" style="background-color: #0f0;"></td>
<td class="off" style="background-color: transparent;" colspan="3"></td>
<td class="on" style="background-color: #0f0;"></td>
<td class="off" style="background-color: transparent;" colspan="4"></td>
<td class="on" style="background-color: #0f0;"></td>
<td class="off" style="background-color: transparent;" colspan="6"></td>
<td class="on" style="background-color: #0f0;"></td>
<td class="off" style="background-color: transparent;" colspan="3"></td>
<td class="on" style="background-color: #0f0;"></td>
<td class="off" style="background-color: transparent;" colspan="3"></td>
<td class="on" style="background-color: #0f0;"></td>
<td class="off" style="background-color: transparent;" colspan="3"></td>
<td class="on" style="background-color: #0f0;"></td>
<td class="off" style="background-color: transparent;" colspan="3"></td>
<td class="on" style="background-color: #0f0;"></td>
<td class="off" style="background-color: transparent;" colspan="3"></td>
<td class="on" style="background-color: #0f0;"></td>
<td class="off" style="background-color: transparent;" colspan="11"></td>
<td class="on" style="background-color: #0f0;"></td>
<td class="off" style="background-color: transparent;" colspan="3"></td>
<td class="on" style="background-color: #0f0;"></td>
<td class="off" style="background-color: transparent;" colspan="3"></td>
<td class="on" style="background-color: #0f0;"></td>
<td class="off" style="background-color: transparent;" colspan="3"></td>
<td class="on" style="background-color: #0f0;"></td>
<td class="off" style="background-color: transparent;" colspan="3"></td>
<td class="on" style="background-color: #0f0;"></td>
<td class="off" style="background-color: transparent;" colspan="3"></td>
<td class="on" style="background-color: #0f0;"></td>
<td class="off" style="background-color: transparent;" colspan="2"></td>
</tr>
<tr>
<td class="off" style="background-color: transparent; height: 3px;"></td>
<td class="on" style="background-color: #0f0;"></td>
<td class="off" style="background-color: transparent;" colspan="3"></td>
<td class="on" style="background-color: #0f0;"></td>
<td class="off" style="background-color: transparent;" colspan="4"></td>
<td class="on" style="background-color: #0f0;"></td>
<td class="off" style="background-color: transparent;" colspan="6"></td>
<td class="on" style="background-color: #0f0;" colspan="4"></td>
<td class="off" style="background-color: transparent;" colspan="4"></td>
<td class="on" style="background-color: #0f0;" colspan="4"></td>
<td class="off" style="background-color: transparent;" colspan="4"></td>
<td class="on" style="background-color: #0f0;"></td>
<td class="off" style="background-color: transparent;" colspan="3"></td>
<td class="on" style="background-color: #0f0;"></td>
<td class="off" style="background-color: transparent;" colspan="11"></td>
<td class="on" style="background-color: #0f0;"></td>
<td class="off" style="background-color: transparent;" colspan="3"></td>
<td class="on" style="background-color: #0f0;"></td>
<td class="off" style="background-color: transparent;" colspan="3"></td>
<td class="on" style="background-color: #0f0;"></td>
<td class="off" style="background-color: transparent;" colspan="3"></td>
<td class="on" style="background-color: #0f0;"></td>
<td class="off" style="background-color: transparent;" colspan="3"></td>
<td class="on" style="background-color: #0f0;" colspan="4"></td>
<td class="off" style="background-color: transparent;" colspan="3"></td>
</tr>
<tr>
<td class="off" style="background-color: transparent; height: 3px;" colspan="2"></td>
<td class="on" style="background-color: #0f0;" colspan="4"></td>
<td class="off" style="background-color: transparent;" colspan="4"></td>
<td class="on" style="background-color: #0f0;"></td>
<td class="off" style="background-color: transparent;" colspan="6"></td>
<td class="on" style="background-color: #0f0;"></td>
<td class="off" style="background-color: transparent;" colspan="7"></td>
<td class="on" style="background-color: #0f0;"></td>
<td class="off" style="background-color: transparent;" colspan="7"></td>
<td class="on" style="background-color: #0f0;"></td>
<td class="off" style="background-color: transparent;" colspan="3"></td>
<td class="on" style="background-color: #0f0;"></td>
<td class="off" style="background-color: transparent;" colspan="11"></td>
<td class="on" style="background-color: #0f0;"></td>
<td class="off" style="background-color: transparent;" colspan="3"></td>
<td class="on" style="background-color: #0f0;"></td>
<td class="off" style="background-color: transparent;" colspan="3"></td>
<td class="on" style="background-color: #0f0;"></td>
<td class="off" style="background-color: transparent;" colspan="3"></td>
<td class="on" style="background-color: #0f0;"></td>
<td class="off" style="background-color: transparent;" colspan="3"></td>
<td class="on" style="background-color: #0f0;"></td>
<td class="off" style="background-color: transparent;" colspan="6"></td>
</tr>
<tr>
<td class="off" style="background-color: transparent; height: 3px;" colspan="5"></td>
<td class="on" style="background-color: #0f0;"></td>
<td class="off" style="background-color: transparent;" colspan="4"></td>
<td class="on" style="background-color: #0f0;"></td>
<td class="off" style="background-color: transparent;" colspan="7"></td>
<td class="on" style="background-color: #0f0;" colspan="4"></td>
<td class="off" style="background-color: transparent;" colspan="4"></td>
<td class="on" style="background-color: #0f0;" colspan="4"></td>
<td class="off" style="background-color: transparent;" colspan="3"></td>
<td class="on" style="background-color: #0f0;"></td>
<td class="off" style="background-color: transparent;" colspan="3"></td>
<td class="on" style="background-color: #0f0;"></td>
<td class="off" style="background-color: transparent;" colspan="12"></td>
<td class="on" style="background-color: #0f0;" colspan="3"></td>
<td class="off" style="background-color: transparent;" colspan="4"></td>
<td class="on" style="background-color: #0f0;"></td>
<td class="off" style="background-color: transparent;" colspan="3"></td>
<td class="on" style="background-color: #0f0;"></td>
<td class="off" style="background-color: transparent;" colspan="4"></td>
<td class="on" style="background-color: #0f0;" colspan="4"></td>
<td class="off" style="background-color: transparent;" colspan="2"></td>
</tr>
<tr>
<td class="off" style="background-color: transparent; height: 3px;" colspan="2"></td>
<td class="on" style="background-color: #0f0;" colspan="3"></td>
<td class="off" style="background-color: transparent;" colspan="67"></td>
</tr>
</tbody>
</table>
<h2>So how does it work?</h2>
<p>I managed to grub up the Spectrum character set as a list of bytes a long time ago from some kind soul on <code>comp.sys.sinclair</code>. The lines look like this:</p>
<pre>a: [0, 0, 56, 4, 60, 68, 60, 0]</pre>
<p>So we take the input string, then convert each of those numbers for each character into a byte that looks like this <code>00111000</code>, and join them altogether so we end up with 8 long strings of 0s and 1s. Then we compress each of these strings using <a href="http://en.wikipedia.org/wiki/Run_length_encoding">run length encoding</a>, and the compressed strings lend themselves very well to rendering as HTML table cells via the <code>colspan</code> property. We need to add a row of single-span cells along the top or the spacing gets knackered. And that's about it. It generates a phenomenal amount of HTML, but never mind...</p>
<p>I will put together a demo page similar to the PHP one when I can work out the vagaries of mod_python importing.</p>
<p>The code is available on <a title="Github" href="https://github.com/pikesley/sinclair-font">Github</a>, although I've now reimplemented this <a href='http://uncleclive.herokuapp.com/'>as a Service</a>.</p>
