---
title: Shedcam
github: pikesley/shedcam
tags: ["ruby", "raspberry-pi"]
---
Bought a [ZeroView](https://thepihut.com/products/zeroview) in order to make some time-lapse movies of [my garden](https://www.flickr.com/photos/pikesley/collections/72157661958355852/) next year. I found the recommended client software was (inevitably) [some Python thing](https://github.com/alexellis/phototimer), so I turned (inevitably) to Ruby

The default configuration assumes you're running it on a pair of Pis: a Zero with the camera attached, and an archive Pi elsewhere with a big external drive attached. But maybe your setup allows you to connect your external drive directly to the Zero. Or you might want to use your laptop for archiving. Whatever. You're a smart person, you can work it out

## Installing it

First, you're going to want a recent Ruby on your Pi(s) (I'm currently on 2.4.2). I swear by [rbenv](https://github.com/rbenv/rbenv) these days, but I understand other methods are available. You'll also want a big SD card in the primary Pi, because you're going to be storing a lot of images

Oh, you'll also need to [configure the camera](https://www.raspberrypi.org/documentation/configuration/camera.md) (and actually have a camera attached, of course)

Then

```
git clone https://github.com/pikesley/shedcam
cd shedcam
bundle
bundle exec rake
```

## Configuring it

You should fill in your [latitude and longitude](https://github.com/pikesley/shedcam/blob/master/config/config.yml#L3-L4) (you can get them from an [Open Street Maps URL](https://www.openstreetmap.org/#map=18/51.50115/-0.14313)) for the Sunrise-Sunset API

The only other thing that's really worth tweaking is the [time-lapse interval](https://github.com/pikesley/shedcam/blob/master/config/config.yml#L1). The finest resolution available is 1 minute, because I'm using [whenever](https://github.com/javan/whenever) for scheduling, which is just a fancy wrapper around `cron`

### Schedules

Once you've set that, on the primary Pi run

```
bundle exec rake schedule:shedcam
```

to update the `crontab`. It should now start taking photos (as long as you're within [Astronomical Daylight](https://en.wikipedia.org/wiki/Twilight#Astronomical_twilight) at your location)...

And on the archive Pi

```
bundle exec rake schedule:archive
```

to activate the nightly `rsync` of the images

## Running it (primary Pi only)

You'll want two terminals open, then

```
bundle exec rake run:sass
bundle exec rake run:app
```

and it should be running at [http://address.of.your.pi:9292](http://address.of.your.pi:9292)

## Actually installing it (also primary Pi only)

To make it start at boot-time, run

```
bundle exec rake app:install
```

which will put the necessary `systemd` start-up scripts in place

## Getting at the photos

It drops the photos into a directory called (by default) `timelapse-images`, with paths like

```
timelapse-images/2017/12/28/20171228T135316.jpg
```

To pull them onto your archive server, you first need to share your ssh keys:

```
bundle exec rake ssh:send_keys
```

then pull the data across within

```
bundle exec rake data:sync
```

(this is what gets dropped into the `crontab` when you `bundle exec rake schedule:archive
`)

Having run it for a few days in deepest December, it's been shooting for just about 12 hours, and laying down about 2 gigs of photos, per day. With my 64 gig SD card, I reckon I can hold about 3 weeks' worth of data at a time. A _very_ back-of-a-fag-packet calculation tells me I'm going to capture about a Terabyte of data over a whole year though

## Making a movie

Get the images somewhere you have `ffmpeg` installed (I can very much recommended not doing this on a Pi), then try some magic spells that I've found effective:

```
ffmpeg -pattern_type glob -i "*.jpg" -c:v libx264 -vf fps=25 -pix_fmt yuv420p movie.mp4
```

## Next steps

* `raspistill` (the camera-control program at the heart of this) seems to have _a lot_ of options. Guess I should look into them
* You could obviously reverse-proxy the webserver with `nginx` if you were so inclined
