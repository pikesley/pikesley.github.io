---
title: Diabetes Dashboard
github: pikesley/diabetes-dashboard
---
A Dashing dashboard, driven by my [Pancreas API](http://pancreas-api.herokuapp.com/). Right now it shows:

* Daily, weekly and 30-day blood-glucose graphs and averages
* Weekly breakfast, lunch, dinner and bedtime medication graphs and averages
* Latest HbA1c

There'll be a lot more sophisticated stuff here once I've worked out Coffeescript and [Rickshaw](http://code.shutterstock.com/rickshaw/)

# Deployment

This is a straight-up Rack app, it should deploy right onto Heroku. The Heroku environment will need to know about 

* `METRICS_API_USERNAME` and 
* `METRICS_API_PASSWORD` 

to access the Pancreas API (you'll have set these [here](http://pancreas-api.herokuapp.com/#dropbox-integration)), and 

* `DASHBOARD_USERNAME` and
* `DASHBOARD_PASSWORD`

which will allow you into the dashboard

# Dashing is awesome

See [http://shopify.github.com/dashing](http://shopify.github.com/dashing) for more on Dashing
