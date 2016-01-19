---
title: WTF Is My Generic Thing?
github: pikesley/wtfismygenericthing
---
Mostly an excuse for me to learn JavaScript TBH. See it in action [here](https://wtfismyblockchainstrategy.herokuapp.com/)

## How to use it

You should probably fork it first, then

    git clone http://github.com/you/wtfismygenericthing
    cd wtfismygenericthing
    bundle
    bundle exec rake

You'll want to do some customisation or it'll be a bit shit

### Data

There are some sample data files in [data](data/). The key ones are:

#### `headings.yml`

A list of titles, one of which will be randomly chosen. Probably something along the lines of

    headings:
      - Stop what you're doing and look at this, my blockchain strategy is

Note: EVERYTHING gets upcased when it's rendered, it's just easier that way

#### `templates.yml`

A list of skeletons for the robots to randomly select and then populate, with hilarious effect. Maybe

    templates:
      - to use @animals and @people to mine bitcoins

or similar

Note: those _@placeholder_ words are important, more later

#### `responses.yml`

One of these will be randomly picked as the text for the 'Give me another' link.

    responses:
      - this is shit, try again

you know the sort of thing

### Populate the templates

The rest of the data files will be used to randomly populate the templates. I've used the convention of one-file-per-list, but the code does not care TBH - you can mash them all into the same YAML file as long as they're namespaced like this

    animals:
      - dogs
      - cats

    people:
      - Edsger Dijkstra
      - Beyoncé

#### Repeated placeholders

You can have something like `@things and also @things` in a template, which will replace each occurrence with a different item from `things` _as long as there are enough items in `things` to cover the bet_. More on How Not To Fuck Things Up below

#### Recursive templates

It's perfectly cromulent to put _@placeholders_ in these lists, so you can have:

    things:
      - @adjective bananas

    adjective:
      - furry
      - straight

or whatever. In theory, this works to arbitrary depth ([the tests](https://github.com/pikesley/wtfismygenericthing/blob/00c571eaf9904a70720f663144993300f4b86887/spec/javascripts/wtfismygenericthing_spec.js#L86-L110) go 2 levels down, at least) but it will presumably explode in your face if you attempt to take the piss. Speaking of which:

### Caveats

I can think of at least these things that will make it not work:

* Nesting templates to stupid depths, as mentioned above
* Using a particular _@placeholder_ **more times than there are items in that list** - items are removed from the lists as they're subbed into the template. On that note:
* Using a _@placeholder_ **for which you have no items at all** - it blew up for me because of a stupid typo

#### Breaking the tests

Your customisations will have broken the tests, specifically [this Cuke](https://github.com/pikesley/wtfismygenericthing/blob/18ab719ae8174324883ac35a94d8e607d85e22c1/features/json.feature#L9) (yes, the app generates JSON underneath, all the fun stuff happens client-side). You may not really care, but you won't be able to get Travis to automatically deploy to Heroku with a failing test. The (terrible, but easy) solution is to copy-actual-to-expected (or delete that line) and just move along  

## Config

There's also a `config/config.yml`:

    title: Wtfismygenericthing

    #ga_tag: UA-1974-1

    github_corner:
      url: http://github.com/pikesley/wtfismygenericthing
      colour: '#fa8100'

    homepage:
      name: sam
      url: http://sam.pikesley.org

    bootswatch: flatly

* `title` is for the `<title>` tag
* `ga_tag` is for a Google Analytics tag, if you have one
* `github_corner` takes a URL and a hex colour for the _Fork me on Github_ thing
* `homepage` is for _your_ homepage and name, to go in the footer
* `bootswatch` is an entirely optional identifier for a Bootstrap theme from [Bootswatch](https://bootswatch.com/)

## Running it

You should be able to run it with

    bundle exec rackup

and then point your browser at [http://localhost:9292/](http://localhost:9292/). And it should deploy straight onto Heroku no bother

## Notes

As ever, I regret nothing
