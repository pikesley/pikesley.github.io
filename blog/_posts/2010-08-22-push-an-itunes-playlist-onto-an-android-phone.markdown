---
layout: post
status: publish
published: true
title: Push an iTunes playlist onto an Android phone
author:
  display_name: sam
  login: sam
  email: sam@orgraphone.org
  url: http://orgraphone.org
author_login: sam
author_email: sam@orgraphone.org
author_url: http://orgraphone.org
excerpt: "So here's the thing: iTunes will let you export a playlist as plain(ish)
  text. This script will:\r\n\r\n<ul>\r\n<li>Parse that playlist file</li>\r\n<li>Remove
  from it any tracks that are already on your Android <sup>*</sup></li>\r\n<li>Work
  out if your Android has enough free space to accommodate the new tracks</li>\r\n<li>Push
  the tracks to the Android</li>\r\n</ul>\r\n\r\n"
wordpress_id: 29
date: '2010-08-22 17:27:49 +0100'
date_gmt: '2010-08-22 17:27:49 +0100'
tags:
- python
- android
- itunes
- code
comments: []
---
<p>So here's the thing: iTunes will let you export a playlist as plain(ish) text. This script will:</p>
<ul>
<li>Parse that playlist file</li>
<li>Remove from it any tracks that are already on your Android <sup>*</sup></li>
<li>Work out if your Android has enough free space to accommodate the new tracks</li>
<li>Push the tracks to the Android</li>
</ul>
<p>This is not limited to Android, of course: any mp3 player that shows up as an external storage device (i.e. most things that aren't iPods) will work. You can edit <code>conf/config.cfg</code> or set some command line flags to specify the mountpoint at which your device shows up and the path where it stores its music.</p>
<p><sub>* The duplicate-detection will fail if you've previously transferred music to your player from somewhere other than your iTunes media tree (I'm not a magician).</sub></p>
<p>The code:</p>
<ul>
<li>Used to be on my Subversion server but lol</li>
</ul>
<p>Check it out, then run it as <code>./iTunes-to-Android.py -h</code> to see the available options, or <code>./iTunes-to-Android.py &lt;playlist_file.txt&gt;</code> to actually transfer some music.</p>
<p>Todo (if I can be arsed):</p>
<ul>
<li>Generalise the playlist class then subclass it to handle playlists from Amarok, Exaile etc</li>
<li>Clean up some sub-optimal hacks I threw in to get the damn thing working</li>
</ul>
<p>This started as a little bash script, but inevitably it's grown into a massively over-engineered solution to a trivial problem. But hey, I like writing code, and this one may actually have some practical purpose.</p>
