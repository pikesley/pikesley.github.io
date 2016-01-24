---
title: Skellington
github: pikesley/skellington
---
Extremely opinionated generator for your [Sinatra](http://www.sinatrarb.com/) app. Sets up:

* [Cucumber](https://cucumber.io/)
  * with [cucumber-api-steps](https://github.com/jayzes/cucumber-api-steps)
* [Rspec](http://rspec.info/)
* [Jasmine](http://jasmine.github.io/2.0/introduction.html)
* [Bootstrap](http://getbootstrap.com/)
* An MIT License file

Should work fine for both RVM- and rbenv-based setups

    $ gem install skellington
    $ skellington generate naming-things-is-hard --licensor 'Beyoncé'
    Generating <lots of stuff>... done

    Your new Sinatra app NamingThingsIsHard has been created

    (Note that 'naming-things-is-hard' has been changed to 'naming_things_is_hard' because Ruby finds '-'s troubling)

    Now do

      cd naming_things_is_hard
      bundle
      rake

    And presuming that passes OK

      git add .
      git commit -m 'First commit'

    You can run the app with

      rackup

    For post-install hints, try

      skellington postinstall

This assumes a bunch of things, at least:

* That you have a reasonable git installation

Also, it will set up the new project using whatever version of ruby is cromulent when you run it
