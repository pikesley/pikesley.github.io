---
layout: post
status: publish
published: true
title: Sitting on the Docker the Bay
---
_**Continuous Integration:** a development practice where developers check code into shared version-control several times a day. Each check-in is then verified by a robot, allowing early detection of problems_

_**Infrastructure as Code:** the idea at the heart of the [DevOps movement](http://whatisdevops.com/), that (virtualised) infrastructure should be considered as a software project, and therefore subject to the same development practices in use elsewhere, such as test-driven development, version control and **continuous integration**_

All of the ODI's code is [subject to continuous integration](https://travis-ci.org/theodi), as are most of my [personal](https://travis-ci.org/pikesley/) [projects](https://travis-ci.org/rawfunkmaharishi). Fantastic tools like [html-proofer](https://github.com/gjtorikian/html-proofer) even allow [static HTML sites to use the Travis safety-net](https://travis-ci.org/marvelexplorer/marvelexplorer.github.io). CI is indispensable for our software. It allows an elegant workflow:

* Push branch to Github and open pull-request
* Travis runs tests
* If tests pass, merge PR
* Travis runs once more on the newly-merged _master_ branch
* If that's successful, Travis moves the _CURRENT_ tag up to that commit
* New code is deployed

Our weapon-of-choice for infrastructure provisioning (including deployment of code from the above workflow) is [Chef](https://www.chef.io/). It would be a beautiful thing to have a similar workflow to the above, where on a successful Travis run, that version of the cookbook is published to the Chef server, the appropriate Chef environments are updated, and the infrastructure is all brought up-to-date by the robots.

When I first looked into test-driven infrastructure development, the only viable option was the (now very dead) [cucumber-chef](https://github.com/Atalanta/cucumber-chef). This worked, but it was unwieldy and once we got above a handful of nodes, making any changes became onerous, not to say tedious, and for various reasons it was never going to work in Travis. Because of this, some of our projects [bit-rotted](https://en.wikipedia.org/wiki/Software_rot) due to changes in their dependencies, and we found ourselves unable to deploy fresh servers.

Enter, then, Fletcher Nichol's [test-kitchen](http://kitchen.ci/), a much lighter-weight test-driven infrastructure framework. It uses the excellent [ServerSpec](http://serverspec.org/) [Rspec](http://rspec.info/) extensions, it has sensible support for mocking other services, and it makes test-driven infrastructure tractable once more.

In its early iterations, it relied upon [VirtualBox](https://www.virtualbox.org/) (via [Vagrant](https://www.vagrantup.com/)) which meant we couldn't CI it - we did once lash together a Heath-Robinson contrivance whereby Travis span up (costly) Rackspace Cloud nodes to converge and test, but it only occasionally shut them down when it was finished and felt generally flaky so we binned that idea.

But there now exists the [kitchen-docker](https://github.com/portertech/kitchen-docker) plugin, which allows us to spin up test nodes on [Docker](https://www.docker.com/). Whatever your feelings about Docker generally - and I'm ambiguous on this because I don't think I've ever properly understood the use-cases behind the hype - using it inside something like test-kitchen seems absolutely ideal. Running it up locally for a simple converge was _much_ faster than using Vagrant, and it soon occurred to me that, seeing as Travis has Docker support, I might finally be able to do proper continuous-integration of my infrastructure-as-code.

And that's when the problems started.

## A mismatch of expectations

Travis supports Docker - it says so [here](http://blog.travis-ci.com/2014-12-17-faster-builds-with-container-based-infrastructure/). Test-kitchen can now use Docker - I know, I've had it running. Armed with these two pieces of information - and, to be honest, not a lot more - I set about bringing these two things together.

### "Travis supports Docker"

![Inigo Montoya](https://englishedithelp.files.wordpress.com/2012/05/words1.jpg)

When Travis says it supports Docker, what it means is that in order to run your test suite it will:

* Spin up a Docker instance
* Install the appropriate version(s) of Ruby (or whatever, as specified in your `.travis.yml` file)
* Check out your code
* Run `bundle` (or whatever, from your `travis.yml`)
* Run your tests
* Tell you if it passed or failed
* Shut down the instance

Which is great for continuous-integration of regular code. Unfortunately, Infrastructure Code is not regular code. Test-kitchen has different requirements - it requires a whole, independent, bare-bones Linux _machine_ to test on. To understand what this means, consider what happens when I run `kitchen test` on my laptop:

* test-kitchen talks to the Docker daemon (in my case, [boot2docker](http://boot2docker.io/)) and requests a new node
* The node comes up and reports for duty
* test-kitchen provisions the node according to the recipes I want to test
* test-kitchen ships rspec (and its dependencies), plus my ServerSpec tests, onto the newly-provisioned node
* The tests are run
* The results are reported _back from the Docker node to my locally-running test-kitchen_
* The Docker node is terminated

And this all takes a couple of minutes. Unless [nokogiri](http://farm8.staticflickr.com/7289/11501249045_390b515621_o.png) is involved.

So in a conventional Travis run, it spins up a Docker node and _runs everything there_, then bins the node. What we need is for Travis to offer us a listening Docker daemon that we can interact with _from the thing that's running our test suite_. This is a subtle but vitally important distinction that caused me untold amounts of trouble.

### travis-docker

This - ['Run & build Docker containers in a Travis CI build'](https://github.com/moul/travis-docker) - seemed like it would probably do what I was after. I tried [any number of different configuration options](https://github.com/pikesley/cake_or_death/blob/master/.travis.yml) and I did, at various points, have a listening Docker daemon (I think - it can be kind of hard to tell where the failure is actually occurring), but I found I then couldn't actually talk to it. I tried backgrounding the command to run Docker, I tried putting it in a while loop then running my tests, I tried everything I could think of, but I could fathom no way of getting between Docker and Travis.

I opened [an issue](https://github.com/moul/travis-docker/issues/12), and tried everything suggested there. The maintainer was updating the code and asking me to try new things, but none of them worked. I even tried [contacting Travis](https://twitter.com/ODILabs/status/598790894448451584) to see if I could work out exactly what their deployment boxes were trying to do, or at least speed up my failure cycle.

But eventually, after beating my head against this for a couple of weeks, I gave up.

## So what have we learned?

> Kids, you tried your best and you failed miserably. The lesson is, never try

This seems like something that should work. This *certainly* seems like something that other people apart from me would want. I'm pretty sure all of the pieces exist on Travis, I simply don't know the correct incantations to make them line up the way I want them.

Maybe I wasn't able to explain my situation clearly enough to the _travis-docker_ guy, and maybe _that_ means that I don't have a sufficient understanding of what it is I'm actually trying to achieve here. Or maybe this is all a terrible misuse of tools.

Or maybe there are people out there doing this right now and I just don't know how to ask the right questions of Google.
