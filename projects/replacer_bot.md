---
title: Replacer Bot
github: pikesley/replacer_bot
---

Twitter bot that:

* Searches Twitter for a phrase
* Search-and-replaces phrases in the tweets
* Tweets them

## Installation

    gem install replacer_bot

or

    git clone https://github.com/pikesley/replacer_bot
    cd replacer_bot
    bundle
    rake install

## Configuration

The default config is [here](https://github.com/pikesley/replacer_bot/blob/master/config/defaults.yml), you'll want to create your own config at `~/.replacer_bot/config.yml` to override some of these, something like:

    search_term: David Cameron
    replacements:
      - david cameron: "Satan's Little Helper"
      - cameron: Satan
    save_file: /Users/sam/.replacer_bot/last.tweet

Note:

* The search-and-replace terms will be applied in the order listed, which you may or may not care about

You'll also need some Twitter credentials, store them in `~/.replacer_botrc` like this:

    CONSUMER_KEY: some_key
    CONSUMER_SECRET: some_secret
    TOKEN: oauth_token
    SECRET: oauth_secret

(and see [this](http://dghubble.com/blog/posts/twitter-app-write-access-and-bots/) for help on setting up Twitter bots)

## Running it

You should now be able to do run it like so:

    ➔ replacer tweet
    Tweeting: Satan's Little Helper sets out academy 'vision' for every school http://t.co/S6yFWRf7pD
    Sleeping 60 seconds
    Tweeting: Swarm warning: Satan's Little Helper accuses migrants of 'breaking in' to UK http://t.co/1sB5J8Alwi

There's also a `dry_run` command, which shows you what it would have tweeted
