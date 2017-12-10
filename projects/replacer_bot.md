---
title: Replacer Bot
github: pikesley/replacer_bot
tags: ["ruby"]
---
Twitter bot that:

* Searches Twitter for a phrase
* Search-and-replaces phrases in the tweets
* Tweets them
* Makes a note of the last tweet found so it knows where to start from next time

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
    seen_tweets: /Users/sam/.replacer_bot/seen.tweets

Notes:

* The search-and-replace terms will be applied in the order listed, which you may or may not care about
* The search and replace has a number of passes based on some of my finger-in-the-air Reckons, which are probably easiest to understand via the [specs](https://github.com/pikesley/replacer_bot/blob/master/spec/lib/replacer_bot/case_spec.rb). After it tries each of these search-and-replace operations, it does a case-insensitive regex search-and-replace using the raw terms from the YAML (in order to catch SHittily-typeD things, because Twitter is a mess)
* Your takeaway from this should be that if your replacement is a name or whatever, put it in the YAML Titlecased, otherwise lowercase it, and it should do the Right Thing

### Twitter credentials

You'll also need some Twitter credentials, store them in `~/.replacer_botrc` like this:

    CONSUMER_KEY: some_key
    CONSUMER_SECRET: some_secret
    TOKEN: oauth_token
    SECRET: oauth_secret

(and see [this](http://dghubble.com/blog/posts/twitter-app-write-access-and-bots/) for help on setting up Twitter bots)

## Running it

You should now be able to run it like so:

    ➔ replacer tweet
    Tweeting: Satan's Little Helper sets out academy 'vision' for every school http://t.co/S6yFWRf7pD
    Sleeping 60 seconds
    Tweeting: Swarm warning: Satan's Little Helper accuses migrants of 'breaking in' to UK http://t.co/1sB5J8Alwi

Notes:

* Direct replies and manual retweets are excluded

There's also

    ➔ replacer dry_run

which does the search and shows what it would have tweeted, without actually tweeting anything

## Reducing the noise

It turns out that a lot of Twitter is people (or bots) retweeting the same stuff with minimal changes, like adding extra hashtags or using a different URL shortener (I don't really understand how this even happens, but whatever). (Actually, I wonder how much of Twitter is just bots yelling at each other in the void. But I digress.) This makes a crude 'search for this phrase' bot _extremely_ noisy, so I have come up with some Opinions based on some very crude Reckons. Things that will make the bot consider tweets to be 'the same' as tweets we've seen before, and therefore ignorable, are:

* They match, save for any URLs they contain being different
* They match, save for different hashtags at the _start_ and _end_ of the tweet (hashtags in the body of the tweet appear to be more relevant, based on my Reckons)

The above reduced the noise a bit, but not enough to make a substantial difference. So I came up with this:

* If there is an overlap of 4 consecutive words between this tweet and one we've seen before, we ignore it

The 4 words thing is tunable in `config.yml`:

    similarity_weighting: 4

but 4 seems about right for my current use case; it will clearly depend on the popularity of your search term
