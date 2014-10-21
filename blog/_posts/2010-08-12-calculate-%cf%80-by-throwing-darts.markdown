---
layout: post
status: publish
published: true
title: Calculate π by throwing darts
author:
  display_name: sam
  login: sam
  email: sam@orgraphone.org
  url: http://orgraphone.org
author_login: sam
author_email: sam@orgraphone.org
author_url: http://orgraphone.org
excerpt: "We can approximate pi using nothing more than random numbers and some simple
  geometry: in essence, we randomly throw darts at a square board of side r; within
  the square we inscribe a quadrant of a circle of radius r with its centre at (0,
  0). We count all of the 'throws'; if a dart lands within the quadrant, we also count
  a 'hit'.\r\n\r\nFor a large number of throws, we see that:\r\n<pre>\r\n        hits
  \   area_of_quadrant\r\n       ------ = ----------------\r\n       throws    area_of_square\r\n</pre>\r\n\r\nSome
  half-remembered geometry tells us that:\r\n<pre>\r\n       area_of_quadrant   (1
  / 4) * pi * r^2   pi\r\n       ---------------- = ------------------ = --\r\n        area_of_square
  \          r^2            4\r\n</pre>\r\n\r\nOr:\r\n<pre>     \r\n                area_of_quadrant
  \       hits\r\n       pi = 4 * ---------------- = 4 * ------\r\n                 area_of_square
  \       throws\r\n</pre>\r\n"
wordpress_id: 13
date: '2010-08-12 22:33:32 +0100'
date_gmt: '2010-08-12 22:33:32 +0100'
tags:
- python
- code
comments: []
---
<p>We can approximate pi using nothing more than random numbers and some simple geometry: in essence, we randomly throw darts at a square board of side r; within the square we inscribe a quadrant of a circle of radius r with its centre at (0, 0). We count all of the 'throws'; if a dart lands within the quadrant, we also count a 'hit'.</p>
<p>For a large number of throws, we see that:</p>
<pre>
        hits    area_of_quadrant
       ------ = ----------------
       throws    area_of_square
</pre>
<p>Some half-remembered geometry tells us that:</p>
<pre>
       area_of_quadrant   (1 / 4) * pi * r^2   pi
       ---------------- = ------------------ = --
        area_of_square           r^2            4
</pre>
<p>Or:</p>
<pre>     
                area_of_quadrant        hits
       pi = 4 * ---------------- = 4 * ------
                 area_of_square        throws
</pre>
<p><!--break--><br />
I first solved this problem as an undergraduate sometime in 1994 as part of a Computational Physics module. Using FORTRAN.</p>
<p>The full explanation can be found <a href="http://icanhaz.com/calculatepi">here</a>.</p>
<pre>
#!/usr/bin/env python

import random
import math

# class representing a single throw of a dart
class Throw:
	def __init__(self):
		# generate two random coordinates and work out how far away we are from
		# the origin
		self.x = random.random()
		self.y = random.random()
		self.distance = self.distance()

	def distance(self):
		# the distance from the origin is the hypotenuse of a right-angled 
		# triangle with sides of length and x and y. Pythagoras told us that:
		#    distance = sqrt((x^2) + (y^2))
		# which looks like this in python
		return math.sqrt(self.x**2 + self.y**2)

	# did we land inside the quadrant?
	def is_a_hit(self):
		return self.distance <= 1.0

# main class
class MonteCarlo:
	def __init__(self):
		# initialise everything
		self.hits = 0
		self.throws = 0
		self.pi = 0

	# this method is called on every throw
	def increment(self, throw):
		# we always clock up another throw
		self.throws += 1
		# and accumulate a hit if we scored
		if throw.is_a_hit():
			self.hits += 1
		# then get a new value of pi
		self.calculate_pi()

	# explanation can be found here: http://icanhaz.com/montecarlo
	def calculate_pi(self):
		self.pi = 4 * (float(self.hits) / float(self.throws))

	# we use this in determining whether to print our status
	def divides_by(self, number):
		return float(self.throws) % number == 0

	# represent the current state as a string
	def __repr__(self):
		return "Throws: %10d, Hits: %10d, Pi: %10f, Actual Pi: %10f" % (self.throws, self.hits, self.pi, math.pi)

# if we're called on the command line
if __name__ == '__main__':
	import sys
	try:
		step = int(sys.argv[1])
	except IndexError:
		step = 1000
	# construct a new instance
	m = MonteCarlo()
	# loop forever
	while 1:
		# keep throwing darts
		m.increment(Throw())
		# only print on every nth iteration
		if m.divides_by(step): print m
</pre>
<p>You can grab the code <a href="http://svn.cruft.co/code/montecarlo/MonteCarlo.py">here</a>. </p>
<p>And there's now a <a href="http://org.orgraphone.org/2010/10/calculate-%CF%80-by-throwing-ruby-tipped-darts/">ruby version</a>, too.</p>
