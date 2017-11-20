---
title: Towers of Hanoi
github: pikesley/towers-of-hanoi
---
_Counting in binary to solve the Towers of Hanoi_

## Surely there are easier ways to do this?

Yes, there are. This is very much a Solved Problem. However, I was inspired to implement this solution after watching [3 Blue 1 Brown](https://www.youtube.com/channel/UCYO_jab_esuFRV4b17AJtAw)'s [fascinating video](https://www.youtube.com/watch?v=2SUvWfNJSsM), in which Grant relates the Towers Of Hanoi to the Rhythm Of Counting In Binary:

[![Screenshot](https://i.imgur.com/mXsl57y.png)](https://www.youtube.com/watch?v=2SUvWfNJSsM)

In order to over-engineer this, I've wrapped a [very thin Flask app](https://github.com/pikesley/towers-of-hanoi/blob/master/webserver.py) around the pHAT, so that the interesting stuff can be built in Ruby

## Running it

```
make
```

to run the tests, and

```
make solve discs=n
```

to actually solve

Note that the output is kind of sideways, and that's because console output is not the real purpose of this - if you're running this on a Raspberry Pi with a [Micro Dot pHAT](https://shop.pimoroni.com/products/microdot-phat) attached, then try

```
sudo pip install -r requirements.txt
make phat
```

to watch this all play out on the pHAT:

<blockquote class="instagram-media" data-instgrm-version="7" style=" background:#FFF; border:0; border-radius:3px; box-shadow:0 0 1px 0 rgba(0,0,0,0.5),0 1px 10px 0 rgba(0,0,0,0.15); margin: 1px; max-width:658px; padding:0; width:99.375%; width:-webkit-calc(100% - 2px); width:calc(100% - 2px);"><div style="padding:8px;"> <div style=" background:#F8F8F8; line-height:0; margin-top:40px; padding:50.0% 0; text-align:center; width:100%;"> <div style=" background:url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACwAAAAsCAMAAAApWqozAAAABGdBTUEAALGPC/xhBQAAAAFzUkdCAK7OHOkAAAAMUExURczMzPf399fX1+bm5mzY9AMAAADiSURBVDjLvZXbEsMgCES5/P8/t9FuRVCRmU73JWlzosgSIIZURCjo/ad+EQJJB4Hv8BFt+IDpQoCx1wjOSBFhh2XssxEIYn3ulI/6MNReE07UIWJEv8UEOWDS88LY97kqyTliJKKtuYBbruAyVh5wOHiXmpi5we58Ek028czwyuQdLKPG1Bkb4NnM+VeAnfHqn1k4+GPT6uGQcvu2h2OVuIf/gWUFyy8OWEpdyZSa3aVCqpVoVvzZZ2VTnn2wU8qzVjDDetO90GSy9mVLqtgYSy231MxrY6I2gGqjrTY0L8fxCxfCBbhWrsYYAAAAAElFTkSuQmCC); display:block; height:44px; margin:0 auto -44px; position:relative; top:-22px; width:44px;"></div></div><p style=" color:#c9c8cd; font-family:Arial,sans-serif; font-size:14px; line-height:17px; margin-bottom:0; margin-top:8px; overflow:hidden; padding:8px 0 7px; text-align:center; text-overflow:ellipsis; white-space:nowrap;"><a href="https://www.instagram.com/p/Bbrs3diAw1B/" style=" color:#c9c8cd; font-family:Arial,sans-serif; font-size:14px; font-style:normal; font-weight:normal; line-height:17px; text-decoration:none;" target="_blank">A post shared by Sam (@pikesley)</a> on <time style=" font-family:Arial,sans-serif; font-size:14px; line-height:17px;" datetime="2017-11-19T16:04:50+00:00">Nov 19, 2017 at 8:04am PST</time></p></div></blockquote> <script async defer src="//platform.instagram.com/en_US/embeds.js"></script>

## Constrained version

There is a [constrained variant of the problem](https://www.youtube.com/watch?v=bdMfjfT0lKk), with the restriction that a disc may only move to an adjacent stack. I've also implemented the solution for this (which maps to the rhythms of ternary) - you can run this with

```
make solve-constrained discs=n
```

(this is now the default mode for `make phat`)

## Fake pHAT mode

The Flask webserver attempts to detect if it's running on a Pi, and if it thinks it's not then it will log an ASCII rendition of the pHAT matrix on the console:

```
.....   .....   .....   .....   ooo..   .o...
.....   .....   .....   .....   o.o..   .o...
.....   .....   .....   .....   ooo..   .o...
.....   .....   .....   .....   .....   .....
.ooo.   .....   .....   ..ooo   ..ooo   ..ooo
oooo.   .....   .....   ..o.o   ..o.o   ..o.o
ooooo   .oo..   ..o..   ..ooo   ..ooo   ..ooo
```

this may or may not be useful (I'm not sure any of this is useful tbh)
