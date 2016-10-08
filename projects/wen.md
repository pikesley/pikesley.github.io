---
title: Wen
github: pikesley/wen
---
_A RESTful clock because why not?_

This story begins with a man named [Frank Howarth](https://www.youtube.com/user/urbanTrash). I've spent a _lot_ of time over the last few years, obsessively watching woodturning videos by Frank and others, and then earlier this year I went on a [woodturning course](http://www.axminsterskillcentre.co.uk/course/Beginners-Woodturning-2-days-1.htm) (with my friend [Chris](https://twitter.com/elsmorian)), where I [used a lathe for the first time](https://www.flickr.com/photos/pikesley/albums/72157665435637176). I came back sufficiently enthused that my girlfriend bought me [a mini-lathe](http://www.chronos.ltd.uk/acatalog/copy_of_Lathes___Accessories.html) for my birthday, and I've spent most weekends since then turning nightlight holders and other things in the garden.

## Everything is a circle

When all you have is a lathe, everything you make is round. It occurred to me that I might be able to fashion a clock, using some [Neopixel rings](https://shop.pimoroni.com/products/adafruit-neopixel-ring-24-x-rgb-led-w-integrated-drivers) for the dials, and driven by a [Raspberry Pi](https://www.raspberrypi.org/products/pi-zero/). So I turned a simple clock body out of a maple disc, bought some Neopixels and a Pi Zero, and this is what I came up with...

## The hardware

I was given to understand, from reading the specs, that a Pi would not be able to handle the timing requirements of the Neopixels, and I would need an [Arduino](https://www.arduino.cc/en/Main/ArduinoBoardUno) in between Pi and pixels. However, after a conversation with [Chris](https://twitter.com/elsmorian) at a [very weird bar in South London](http://www.doitinlondon.co.uk/en/drink-and-food/little-nans-tropical-den-le-cocktail-bar-vient-se-nicher-a-peckham-19456) I discovered that there is [at least one PWM pin on a Pi](http://raspberrypi.stackexchange.com/questions/298/can-i-use-the-gpio-for-pulse-width-modulation-pwm) have enough grunt to drive the Neopixels, and that even better, there's a [Ruby Gem](https://github.com/TwP/pixel_pi) - no Arduino required.

### Wiring it up

![schematic](http://svgur.com/i/DQ.svg)

It turns out you can chain the Neopixels together and then address them as one long string of lights, so I ran a wire from Physical Pin 12 (which appears as Pin 18 to the client for reasons I don't fully understand but have [ranted about elsewhere](https://www.youtube.com/watch?v=Dyg5tzi-H4s&feature=youtu.be&t=34m40s)) to _Data In_ on the big ring, and then from its _Data Out_ to _Data In_ on the little one. The box marked _5v_ there is just an old USB cable into which I spliced some wires to power the rings and the Pi, and it all seems to work just fine.

## Software

### Installation

The code is, of course [on Github](https://github.com/pikesley/wen). To get it up and running from a clean install of [NOOBS](https://www.raspberrypi.org/downloads/noobs/) 1.9 on a Pi Zero, the steps are:

    sudo apt-get update
    sudo apt-get upgrade
    sudo dpkg --purge nano
    sudo apt-get install vim ruby2.1-dev redis-server
    sudo gem install bundle
    git clone https://github.com/pikesley/wen.git
    cd wen/
    bundle
    sudo bundle exec foreman export systemd -u pi -a wen /etc/systemd/system/
    sudo systemctl enable wen.target
    sudo cp scripts/timekeeper.service /etc/systemd/system/
    sudo systemctl enable timekeeper.service
    echo "alias rewen='cd ~/wen && git pull && bundle && sudo systemctl restart wen.target'" >> ~/.bash_profile

    sudo reboot
    
This sets up _everything_, including the [systemd](https://wiki.debian.org/systemd) startup scripts, and a shell alias called `rewen` which checks out the latest code from Github and restarts the service.


