---
title: Mv CV
layout: narrow
---

14 years a SysAdmin, now Head Of Robots. If I can't do it with Ruby, it probably isn't worth doing. If you can extract my phone number from the details below, then maybe I'll speak to you.

##Skills

###Configuration management

+ Chef
    - contributor to [cucumber-chef](https://github.com/Atalanta/cucumber-chef)
    - creator of [catering-college](https://github.com/pikesley/catering-college)

###Scripting

+ Ruby
+ bash

###Development tools

+ Git
+ Subversion
+ Vagrant
+ RVM
+ Bamboo
+ Hudson / Jenkins / Travis

###WWW

+ nginx
+ Apache
    - including mod_rewrite
+ thin
+ PHP scripting
+ haproxy administration

###OS

+ Linux (Ubuntu, Debian)
+ FreeBSD (4, 5, 6, 7)

###Cloudy stuff

+ EC2
+ RDS
+ S3 / CloudFront
+ Rackspace Cloud

###Databases

+ MySQL (including MMM)
+ Cassandra
+ MongoDB

###Network administration

+ Network topology planning
+ DNS (BIND 8, 9)
+ Samba

###Monitoring and measurement

+ Splunk
+ ServerDensity
+ Nagios
+ Zabbix

###Backup and recovery

+ Duplicity
+ Amanda

##Profile

###January 2013 - present: Head Of Robots at the [Open Data Institute](http://theodi.org), London

Automating the shit out of everything I can get my hands on.

###June 2011 - January 2013: DevOps Engineer for [AMEE UK Ltd](http://www.amee.com), London

AMEE is a start-up whose mission is to measure the carbon footprint of everything on the planet.

Working closely with AMEE's relatively small team of Java and Ruby devs, I was responsible for:

+ Putting in a huge amount of Chef plumbing (running off of our own Chef server) - AMEE's config management previously consisted of a handful of bash scripts. Any new stuff rolled out since late 2011 has been configuration-managed by Chef, and I expect to have all existing infrastructure in the hands of Chef before the end of 2012
+ Deploying and configuring Splunk
+ Migrating several of AMEE's legacy apps from leased iron in a DC to AWS

alongside the usual SysAdmin work of backup-and-restore, capacity planning, etc.

###August 2009 – June 2011: Systems Administrator for [Imagini Ltd](http://www.visualdna.com), London

Imagini is a dynamic startup based in Soho. The company generates profiles for users through the use of visual quizzes, working with clients including the LA Times, match.com and the Daily Mirror.

My role at Imagini was pretty much DevOps before I knew that DevOps was even a thing – as a busy startup with diverse client projects there were often multiple deploys per day, meaning I had to work very closely with the developers to make sure we were all on the same page.

This close working relationship was particularly fruitful during the gradual transfer of many of Imagini’s core services from the legacy platform (a couple of racks of Linux boxes in a London datacentre) to Amazon Web Services. The back-and-forth between myself and the development team was invaluable as we iterated through various combinations of EC2 Instance Types to find the setup that best fitted our requirements.

The transfer to AWS accelerated rapidly during 2011; the setup I left them with included:

+ A 16-node Cassandra cluster
+ A 6-node Hadoop cluster
+ Several groups of Elastic-Load-Balanced web servers

This platform is still in production use, including an all-new Quiz Engine which as far as I know is still performing extremely well.

During my time at Imagini I also:

+ Completely rewrote the legacy deployment system (in Python), and subsequently repurposed a lot of this code to handle AWS deploy
+ Introduced the MMM multi-master replication manager for MySQL on the front-end database servers
+ Cleaned-up and reorganised the Subversion repositories (the better to integrate with my new deploy system)
+ Managed a migration from Akamai EdgeControl to Amazon Cloudfront
+ Substantially rewrote the ‘event-tracking and processing’ system
+ Managed a migration from hosted Exchange email to Google Mail

###August 2003 – August 2009: Systems Administrator for [Rex Features Ltd](http://www.rexfeatures.com), London

Rex Features is Britain’s leading independent photographic press agency and picture library. Rex supplies a daily service of news, celebrity, features, and stock photos to all national newspapers, magazines, TV, web and other media in the UK and in more than 30 countries worldwide.

My work at Rex covered the usual gamut of Sysadmin tasks, including: backup and recovery, webserver administration, DNS management, plenty of scripting (mostly in bash), patching servers, and writing and maintaining documentation. There was also some SQL Server admin, and a certain amount of desktop support – Rex is a company of ~80 employees, supported by an IT department of four. All new server hardware passed through my hands for installation and configuration.

When I joined Rex, the IT department consisted of two very busy people. The IT infrastructure had been growing rapidly, deployment had happened on a seemingly ad-hoc basis, and documentation was fairly sparse. My initial tasks included:

+ Installing a CVS server (yes, this was 2003) and gathering code and scripts into it
+ Rolling out the Amanda backup system and setting up a proper backup and recovery scheme
+ Getting the RT ticketing system up and running (we later moved to Jira)
+ Beginning the process of documenting everything in Twiki (we subsequently migrated to Mediawiki)

Subsequently, I was directly involved in:

+ Setting up the Nagios network monitoring system
+ Migrating the internal mail from Novell to Exchange, and later outsourcing this function to Cobweb’s hosted Exchange platform
+ Configuring VPNs between Rex’s headquarters and various locations – initially using isakmpd on OpenBSD, and latterly on a Watchguard Firebox
+ Overseeing the transfer of Rex’s image data – 5 terabytes of jpegs at the time of writing – from a cluster based on a number of FreeBSD servers to a set of Network Appliance 3050 filers
+ Configuring and deploying Alteon load-balancers for the Rex website, which gets ~1.5 million hits and shifts ~13 gigs of data a day
+ Migrating Rex’s code from CVS to Subversion
+ Specifying and documenting a “standard Rex server install” – except for a handful of Windows servers, the whole of Rex’s server room and colo are running FreeBSD, so the standard install is a set of common ports and a number of scripts.

Rex went on to acquire another picture agency in Los Angeles, which brought about a project to integrate their image archive into Rex’s, modifying the server software to enable them to use the Rex client application, and deploying a new set of servers to support of all of this. The final setup consisted of a redundant pair of Microsoft SQL servers, a set of NetApp filers and shelves, and a group of FreeBSD servers (running apache and mod_perl) serving up three websites and a range of internal webservices, all sitting behind a pair of Alteon load-balancers.

###April 2000 – July 2003: Systems Administrator for Empower Interactive Ltd, London

Empower Interactive was a telecoms software startup, founded in 2000 in the City of London. The company grew from an initial team of eight to a team of approximately 60 people based all over the globe.

Having joined Empower at its inception, my initial responsibilities were to design and implement the IT infrastructure necessary to support the operations of the fledgling business. This included: network planning; server acquisition and installation (various internal servers, external mail server, firewall, etc); deploying a backup and recovery scheme; managing the website; and a great deal of user education. I also got involved in many other aspects of the business – this was a tiny start-up, so I found myself doing testing, writing user manuals for Empower’s products, and even doing a little Java.

I was solely responsible for supporting this infrastructure for the first year, until the business expanded to the extent that further IT staff were required. I was asked to set up an IT department, and recruited another Sysadmin who specialised in Windows; the team continued to expand over the following years. I gained experience with Solaris 8, HP-UX and qualified as an Oracle administrator in order to install some of Empower’s products onto carrier-grade hardware; I also assisted with deploying the hardware into telcos.

Empower unfortunately ceased trading in November 2006.

##Personal

###Interests

+ [Music](https://soundcloud.com/rawfunkmaharishi)
+ [Photography](http://www.flickr.com/photos/pikesley/)
+ [Gardening](https://www.flickr.com/photos/pikesley/sets/72157644197110144/)

###Contact details

+ [web](http://sam.pikesley.org)
+ [github](https://github.com/pikesley/)
+ [twitter](http://twitter.com/pikesley)
+ [email](mailto:s@m.pikesley.org)
+ [linkedin](http://uk.linkedin.com/in/sampikesley)
+ telephone: `'+%d' % [ '684dace0e7'.to_i(16) ]`
