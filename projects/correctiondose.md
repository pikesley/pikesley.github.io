---
title: Correction Dose
github: pikesley/correctiondose
---
Diabetes tracker app, optimised for mobile. Specifically _my_ mobile. See some screenshots [here](https://github.com/pikesley/correctiondose/blob/master/SCREENSHOTS.md)

## Tracking metrics

It records Blood Glucose, Medication, Carbs etc. It will plot a graph of Blood Glucose over time (with more graphs coming soon), for any time period you like

### Hard-coded things

As pointed out above, this app is optimised for _me_. This means that the Medication model, for example, has [my two Insulins](https://github.com/pikesley/correctiondose/blob/25b4c5c7e2391fe263dc0cea1ae79ce7624771d7/app/models/medication_event.rb#L8-L13) hard-coded into it. This is trivial to change, but it works for me this way. It also means there is _one user across the whole app_. Again, this works for me

## API

It has a POST API which will [accept the XML export](https://github.com/pikesley/correctiondose/blob/25b4c5c7e2391fe263dc0cea1ae79ce7624771d7/lib/ontrack/importer.rb) from my previous app-of-choice, [OnTrack](https://play.google.com/store/apps/details?id=com.gexperts.ontrack&hl=en_GB). This means that if I'm offline, I can still record data in OnTrack like some sort of caveman, then export it later to be picked up here

I presume other apps also export their data, and it should be easy to write importers for them

It also exposes GETtable JSON endpoints for each of the metrics, if you're into that sort of thing

## Installing it

This is not a one-click thing: you'll need some strong Heroku- and Github-fu to get it up and running

**Oh wait I just found out about Heroku Buttons. This might be awesome**

## Your questions, asked and answered

### Why isn't it fully-configurable for _{specific use-case}_

Because I really don't know what anybody else's use-case looks like. It's difficult to know what not to hard-code when your user-research consists of one person. Let me know, maybe we can make it work for you

### Why don't you offer this as a hosted service?

Because hosting other people's medical data is really the very last thing I want to do

## What's next?

I'm going to add a few more metrics (_weight_ is one that immediately springs to mind). I also have a longer-term plan to have the app calculate Insulin doses for me, based on what I learned from my carb-counting course. This will require upping my Rails game considerably, though (building this app has mostly been an excuse for me to finally learn Rails)
