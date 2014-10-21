---
layout: post
status: publish
published: true
title: Extracting beauty from revision control
author:
  display_name: sam
  login: sam
  email: sam@orgraphone.org
  url: http://orgraphone.org
author_login: sam
author_email: sam@orgraphone.org
author_url: http://orgraphone.org
wordpress_id: 169
wordpress_url: http://org.orgraphone.org/?p=169
date: '2010-11-28 20:56:01 +0000'
date_gmt: '2010-11-28 20:56:01 +0000'
tags:
- subversion
- gource
- git
comments: []
---
<p><object classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000" width="480" height="385" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,40,0"><param name="allowFullScreen" value="true" /><param name="allowscriptaccess" value="always" /><param name="src" value="http://www.youtube.com/v/Ywl9dXL2Skk?fs=1&amp;hl=en_GB&amp;color1=0x3a3a3a&amp;color2=0x999999" /><param name="allowfullscreen" value="true" /><embed type="application/x-shockwave-flash" width="480" height="385" src="http://www.youtube.com/v/Ywl9dXL2Skk?fs=1&amp;hl=en_GB&amp;color1=0x3a3a3a&amp;color2=0x999999" allowscriptaccess="always" allowfullscreen="true"></embed></object></p>
<p>I realise I may be a little late to the party here, but I recently came across the awesome <a href="https://code.google.com/p/gource/">gource</a> with which I made the above video. It's generated from <em>/etc/</em> on my VPS - I'm versioning that using <a href="http://kitenet.net/~joey/code/etckeeper/">etckeeper</a> which gives me a <a href="http://git-scm.com/">git</a> repository going back to August of this year.</p>
<h2>How I did it</h2>
<p>This is pretty easy to do. First I grabbed a copy of <em>/etc/</em> from the VPS to <em>/tmp/etc/</em> on the laptop (running Ubuntu Maverick), then</p>
<pre>sudo apt-get install gource ffmpeg
cd /tmp/etc/
gource \
        -s 1 \
        -800x600 \
        --date-format %Y-%m-%d\ %H:%M:%S \
        --colour-images \
        --disable-progress \
        --camera-mode track \
        --file-filter \.svn \
        --output-ppm-stream - | \
        ffmpeg \
        -y \
        -b 3000K \
        -r 60 \
        -f image2pipe \
        -vcodec ppm \
        -i - gource.avi
</pre>
<p>Most of the gource options I've used are fairly self-explanatory I think. I'm filtering out <em>\.svn</em> there because some of my config files are also versioned with <a href="http://subversion.tigris.org/">subversion</a> (my apache vhosts, for example) and the video was even denser with those left in. The ffmpeg options I cut 'n' pasted wholesale from somewhere, Cargo-Cult-style, because ffmpeg is voodoo.</p>
<p>Speaking of subversion, it's possible to generate gource videos from SVN projects too, using either <a href="http://www.kernel.org/pub/software/scm/git/docs/git-svn.html">git-svn</a> or the python script that you can find on <a href="https://code.google.com/p/gource/wiki/SVN">this page</a>.</p>
