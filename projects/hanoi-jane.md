---
title: Hanoi Jane
github: pikesley/hanoi-jane
---
_Counting in binary to solve the Towers of Hanoi_

## Surely there are easier ways to do this?

Yes, there are. This is very much a Solved Problem. However, I was inspired to implement this solution after watching [3 Blue 1 Brown](https://www.youtube.com/channel/UCYO_jab_esuFRV4b17AJtAw)'s [fascinating video](https://www.youtube.com/watch?v=2SUvWfNJSsM), in which Grant relates the Towers Of Hanoi to the Rhythm Of Counting In Binary:

[![Screenshot](https://i.imgur.com/mXsl57y.png)](https://www.youtube.com/watch?v=2SUvWfNJSsM)

## Running it

    bundle
    bundle exec rake
    bundle exec rake install
    hanoi console

## Constrained version

There is a [constrained variant of the problem](https://www.youtube.com/watch?v=bdMfjfT0lKk), with the restriction that a disc may only move to an adjacent stack. I've also implemented the solution for this (which maps to the Rhythm Of Counting In Ternary) - you can run this with

    hanoi --constrained

## API

To use it in your own code, try something like:

```ruby
➔ irb
irb(main):001:0> require 'hanoi/jane'
=> true
irb(main):002:0> towers = Hanoi::Jane::ConstrainedTowers.new 3
=> {:stacks=>[[2, 1, 0], [], []], :moves=>0, :flipped=>nil, :ternary=>"000"}
irb(main):003:0> towers.each { |state| puts state.inspect }
{:stacks=>[[2, 1, 0], [], []], :moves=>0, :flipped=>nil, :ternary=>"000"}
{:stacks=>[[2, 1], [0], []], :moves=>1, :flipped=>0, :ternary=>"001"}
{:stacks=>[[2, 1], [], [0]], :moves=>2, :flipped=>0, :ternary=>"002"}
<snip>
```
where `flipped` is the disc that was moved last

## pHAT

In order to over-engineer this, I've wrapped a [very thin Flask app](https://github.com/pikesley/pHAT-REST) around the [MicroDot pHAT](https://shop.pimoroni.com/products/microdot-phat). Try

    hanoi phat --phat <address_of_your_pi> --constrained

to watch this all [play out on the pHAT](https://www.youtube.com/watch?v=PAQY5XtdNO8):

[![Video](https://i.imgur.com/QILZYgx.png)](https://www.youtube.com/watch?v=PAQY5XtdNO8)
