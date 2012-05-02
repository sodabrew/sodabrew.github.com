---
layout: post
title: Perl Hash Slices
mt_id: 84
date: 2009-07-17 15:56:58.000000000 -07:00
---
One of my favorite things to do with Perl hashes is slice them with this
incredibly concise syntax. The first time I saw this, I Just Got It (TM).
Lifting a chunk of text from the excellent (though dated) online book
<i>[Picking Up Perl](http://www.ebb.org/PickingUpPerl/)</i>, here's how it works:

### Slices

It turns out you can slice hashes just like you were able to slice arrays.
This can be useful if you need to extract a certain set of values out of a
hash into a list.

{% highlight perl %}
use strict;
my %table = qw/schmoe joe smith john simpson bart/;
my @friends = @table{'schmoe', 'smith'};
# @friends has qw/joe john/
{% endhighlight %}

Note the use of the <i>@</i> in front of the hash name.  This shows that we
are indeed producing a normal list, and you can use this construct in any
list context you would like.

### Context Considerations

We have now discussed all the different ways you can use variables in
list and scalar context.  At this point, it might be helpful to review
all the ways we have used variables in different contexts.  The table
that follows identifies many of the ways variables are used in Perl.

<table>
  <tr>
    <td><strong>Expression</strong></td>
    <td><strong>Context</strong></td>
    <td><strong>Variable</strong></td>
    <td><strong>Evaluates to</strong></td>
  </tr>
  <tr><td><code>$scalar</code> </td><td> scalar </td><td> <code>$scalar</code>, a scalar</td><td> the value held in <code>$scalar</code></td> </tr>
  <tr><td><code>@array</code> </td><td> list </td><td> <code>@array</code>, an array</td><td> the list of values (in order) held in <code>@array</code></td> </tr>
  <tr><td><code>@array</code> </td><td> scalar </td><td> <code>@array</code>, an array</td><td> the total number of elements in <code>@array</code> (same as <code>$\#array + 1</code>)</td> </tr>
  <tr><td><code>$array\[$x\]</code> </td><td> scalar </td><td> <code>@array</code>, an array</td><td> the <code>($x+1)</code>th element of <code>@array</code></td> </tr>
  <tr><td><code>$\#array</code> </td><td> scalar </td><td> <code>@array</code>, an array</td><td> the subscript of the last element in <code>@array</code> (same as <code>@array -1</code>)</td> </tr>
  <tr><td><code>@array\[$x, $y\]</code> </td><td> list </td><td> <code>@array</code>, an array</td><td> a slice, listing two elements from <code>@array</code> (same as <code>($array[$x], $array[$y])</code>)</td> </tr>
  <tr><td><code>"$scalar"</code> </td><td> scalar \(interpolated\) </td><td> <code>$scalar</code>, a scalar</td><td> a string containing the contents of <code>$scalar</code></td> </tr>
  <tr><td><code>"@array"</code> </td><td> scalar \(interpolated\) </td><td> <code>@array</code>, an array</td><td> a string containing the elements of <code>@array</code>, separated by spaces</td> </tr>
  <tr><td><code>%hash</code> </td><td> list </td><td> <code>%hash</code>, a hash</td><td> a list of alternating keys and values from <code>%hash</code></td> </tr>
  <tr><td><code>$hash\{$x\}</code> </td><td> scalar </td><td> <code>%hash</code>, a hash</td><td> the element from <code>%hash</code> with the key of <code>$x</code></td> </tr>
  <tr><td><code>@hash\{$x, $y\}</code> </td><td> list </td><td> <code>%hash</code>, a hash</td><td> a slice, listing two elements from <code>%hash</code> \(same as <code>($hash\{$x\}, $hash\{$y\}\)</code></td></tr>
</table>


