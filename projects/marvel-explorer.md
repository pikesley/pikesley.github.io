---
title: Marvel Explorer
github: marvelexplorer/marvel_explorer
---
Uses my [Ultron](http://pikesley.org/projects/ultron) gem to wander from character to character through the [Marvel Comics Data](http://developer.marvel.com/) and drive the [Twitter stream](https://twitter.com/marvel_explorer) and the [Website](http://marvelexplorer.github.io/). You need to set some things up in `~/.marvel_explorer/config.yml`:

    twitter:
      consumer:
        key:    a_key
        secret: a_secret
      oauth:
        token:  a_token
        secret: a_nuvver_secret

    marshal_file: /home/marvelexplorer/.marvel_explorer/last.character
    jekyll_dir:   /home/marvelexplorer/marvelexplorer.github.io/

You also need some [Ultron configuration](https://github.com/pikesley/ultron/blob/master/README.md) in `~/.ultronrc`:

    PUBLIC_KEY: this_r_public_key
    PRIVATE_KEY: this_one_r_private_key

Available commands are:

    marvel_explorer update

Gets the next iteration of '_Character A_ appeared in _Comic_ with _Character B_'. Writes YAML into `jekyll_dir` for use by my [Marvel Explorer Jekyll site](https://github.com/marvelexplorer/marvelexplorer.github.io)

    marvel_explorer tweet

Generates and publishes a [Tweet](https://twitter.com/marvel_explorer) (and see [this](http://dghubble.com/blog/posts/twitter-app-write-access-and-bots/) for help with making Twitter bots)

    marvel_explorer publish

Commits and pushes the Jekyll site to Github Pages

    marvel_explorer ranking

Calculates most-featured-characters data, writes YAML for Jekyll site

    marvel_explorer perform

All four of the above tasks
