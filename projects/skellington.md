---
title: Skellington
github: pikesley/skellington
---

Generate tedious [Cucumber](http://cukes.info/) and [Sinatra](http://www.sinatrarb.com/) boilerplate like a boss. Should work fine for both RVM- and rbenv-based setups

    $ gem install skellington
    $ skellington generate naming-things-is-hard
      Generating naming_things_is_hard/Gemfile...done
      Generating naming_things_is_hard/Rakefile...done
      Generating naming_things_is_hard/Procfile...done
      Generating naming_things_is_hard/Guardfile...done
      Generating naming_things_is_hard/.ruby-version...done
      Generating naming_things_is_hard/config.ru...done
      Generating naming_things_is_hard/features/naming_things_is_hard.feature...done
      Generating naming_things_is_hard/features/step_definitions/naming_things_is_hard_steps.rb...done
      Generating naming_things_is_hard/features/support/env.rb...done
      Generating naming_things_is_hard/lib/naming_things_is_hard.rb...done
      Generating naming_things_is_hard/lib/views/default.erb...done
      Generating naming_things_is_hard/lib/views/index.erb...done

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

This assumes a bunch of things, at least:

* That you have a reasonable git installation

Also, it will set up the new project using whatever version of ruby is cromulent when you run it
