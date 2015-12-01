---
title: Purdie
github: rawfunkmaharishi/purdie
---

[My band](http://rawfunkmaharishi.uk) has music on SoundCloud, photos on Flickr, and videos on Vimeo, and we want to feature them on [http://rawfunkmaharishi.uk/](http://rawfunkmaharishi.uk/). Up until now, this has been managed by curating, by hand (or [very shonky scripts](https://github.com/rawfunkmaharishi/rawfunkmaharishi.github.io/blob/master/flickriser.rb)), [bits](https://github.com/rawfunkmaharishi/rawfunkmaharishi.github.io/blob/master/_data/sounds.yml) [of](https://github.com/rawfunkmaharishi/rawfunkmaharishi.github.io/blob/master/_data/pictures.yml) [YAML](https://github.com/rawfunkmaharishi/rawfunkmaharishi.github.io/blob/master/_data/videos.yml) to feed into Jekyll, but this gets old quickly, especially when you run into things like SoundCloud's decision to only expose the track ID deep inside the embeddable iframe code.

But this is dumb. It's 2015 and everything has an API, so let's build a robot to do this stuff properly!

##The great metadata shift

Up until now, the Hand-Crafted YAML (which sounds like a thing you may be able to buy at Boxpark) approach has allowed me to be a bit lax with the metadata for our media - some of it's been stored on the various services, some purely in my YAML. In order to make this robot universal, I've had to fill in all the metadata at the places where the files live, which feels like the Right Thing anyway.

###Moving the hacks upstream

Moving the metadata is not 100% foolproof, however: for example, we have photos on [our Flickr account](https://www.flickr.com/photos/rawfunkmaharishi/) which were not taken by us, but by our friend [Kim](http://www.kimberlycabbott.com/). But the Flickr API has no way of knowing this, so I've added a tag to those pictures which looks like `photographer:kim` and then I'm looking for and extracting that in this gem. Similarly, for the SoundCloud music, I'd like to tag them with a recording location (and now an engineer's name) but this is not supported, so I'm nailing those into the _Description_ field as something YAML-ish.

Am I going to regret these decisions? Almost certainly.

##Using it

###Installation

    gem install purdie

or

    git clone https://github.com/rawfunkmaharishi/purdie/
    cd purdie
    bundle
    rake
    rake install

###Configuration

You need to create a *_sources* directory in your Jekyll project, containing files with one-URL-per-line, like this:

    https://soundcloud.com/rawfunkmaharishi/hexaflexagon-1
    https://soundcloud.com/rawfunkmaharishi/junalbandi-3

It also resolves sets/albums on all of the supported services, so this kind of thing will work:

    https://www.flickr.com/photos/pikesley/sets/72157648589429938/

####Notes about *_sources*:

* Purdie maps each input file onto an output file, replacing any extension with _.yaml_, something like:
  * \_sources/flickr.csv -> \_data/flickr.yaml
  * \_sources/pictures.source -> \_data/pictures.yaml
  * \_sources/soundcloud.sounds -> \_data/soundcloud.yaml
  * \_sources/vimeo -> \_data/vimeo.yaml

* Mixing up different services in the same input file makes no sense to Purdie. Don't do this
* If a URL appears multiple times in a resolved list, only the first appearance will be propagated to the output file

You also need a *.env* file with the relevant credentials in it:

    FLICKR_API_KEY: this_a_key
    FLICKR_SECRET: this_a_secret

    SOUNDCLOUD_CLIENT_ID: this_a_client_id

    VIMEO_BEARER_TOKEN: this_is_bearer_token

    YOUTUBE_API_KEY: this_is_key_for_youtube

(get those things from [Flickr](https://www.flickr.com/services/apps/create/apply), [SoundCloud](http://soundcloud.com/you/apps/new), [Vimeo](https://developer.vimeo.com/apps/new) and [YouTube](https://console.developers.google.com/project))

And then you can run

    purdie fetch

(`fetch` is the default task (in fact currently the only task), so just `purdie` will work) and it will dump out YAML files into *_data*:

    flickr.yaml
    pictures.yaml
    soundcloud.yaml
    vimeo.yaml

ready for Jekyll to consume.

###Customisation

You can supply your own *_config/purdie.yaml* file to specify a few things:

    # Flickr photos are happy to have a null title
    default_title: Raw Funk Maharishi

    # Map Flickr users to better names
    photographer_lookups:
      pikesley: sam

    # Specify output files per-service
    services:
      Flickr:
        output_file: "_outfiles/photos.yaml"

(see [this](https://github.com/rawfunkmaharishi/purdie/blob/master/_config/defaults.yaml) for some other things you can tweak)

###Caveats

Tread carefully for now, because my metadata hacks aren't fully documented, and I may have inadvertently nailed-in some Raw Funk Maharishi-specific stuff (although I've tried hard not to).

##What next?

There's no reason I couldn't support other services - I've already added [YouTube](https://github.com/rawfunkmaharishi/purdie/blob/master/spec/services/youtube_spec.rb) [support](https://github.com/rawfunkmaharishi/purdie/blob/master/lib/purdie/services/youtube.rb) and others should be fairly simple. There's some introspection magic at the heart of all of this which means that as long as each service is represented by a class that:

* includes the `Purdie::Service` module, and
* sports a `::matcher` class method which returns a string which will pick a URL out of an input file, and
* has a `#distill` method which takes a URL representing an item on the service and returns a hash of metadata, see e.g.
  * [Flickr](https://github.com/rawfunkmaharishi/purdie/blob/master/lib/purdie/services/flickr.rb)
  * [SoundCloud](https://github.com/rawfunkmaharishi/purdie/blob/master/lib/purdie/services/soundcloud.rb)
  * [Vimeo](https://github.com/rawfunkmaharishi/purdie/blob/master/lib/purdie/services/vimeo.rb)
* and optionally a `::resolve` class method which takes a set or album URL for the service and returns a list of URLs for individual items

then this should all Just Work. There's definitely a blog post in this, because Ruby introspection and metaprogramming is just mind-bogglingly powerful (and dangerous).

And of course, known issues are [here](https://github.com/rawfunkmaharishi/purdie/issues).

##Why Purdie?

Because Bernard Purdie is [even more amazing than Ruby introspection](https://www.youtube.com/watch?v=E9E0WxLbqVA&list=PLuPLM2FI60-OIgFTc9YCrGgH5XWGT6znV&index=6).
