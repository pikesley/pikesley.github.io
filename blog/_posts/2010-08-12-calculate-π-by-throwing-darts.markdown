<p>
    We can approximate <em>π</em> using nothing more than random numbers and some
    simple geometry: we randomly throw darts at a square board of
    side <em>r</em>; within the square we inscribe a quadrant of a circle of radius <em>r</em>
    with its centre at <em>(0, 0)</em>. We count all of the 'throws'; if a dart lands
    within the quadrant, we also count a 'hit'.
  </p>
  <p>
    For a large number of throws, we see that:
  </p>
  <div class='maths'>
    <math>
      <mfrac>
        <mi>hits</mi>
  	    <mn>throws</mn>
      </mfrac>
      <mo>=</mo>
      <mfrac>
        <mi>area-of-quadrant</mi>
        <mn>area-of-square</mn>
      </mfrac>
    </math>
  </div>

  <p>
    Some half-remembered geometry tells us that:
  </p>
  <div class='maths'>
    <math>
      <mfrac>
        <mi>area-of-quadrant</mi>
        <mi>area-of-square</mi>
      </mfrac>
      <mo>=</mo>
      <mfrac>
        <mrow>
          <msup><mi>πr</mi><mn>2</mn></msup><mo>/</mo><mn>4</mn>
        </mrow>
        <mrow>
          <msup><mi>r</mi><mn>2</mn></msup>
        </mrow>
      </mfrac>
      <mo>=</mo>
      <mfrac>
        <mi>π</mi>
        <mn>4</mn>
      </mfrac>
    </math>
  </div>

  <p>
    Or:
  </p>
  <div class='maths'>
    <math>
      <mi>π</mi>
      <mo>=</mo>
      <mn>4</mn>
      <mo>(</mo>
      <mfrac>
        <mi>area-of-quadrant</mi>
        <mi>area-of-square</mi>
      </mfrac>
      <mo>)</mo>
      <mo>=</mo>
      <mn>4</mn>
      <mo>(</mo>
      <mfrac>
        <mi>hits</mi>
        <mi>throws</mi>
      </mfrac>
      <mo>)</mo>
    </math>
  </div>

<p>
I first solved this problem as an undergraduate sometime in 1994 as part of a Computational Physics module. Using FORTRAN.</p>

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

<p>There's now a <a href="//pikesley.org/blog/2010/10/14/calculate-π-by-throwing-ruby-tipped-darts/">ruby version</a>, too.</p>
