---
title: Wen, the eternally surprised
github: pikesley/wen
tags: ["ruby", "d3"]
---
_Building a clock out of Maple, Pi and Ruby_

This story begins with a man named [Frank Howarth](https://www.youtube.com/user/urbanTrash). I've spent a _lot_ of time over the last few years, obsessively watching woodturning videos by Frank and others, and then earlier this year I went on a [woodturning course](http://www.axminsterskillcentre.co.uk/course/Beginners-Woodturning-2-days-1.htm) (with my friend [Chris](https://twitter.com/elsmorian)), where I [used a lathe for the first time](https://www.flickr.com/photos/pikesley/albums/72157665435637176). I came back sufficiently enthused that my girlfriend bought me [a mini-lathe](http://www.chronos.ltd.uk/acatalog/copy_of_Lathes___Accessories.html) for my birthday, and I've spent most weekends since then turning nightlight holders and other things in the garden.

## Everything is a circle

When all you have is a lathe, everything you make is round. It occurred to me that I might be able to fashion a clock, using some [Neopixel rings](https://shop.pimoroni.com/products/adafruit-neopixel-ring-24-x-rgb-led-w-integrated-drivers) for the dials, and driven by a [Raspberry Pi](https://www.raspberrypi.org/products/pi-zero/). So I bought some Neopixels and a Pi Zero, turned a simple clock body out of a maple disc, and this is what I came up with...

## The hardware

I was given to understand, from reading the specs, that a Pi would not be able to handle the timing requirements of the Neopixels, and I would need an [Arduino](https://www.arduino.cc/en/Main/ArduinoBoardUno) in between Pi and pixels. However, after a conversation with [Chris](https://twitter.com/elsmorian) at a [very weird bar in South London](http://www.doitinlondon.co.uk/en/drink-and-food/little-nans-tropical-den-le-cocktail-bar-vient-se-nicher-a-peckham-19456) I discovered that there is [at least one PWM pin on a Pi](http://raspberrypi.stackexchange.com/questions/298/can-i-use-the-gpio-for-pulse-width-modulation-pwm) with enough grunt to drive the Neopixels, and that even better, there's a [Ruby Gem](https://github.com/TwP/pixel_pi). So, no Arduino required.

### Wiring it up

![schematic](http://svgur.com/i/DQ.svg)

It turns out you can chain the Neopixels together and then address them as one long string of lights, so I ran a wire from Physical Pin 12 (which appears as Pin 18 to the client for reasons I don't fully understand but have [ranted about elsewhere](https://www.youtube.com/watch?v=Dyg5tzi-H4s&feature=youtu.be&t=34m40s)) to _Data In_ on the big ring, and then from its _Data Out_ to _Data In_ on the little one. The box marked _5v_ there is just an old USB cable into which I spliced some wires to power the rings and the Pi, and it all seems to work just fine.

## Software

### Installation

The code is all [on Github](https://github.com/pikesley/wen). To get it up and running from a clean install of [NOOBS](https://www.raspberrypi.org/downloads/noobs/) 1.9 [Raspbian Jessie Lite](https://www.raspberrypi.org/downloads/raspbian/) on a Pi Zero, you should look at [my Chef cookbook](http://sam.pikesley.org/cookbooks/)

To play with it locally, you'll need `redis-server` running, then 3 different processes in a terminal each:

* `bundle exec rake run:queue`
* `bundle exec rake run:sass`
* `bundle exec rake run:app`

and it should be live at [http://localhost:9292](http://localhost:9292)

### Internals

Getting a computer to tell you the time is very easy: in [Ruby](https://www.ruby-lang.org/en/), we just do `DateTime.now` and there it is. Translating that into lighting the correct lights on a string of LEDs is slightly more challenging, but not much, and I had a crude script working in about an hour. But I quickly fell into the over-engineering rabbit hole, so here's what I have now:

#### Two rings, with two hands

The inner, _hour_ ring has 12 pixels, which is the correct number of pixels for an hour ring to have, and conceptually, _Wen_ thinks about it as having a _hand_ (the single pixel which indicates the hour) and a _face_, the other 11 pixels. The outer _minutes_ ring, however, has 24 pixels, which is a little trickier to deal with: a single pixel accounts for 2.5 minutes of actual time, and lighting just that one light to indicate the minutes didn't really work very well. My strategies for dealing with this are [explained below](#clock-modes).

It should be noted that 60-pin Neopixels [do exist](https://www.adafruit.com/product/1768) but they're too big to mount on anything I'd be able to turn on my mini-lathe. I might make one out of concrete, though...

#### _Everything_ gets a RESTful API eventually

Why the hell does a clock need a RESTful API? Well, here's how I justified it to myself: my first script ran a `while true` loop, updating the LEDs every 10 seconds, which worked OK, but then I started thinking about how I might be able to get the clock to show patterns and so on, and because of the way my mind works now, I reached for [Sinatra](http://www.sinatrarb.com/) (via my [Skellington](http://sam.pikesley.org/projects/skellington/) gem) and started wrapping some HTTP around everything.

So it now has four main endpoints:

##### `/colours`

If you hit this with a **GET** and an _Accept: text/html_ header (i.e. with a browser), it returns a colour picker

![colour picker](http://i.imgur.com/FGMIVEk.png)

(which I lashed together with [Spectrum](https://bgrins.github.io/spectrum/) and some [poorly-written](https://github.com/pikesley/wen/blob/master/views/colours.erb) [d3](https://github.com/pikesley/wen/blob/master/public/js/wen.js))

It also  _Accepts_ a **POST** with some JSON like

    {
      hours: {
        hand:
          [0, 255, 0]
        }
      }    
    }

to change the colour of the specified clock element (this is what the jQuery does behind the picker). There's also a sub-endpoint

###### `/colours/:wheel/:layer`

which you can **GET** to return the current colour of the specified element:

    {
      colour: [127, 0, 255]
    }

(this is used for populating the picker)

##### <a id='clock-modes'></a>`/modes`

This with a **GET** and _Accept: text/html_ returns the clock-mode picker:

![clock modes](http://i.imgur.com/BIoSJNs.png)

The available modes are:

* `range`: the minute lights accumulate around the clock throughout the hour, then reset to zero
* `vague`: the lights on either side of the principal pin are illuminated
* `strict`: only the principal pin is illuminated

A **GET** with _Accept: application/json_ will return the current mode:

    {
      mode: "range"
    }

It also accepts a **POST** with some JSON:

    {
      mode: "vague"
    }

to set the mode (which is what the jQuery does, behind the buttons)        

##### `/tricks`

If you hit _this_ with a browser, it will return a list of available trick modes:

![trick modes](http://i.imgur.com/6t7uA9Q.png)

It also _Accepts_ a **POST** with some JSON like

    {
      mode: 'shuffle'
    }

##### `/time`

A (empty) **POST** to this causes the clock to show the current time, and this is how the clock actually works: [this systemd config](https://github.com/pikesley/cookbooks/blob/gh-pages/wen-deploy/templates/default/timekeeper.service.erbe) calls [this cURL script](https://github.com/pikesley/wen/blob/master/scripts/hit-clock.sh) which hits this URL every 10 seconds.

All of these **POST** requests then get pushed onto the [Sidekiq](http://sidekiq.org/) queue for asynchro...

#### Wait, there's a queue in here too?

How else would you do this? The [ClockWorker](https://github.com/pikesley/wen/blob/master/lib/wen/clock_worker.rb) pulls the jobs off the queue and throws them at the [Clock](https://github.com/pikesley/wen/blob/master/lib/wen/clock/clock.rb) class, which passes them to the [Neopixels](https://github.com/pikesley/wen/blob/master/lib/wen/clock/neopixels.rb) singleton, which talks to PixelPi, which does some PWM magic to make the lights come on. I'm actually genuinely amazed at how much bullshit a 4 quid, 15-square-cm computer can handle.

## What else?

This is definitely a prototype: I can certainly turn a better clock body, and there's always room to improve code...

## There's a movie, too

It's a bit out of date now, but:

[![Wen, the Movie](http://i.imgur.com/GmuLpRC.png)](https://youtu.be/FGRnSwF10Dw)
