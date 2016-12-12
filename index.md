---
title: I am Sam Pikesley
div_id: home
---

I build software for the [ODI](http://theodi.org/team/sam-pikesley) and play music with [The Raw Funk Maharishi](http://rawfunkmaharishi.uk), and I have a [non-working pancreas](http://www.diabetes.org.uk/Guide-to-diabetes/What-is-diabetes/What-is-Type-1-diabetes/).

Some other places you can find me on the internets:

<ul id='find-me'>
{% for find in site.data.find-me %}
  <li>{{ find | markdownify | remove: '<p>' | remove: '</p>' }}</li>
{% endfor %}
  <li>Speaking in public:
  <ul>
    {% for talk in site.data.talks %}
      <li>
        <a href='{{ talk.url }}' title='{{ talk.title }}'>
          {{ talk.event }}
        </a>
      </li>
    {% endfor %}
  </ul>
  </li>
</ul>

In fact, if you come across a user called _pikesley_ on any service, it's probably me
