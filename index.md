---
layout: default
title: Aaron Stone
group: nav
navtitle: home
navlink: 
navweight: 1
description: Aaron Stone's website
---
{% include JB/setup %}


<div class="row">
  <div class="span12">
    <div class="row">
      <div class="span9">

        {% for post in site.posts limit:5 %}
        <div class="row">
          <div class="span2">
            <h5 class="post-date" align="right">{{ post.date | date: "%e %B %Y" }}</h5>
          </div>
          <div class="span7">
            <h2><a class="post-title" href="{{ BASE_PATH }}{{ post.url }}">{{ post.title }}</a></h2>
            {{ post.content }}
            <hr>
            <br />
            <br />
          </div>
        </div>
        {% endfor %}

      </div>
    </div>
  </div>
</div>

<div class="row">
  <div class="span7 offset2">
    <h3><a href="{{ BASE_PATH }}{{ site.JB.archive_path }}">More posts</a></h3>
  </div>
</div>
