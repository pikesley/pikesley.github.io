---
title: Shedcam
github: pikesley/shedcam
tags: ["ruby", "raspberry-pi"]
---
Bought a [ZeroView](https://thepihut.com/products/zeroview) in order to make some time-lapse movies of [my garden](https://www.flickr.com/photos/pikesley/collections/72157661958355852/) next year. I found the recommended client software was (inevitably) [some Python thing](https://github.com/alexellis/phototimer), so I turned (inevitably) to Ruby

## Installing it

First, you're going to want a recent Ruby on your Pi (I'm currently on 2.4.2). I swear by [rbenv](https://github.com/rbenv/rbenv) these days, but I understand other methods are available. You'll also want a big SD card in the Pi, because the images are around 4 megs each. Then

```
git clone https://github.com/pikesley/shedcam
cd shedcam
bundle
bundle exec rake
```

## Configuring it

You should fill in your [latitude and longitude](https://github.com/pikesley/shedcam/blob/master/config/config.yml#L3-L4) (you can get them from an [Open Street Maps URL](https://www.openstreetmap.org/#map=18/51.50115/-0.14313)) for the Sunrise-Sunset API

The only other thing that's really worth tweaking is the [time-lapse interval](https://github.com/pikesley/shedcam/blob/master/config/config.yml#L1). The finest resolution available is 1 minute, because I'm using [whenever](https://github.com/javan/whenever) for scheduling, which is just a fancy wrapper around `cron`

Once you've set that, run

```
bundle exec rake schedule:update
```

to update the `crontab`. It should now start taking photos (as long as you're within [Astronomical Daylight](https://en.wikipedia.org/wiki/Twilight#Astronomical_twilight) at your location)...

## Running it

You'll want two terminals open, then

```
bundle exec rake run:sass
bundle exec rake run:app
```

and it should be running at [http://address.of.your.pi:9292](http://address.of.your.pi:9292)

## Actually installing it

To make it start at boot-time, run

```
rake app:install
```

which will put the necessary `systemd` start-up scripts in place

## Getting at the photos

It drops the photos into a directory called (by default) `timelapse-images`, with paths like

```
timelapse-images/2017/12/28/2017-12-28T13:53:16+00:00.jpg
```

so you ought to be able to `rsync` those out of there easily enough (I've not really thought that far ahead to be honest). Also, a quick back-of-a-fag-packet calculation suggest that running at full-res like this is going to generate 5 gigs of images per day. I might need to have a think about this...

## Making a movie

Get the images somewhere you have `ffmpeg` installed (I can very much recommended not doing this on the Pi), then try some magic spells that I've found effective:

```
ffmpeg -pattern_type glob -i "*.jpg" -c:v libx264 -vf fps=25 -pix_fmt yuv420p movie.mp4
```

## Next steps

* `raspistill` (the camera-control program at the heart of this) seems to have _a lot_ of options. Guess I should look into them
* You could obviously reverse-proxy the webserver with `nginx` if you were so inclined
