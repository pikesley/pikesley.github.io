---
title: Potado
github: pikesley/potado
tags: ["python", "tado", "docker", "home-automation"]
---
_A robot to simplify setting the [Tado](https://www.tado.com/gb/) heating schedule_

We've had a Tado [smart thermostat](https://www.tado.com/gb/products/smart-thermostat-starter-kit) for a couple of years, but we recently got some of the [radiator robots](https://www.tado.com/gb/products/smart-radiator-starter-kit) which means setting the schedule(s) is now a lot more tedious. So, I made this

## Using it

It's easiest to run it as a Docker container. So:

```
git clone https://github.com/pikesley/potado
cd potado
make build
```

### Credentials

To do anything useful, you need to

```
cp potado/conf/credentials-example.yaml potado/conf/credentials.yaml
```

and fill in your Tado username, password, and client secret (which doesn't seem to change and can be found [here](https://my.tado.com/webapp/env.js)), and

```
cp potado/conf/settings-example.yaml potado/conf/settings.yaml
```

and sweeten to taste

At this point, you have three choices:

### Prepare the default schedules

All of this relies on you having set up the Tado [Zones](https://community.tado.com/en-gb/discussion/859/create-zones) when your equipment was being fitted. Presuming this is true, then running

```
make init
```

will fire up the Docker container, gather up your zone names, and dump a dummy schedule at `potado/conf/schedule-default.yaml`. Note that this is a _terrible schedule_ and I don't recommend applying it as-is, but it provides a good starting-point. Presuming you're starting from scratch, then

```
cp potado/conf/schedule-default.yaml potado/conf/schedule.yaml
```

and fill it in. The `potado/conf/schedule-example.yaml` file has some comments in it which might help

#### A note about temperatures and periods

Potado will fill in any gaps in your schedule with `mode: ambient` periods, which resolves to whatever you have as `temperatures.ambient` in `potado/conf/settings.yaml` (16 Celsius in my case). We have to do this because the API gets very unhappy if we try to submit a schedule that does not cover a full 24 hours. It also doesn't like periods shorter than 15 minutes (don't ask how I found this out)

I've got it set up so my active periods use `mode: warm`, which equates to 23 Celsius, but you can get as fancy as you want with these - see `potado/conf/settings-example.yaml` for some examples, but be aware that your Tado will only honour temperatures between 5 and 25 degrees

### Apply the schedules

Once you've got the schedules set up the way you want, then to actually set them, do

```
make schedule
```

### Get on the container

If you want to run the tests or something, then try

```
make run
```

to get a shell on the container (with `potado` mounted at `/opt/potado)

Then do

```
make
```

to run the tests

## Tado's API

I've made some Choices here. In particular I've assumed that we want the same schedule on each weekday, then probably something different on the weekend, which fits with Tado's `THREE_DAY` timetable type (which recognises `MONDAY_TO_FRIDAY`, `SATURDAY` and `SUNDAY`). All together, Potado supports

* `mon-fri`
* `saturday`
* `sunday`
* `weekend` (expands to `saturday` and `sunday`)
* `all` (expands to `mon-fri`, `saturday` and `sunday`)

See `potado/conf/schedule-example.yaml` for more on this. It shouldn't be too hard to support the two other timetable types (`ONE_DAY` and `SEVEN_DAY`) if anybody wants to have a crack at some of my Python

In general, the API seems to be powerful but very undocumented. I am eternally grateful to [Terence Eden](https://shkspr.mobi/blog/2019/02/tado-api-guide-updated-for-2019/) and [Stephen Phillips](http://blog.scphillips.com/posts/2017/01/the-tado-api-v2/) for working out at least some of how this all works

## Why have you done this?

Have you met me? Also, because trying to set such a large number of schedules on the fiddly little mobile app is awful. And as an excuse to learn some better Python testing techniques (and I'm pretty sure I've still not fully understand Python mocking)

## At this point, wouldn't it have been quicker to just suck it up and set the schedules on the app?

Yes. Yes it would
