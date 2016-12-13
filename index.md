---
title: I am Sam Pikesley
div_id: home
---

I build software for the [ODI](http://theodi.org/team/sam-pikesley) and play music with [The Raw Funk Maharishi](http://rawfunkmaharishi.uk), and I have a [non-working pancreas](http://www.diabetes.org.uk/Guide-to-diabetes/What-is-diabetes/What-is-Type-1-diabetes/).

Some other places you can find me on the internets:

<ul id='me' class='row'>
{% for me in site.data.me %}
  <li class='col-md-4 col-xs-4'>
    <a href='//{{ me.url }}'>
      <i class='fa fa-{{ me.fa }}'></i>
      <br />
      {{ me.thing }}
    </a>
  </li>
{% endfor %}
</ul>

In fact, if you come across a user called _pikesley_ on any service, it's probably me
