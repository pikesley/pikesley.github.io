---
layout: post
status: publish
published: true
title: Calculate π by throwing ruby-tipped darts
author:
  display_name: sam
  login: sam
  email: sam@orgraphone.org
  url: http://orgraphone.org
author_login: sam
author_email: sam@orgraphone.org
author_url: http://orgraphone.org
excerpt: "Erm, I rewrote <a href=\"http://www.param3.com/node/13\">this</a> in ruby:\r\n\r\n<pre>\r\n#!/usr/bin/env
  ruby\r\n# $Id: MonteCarlo.rb 146 2010-10-14 20:43:47Z sam $\r\n\r\n# Our main class\r\nclass
  MonteCarlo\r\n\r\n# We will automagically generate reader methods for these attributes\r\n
  \  attr_reader :pi, :count, :hits\r\n\r\n# Constructor: set everything to zero before
  we start\r\n   def initialize\r\n      @hits = 0;\r\n      @count = 0;\r\n      @pi
  = 0;\r\n   end\r\n\r\n# We call this method for every throw\r\n   def increment
  hit\r\n\r\n# We always clock up another throw\r\n      @count = @count + 1\r\n\r\n"
wordpress_id: 44
date: '2010-10-14 21:48:08 +0100'
date_gmt: '2010-10-14 21:48:08 +0100'
tags:
- ruby
- code
comments: []
---
<p>Erm, I rewrote <a href="http://orgraphone.org/2010/08/calculate-%CF%80-by-throwing-darts/">this</a> in ruby:</p>
<pre>#!/usr/bin/env ruby
# $Id: MonteCarlo.rb 146 2010-10-14 20:43:47Z sam $

# Our main class
class MonteCarlo

# We will automagically generate reader methods for these attributes
   attr_reader :pi, :count, :hits

# Constructor: set everything to zero before we start
   def initialize
      @hits = 0;
      @count = 0;
      @pi = 0;
   end

# We call this method for every throw
   def increment hit

# We always clock up another throw
      @count = @count + 1

# And accumulate a hit if we scored one
      @hits = @hits + 1 if hit

# Then calulate a new value of pi
      calcpi
   end

# Represent ourself as a string
   def to_s
      sprintf "Throws: %10d, Hits: %10d, Pi: %10f, Actual Pi: %10f", self.count, self.hits, self.pi, Math::PI
   end

# Mark off the private elements of this class
   private

# Calcluate pi
   def calcpi

# explanation can be found here: http://icanhaz.com/montecarlo
      @pi = 4.0 * ((@hits.to_f) / (@count.to_f))
   end

# Class ends
end

# Class representing a single throw of a dart
class Throw

# Constructor: we only do one thing, so we may as well do it here (I'm sure
# it's woefully inefficient to construct a new instance every time, but never
# mind)
   def initialize

# Generate two random coordinates (between 0 and 1)
      @x = rand
      @y = rand

# The distance from the origin will be the hypotenuse of a right-angled
# triangle with sides of length x and y. So from Pythagoras, we see that:
#
#      @distance = sqrt((x^2) + (y^2))
#
# which translates into Ruby as:
      @distance = ((@x * @x) + (@y * @y))**0.5
   end

# Method to determine whether our dart landed inside the quadrant
   def hit?

# Return true if distance from origin is 1.0 or less
      @distance &lt;= 1.0
   end

# Class ends
end

# Main code starts here
#
# First, contruct a new MonteCarlo object
mc = MonteCarlo.new

# Loop forever
while 1 do

# Every iteration, make a new Throw, see if we scored a 'hit', then hand this
# as the parameter as we increment the count of total throws
   mc.increment Throw.new.hit?

# Output every 1000th iteration
   puts mc if mc.count % 1000 == 0
end</pre>
<p>The source was on my Subversion server, but lol.</p>
