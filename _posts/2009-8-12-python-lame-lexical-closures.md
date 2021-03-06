---
layout: post
title: Python's Lame Lexical Closures
mt_id: 85
date: 2009-08-12 07:14:08.000000000 -07:00
---
Here's a simple generator function in Python that you can use in a test harness
to find out how many times the function was called. Call the function once with
an argument, and then each time you call the function again it will return that
argument and increment an internal counter. Call the function with the named
argument 'got_called' and it will reset and return its current call count.

{% highlight python %}
def GotCalled(ret):
  """Stub that counts how many times it was called."""
  count = [0]

  def _GotCalled(*unused_args, **kwargs):
    if kwargs.get('got_called'):
      lame = count[0]
      count[0] = 0
      return lame
    else:
      count[0] += 1
      return ret

  return _GotCalled
{% endhighlight %}

But note how count is a list. And I'm incrementing and returning the first
member of the list. Guess what -- you can't use a variable directly in this
situation! It'll error out on the 'count += 1' because the act of assigning to
the variable in the inner function <i>creates a new instance of that
variable</i>, one that hasn't been used before and so fails the + part of the
+=. LAME. 
