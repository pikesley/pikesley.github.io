---
title: Hanoi Jane
github: pikesley/hanoi-jane
tags: ["ruby"]
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

(or just `gem install hanoi-jane`, of course)

## Constrained version

There is a [constrained variant of the problem](https://www.youtube.com/watch?v=bdMfjfT0lKk), with the restriction that a disc may only move to an adjacent stack. I've also implemented the solution for this (which maps to the Rhythm Of Counting In Ternary) - you can run this with

    hanoi console --discs 6 --constrained

## API

To use it in your own code, try something like:

```ruby
require 'hanoi/jane'

towers = Hanoi::Jane::ConstrainedTowers.new 2
towers.each do |state|
  puts state.inspect
end
```

which will give you:

```ruby
{:stacks=>[[1, 0], [], []], :moves=>0, :moved=>{:disc=>nil, :from=>nil, :to=>nil}, :ternary=>"00"}
{:stacks=>[[1], [0], []], :moves=>1, :moved=>{:disc=>0, :from=>0, :to=>1}, :ternary=>"01"}
{:stacks=>[[1], [], [0]], :moves=>2, :moved=>{:disc=>0, :from=>1, :to=>2}, :ternary=>"02"}
{:stacks=>[[], [1], [0]], :moves=>3, :moved=>{:disc=>1, :from=>0, :to=>1}, :ternary=>"10"}
{:stacks=>[[], [1, 0], []], :moves=>4, :moved=>{:disc=>0, :from=>2, :to=>1}, :ternary=>"11"}
{:stacks=>[[0], [1], []], :moves=>5, :moved=>{:disc=>0, :from=>1, :to=>0}, :ternary=>"12"}
{:stacks=>[[0], [], [1]], :moves=>6, :moved=>{:disc=>1, :from=>1, :to=>2}, :ternary=>"20"}
{:stacks=>[[], [0], [1]], :moves=>7, :moved=>{:disc=>0, :from=>0, :to=>1}, :ternary=>"21"}
{:stacks=>[[], [], [1, 0]], :moves=>8, :moved=>{:disc=>0, :from=>1, :to=>2}, :ternary=>"22"}
```
where `moved` is the disc that was moved last

## pHAT

In order to over-engineer this, I've wrapped a [very thin Flask app](https://github.com/pikesley/pHAT-REST) around the [MicroDot pHAT](https://shop.pimoroni.com/products/microdot-phat). Try

    hanoi phat --phat <address_of_your_pi> --interval 0.1

to watch this all [play out on the pHAT](https://www.youtube.com/watch?v=LT3HNsVxhM8):

[![Screenshot](https://i.imgur.com/yrK3isK.png)](https://www.youtube.com/watch?v=LT3HNsVxhM8)

## Gitpaint

Who hasn't, at some time in their life, wanted to play Towers of Hanoi on the Github commit-history graph? I've now built a [formatter](https://github.com/pikesley/hanoi-jane/blob/master/lib/hanoi/jane/formatters/github.rb) to generate output suitable for this - see [hanoi-painter](https://github.com/pikesley/hanoi-painter) for more on how it all works
