---
title: Skellington
github: pikesley/skellington
---

Generate tedious [Cucumber](http://cukes.info/) and [Sinatra](http://www.sinatrarb.com/) boilerplate like a boss

    $ gem install skellington
    $ skellington generate naming_things_is_hard

    Generating naming_things_is_hard/Gemfile...done
    Generating naming_things_is_hard/Rakefile...done
    Generating naming_things_is_hard/Procfile...done
    Generating naming_things_is_hard/config.ru...done
    Generating naming_things_is_hard/features/naming_things_is_hard.feature...done
    Generating naming_things_is_hard/features/support/env.rb...done
    Generating naming_things_is_hard/lib/naming_things_is_hard.rb...done

    Your new Sinatra app 'NamingThingsIsHard' has been created

    Now do

        cd naming_things_is_hard
        bundle
        rake

    And presuming that passes OK

        badger > README.md
        git add .
        git commit -m 'First commit'

    You can run the app with

        rackup

This assumes a bunch of things, at least:

* That you have a reasonable git installation
* That you're using _RVM_ - I think I just need a `.ruby-version` file to make this play nice with _rbenv_, is that correct?

Also, it will set up the new project using whatever version of ruby is cromulent when you run it
