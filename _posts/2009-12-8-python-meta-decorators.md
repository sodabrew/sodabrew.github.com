---
layout: post
title: Python Meta Decorators
mt_id: 91
date: 2009-12-08 12:08:16.000000000 -08:00
---
Recently, I was working on a project in Python framework that was built
around decorators. Each of my functions needed something like six
decorators, each with its own arguments, but mostly all the same. I
thought, "This is a classic case of cut-and-paste coding; there has to
be a better way!" I toiled over decorators for a while, and finally came
up with this pattern:

{% highlight python %}
def monkey(arg):
  def outer(f):
    def inner(*args, **kwargs):
      print "Monkey: %s" % arg
      f(*args, **kwargs)
    return inner
  return outer

def zombie(arg):
  def outer(f):
    def inner(*args, **kwargs):
      print "Zombie: %s" % arg
      f(*args, **kwargs)
    return inner
  return outer

def wrapper(m, z):
  def outer(f):
    @monkey(m)
    @zombie(z)
    def inner(*args, **kwargs):
      f(*args, **kwargs)
    return inner
  return outer

@wrapper("coconut", "brains")
def mytesta(foo):
  print foo

@wrapper("bacon", "chainsaw")
def mytestb(foo):
  print foo

mytesta("Hello World")
mytestb("Hello World")
{% endhighlight %}

What I'm doing here is first setting up two standard argument-taking
decorators, @monkey and @zombie. Then I'm setting up a decorator that
returns a decorated function, whose arguments are built at decoration
time. This lets me template out a complex decoration pattern where only
a few arguments need to change for each function, and pass just those
arguments into my meta-decorator.

This is the output:

{% highlight sh %}
Monkey: coconut
Zombie: brains
Hello World

Monkey: bacon
Zombie: chainsaw
Hello World
{% endhighlight %}
