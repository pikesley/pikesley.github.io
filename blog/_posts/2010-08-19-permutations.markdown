---
layout: post
status: publish
published: true
title: Permutations
author:
  display_name: sam
  login: sam
  email: sam@orgraphone.org
  url: http://orgraphone.org
author_login: sam
author_email: sam@orgraphone.org
author_url: http://orgraphone.org
excerpt: "We want to work out all the possible arrangements of a list of <code>n</code>
  items. Why? We don't know. But we do know how to do it: seed with a list containing
  a single list containing a single item: <code>[['a']]</code>. Then step through
  each of the lists in our list, and make copies, inserting the next item (<code>'b'</code>)
  at each index, so we get <code>[['b', 'a'], ['a', 'b']]</code>. Then we take this
  list as our seed and go round again, inserting the next item (<code>'c'</code>),
  so we get <code>[['c', 'b', 'a'], ['b', 'c', 'a'], ['b', 'a', 'c'], ['c', 'a', 'b'],
  ['a', 'c', 'b'], ['a', 'b', 'c']]</code>. And so on and so on, until we've permuted
  all of our items. These lists get pretty big pretty quickly (the length of the list
  is <code>n!</code> so 10 items generates 3628800 combinations, and doing this may
  bring your computer to its knees).\r\n"
wordpress_id: 28
date: '2010-08-19 21:47:52 +0100'
date_gmt: '2010-08-19 21:47:52 +0100'
tags:
- python
- code
comments: []
---
<p>We want to work out all the possible arrangements of a list of <code>n</code> items. Why? We don't know. But we do know how to do it: seed with a list containing a single list containing a single item: <code>[['a']]</code>. Then step through each of the lists in our list, and make copies, inserting the next item (<code>'b'</code>) at each index, so we get <code>[['b', 'a'], ['a', 'b']]</code>. Then we take this list as our seed and go round again, inserting the next item (<code>'c'</code>), so we get <code>[['c', 'b', 'a'], ['b', 'c', 'a'], ['b', 'a', 'c'], ['c', 'a', 'b'], ['a', 'c', 'b'], ['a', 'b', 'c']]</code>. And so on and so on, until we've permuted all of our items. These lists get pretty big pretty quickly (the length of the list is <code>n!</code> so 10 items generates 3628800 combinations, and doing this may bring your computer to its knees).<br />
<!--break--></p>
<pre>#!/usr/bin/env python

# class representing a list of permutations
class Unit(list):
        # count the total number of Units spawned
        count = 0
        def __init__(self, seed = None):
                # if this is the first Unit created, we need to prepare the seed
                if Unit.count == 0: seed = [[seed]]
                Unit.count += 1
                # call our superclass. We are just a fancy list
                super(Unit, self).__init__(seed)

        # produce a new generation, splicing in the passed in value
        def spawn(self, interloper):
                # a temporary working list
                l = []
                # for each of our existing lists
                for u in self:
                        # for each index (including length + 1)
                        for i in range(0, len(u) + 1):
                                # take a copy of the list
                                a = Unit(u)
                                # insert the new value at this index
                                a.insert(i, interloper)
                                # and add the modified copy to our working list
                                l.append(a)
                # when we're done, return a new Unit seeded with the list we just built
                return Unit(l)

        # calculate and show some stats
        def stats(self):
                self.items = len(self[0])
                self.combinations = len(self)
                return "%d items, %d permutations" % (self.items, self.combinations)

# simple wrapper class representing the set of items we want to permute
class Inventory(list):
        def __init__(self, chars):
                # we are yet another variation on a list
                super(Inventory, self).__init__(chars)

        # do we have more items to give?
        def has_next(self):
                return len(self) &gt; 0

        # shift the first item off of the list
        def next(self):
                return self.pop(0)

# wrapper class that actually does the work. We extend the Unit class mainly
# because we want its stats() method
class Permutations(Unit):
        def __init__(self, items):
                # we need an inventory
                self.i = Inventory(items)
                # get the first item off of the inventory
                self.u = Unit(self.i.next())
                # now while the inventory has more items to give us
                while self.i.has_next():
                        # make another generation of Units fed with the next item
                        self.u = self.u.spawn(self.i.next())
                # at the end, we become whatever the final Unit.spawn() gave us
                self.extend(self.u)

# if we're called on the command line
if __name__ == '__main__':
        import sys
        # we will permute the command line arguments
        permutables = sys.argv[1:]
        # if we got no arguments, default to this
        if not permutables:
                permutables = ["life", "the universe", "everything"]
        # do the work
        p = Permutations(permutables)
        # sort the result (a Permutation is just a fancy list, after all)
        p.sort()
        # and print it
        print p
        print p.stats()</pre>
