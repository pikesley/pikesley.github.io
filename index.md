---
div_id: home
---

I [build software](/projects) and [play music](//rawfunkmaharishi.uk), and I have a [non-working pancreas](//www.diabetes.org.uk/Guide-to-diabetes/What-is-diabetes/What-is-Type-1-diabetes/).

Some other places you can find me on the internets:

<ul id='me' class='row'>
{% for me in site.data.me %}
  <li class='col-md-4 col-xs-4'>
    <a href='//{% if me.url %}{{ me.url }}{% else %}{{ me.thing | downcase }}.com/pikesley{% endif %}' rel='me'>
      <i class='fa fa-{% if me.fa %}{{ me.fa }}{% else %}{{ me.thing | downcase}}{% endif %}'></i>
      <br />
      {{ me.thing }}
    </a>
  </li>
{% endfor %}
</ul>

In fact, if you come across a user called _pikesley_ on any service, it's probably me
