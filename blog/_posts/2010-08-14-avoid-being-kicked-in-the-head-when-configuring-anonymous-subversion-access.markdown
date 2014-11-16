---
layout: post
status: publish
published: true
title: Avoid being kicked in the head when configuring anonymous Subversion access
author:
  display_name: sam
  login: sam
  email: sam@orgraphone.org
  url: http://orgraphone.org
author_login: sam
author_email: sam@orgraphone.org
author_url: http://orgraphone.org
excerpt: "Granting anonymous read-only access to a single repository in a site with
  multiple repos led to much swearing. But I've now cracked it. Here's how...\r\n\r\n<h2>What
  was I trying to do?</h2>\r\n\r\nI'm running SVN via Apache, authenticating with
  basic HTTP auth. I have a few repositories in my SVN, and I wanted to grant anonymous
  read-only access to just one of them. So let us begin with \r\n\r\n<h3>The naive
  solution</h3>\r\n\r\nThe first thing I tried was using something like this in my
  apache vhost:\r\n\r\n<pre>\r\n   &lt;Location /&gt;\r\n      DAV                  svn\r\n
  \     SVNPath              /home/svn/\r"
wordpress_id: 18
date: '2010-08-14 17:35:30 +0100'
date_gmt: '2010-08-14 17:35:30 +0100'
tags:
- linux
- subversion
- apache
comments: []
---
<p>Granting anonymous read-only access to a single repository in a site with multiple repos led to much swearing. But I've now cracked it. Here's how...</p>
<h2>What was I trying to do?</h2>
<p>I'm running SVN via Apache, authenticating with basic HTTP auth. I have a few repositories in my SVN, and I wanted to grant anonymous read-only access to just one of them. So let us begin with </p>
<h3>The naive solution</h3>
<p>The first thing I tried was using something like this in my apache vhost:</p>
<pre>
   &lt;Location /&gt;
      DAV                  svn
      SVNPath              /home/svn/
      Satisfy              Any
      AuthType             Basic
      AuthName             "param3 Subversion Repository"
      AuthUserFile         /etc/apache2/dav_svn.passwd
      AuthGroupFile        /dev/null
      AuthzSVNAccessFile   /etc/apache2/svn_auth.conf
      &lt;LimitExcept         GET PROPFIND OPTIONS REPORT&gt;
         Require           valid-user
      &lt;/LimitExcept&gt;
   &lt;/Location&gt;
</pre>
<p>(as recommended in most Google results for "read-only svn access"), where <code>/etc/apache2/svn_auth.conf</code> looked like this:</p>
<pre>
[code:/]
# everyone gets read-only access
* = r
# but only I can write here
sam = rw

[some_other_repo:/]
sam = rw
</pre>
<p>And indeed this behaved mostly as expected: I was able to anonymously check out a project from my <code>code</code> repo, but when I attempted to check in modifications I was asked to authenticate. WIN, right? Wrong. Because now <em>any</em> access to <code>some_other_repo</code> gave me a 403. WTF? I tried all kinds of variations on the vhost and svn_auth file, and cursed a lot, until I found the correct answer in the <a href="http://svnbook.red-bean.com/en/1.0/ch06s04.html">SVN book</a>. So let's now look at</p>
<h3>The correct solution</h3>
<p>It turns out that we don't actually need the <code>&lt;LimitExcept FOO BAR&gt;</code> block at all. The vhost now looks like this</p>
<pre>
   &lt;Location /&gt;
      DAV                  svn
      SVNParentPath        /home/svn/
      AuthzSVNAccessFile   /etc/apache2/svn_auth.conf

      Satisfy              Any
      Require              valid-user

      AuthType             Basic
      AuthName             "param3 Subversion Repository"
      AuthUserFile         /etc/apache2/dav_svn.passwd
      AuthGroupFile        /dev/null
   &lt;/Location&gt;
</pre>
<p>and the magic actually happens in <code>svn_auth.conf</code>:</p>
<pre>
[some_other_repo:/]
# no access at all to unauthorised users
* =
sam = rw

[code:/]
* = r
sam = rw  
</pre>
<p>Aha! This is made entirely of WIN! And once we have this, we can exert</p>
<h4>Even finer-grained control</h4>
<p>My <code>svn_auth.conf</code> now looks something like this:</p>
<pre>
[some_other_repo:/]
* =
sam = rw

[code:/]
* =
sam = rw

[code:/montecarlo]
* = r
</pre>
<p>so I'm granting anonymous access <em>only</em> to the <code>montecarlo</code> tree, and nothing else.</p>
<p>EDIT: Actually, I'm not sure about the fine-grained control stuff: when I had this set for more than one subtree, I was getting 403s again. Bears further investigation...</p>
<p>Hope somebody finds this useful.</p>
