---
layout: post
title: Perl Hash Slices
mt_id: 84
date: 2009-07-17 15:56:58.000000000 -07:00
---
One of my favorite things to do with Perl hashes is slice them with this
incredibly concise syntax. The first time I saw this, I Just Got It (TM).
Lifting a chunk of text from the excellent (though dated) online book
<i>(Picking Up Perl)[http://www.ebb.org/PickingUpPerl/]</i>, here's how it works:

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

<TABLE>
<TR><TD><STRONG>Expression</STRONG> </TD><TD> <STRONG>Context</STRONG> </TD><TD> <STRONG>Variable</STRONG> </TD><TD> <STRONG>Evaluates to</STRONG></TD>
</TR>

<TR><TD><CODE>$scalar</CODE> </TD><TD> scalar </TD><TD> <CODE>$scalar</CODE>, a scalar</TD>

</TD><TD> the value held in <CODE>$scalar</CODE>

</TR>

<TR><TD><CODE>@array</CODE> </TD><TD> list </TD><TD> <CODE>@array</CODE>, an array</TD>

</TD><TD> the list of values (in order) held in <CODE>@array</CODE>

</TR>
<TR><TD><CODE>@array</CODE> </TD><TD> scalar </TD><TD> <CODE>@array</CODE>, an array</TD>

</TD><TD> the total number of elements in <CODE>@array</CODE> (same as
<CODE>$#array + 1</CODE>)

</TR>
<TR><TD><CODE>$array[$x]</CODE> </TD><TD> scalar </TD><TD> <CODE>@array</CODE>, an array</TD>

</TD><TD> the <CODE>($x+1)</CODE>th element of <CODE>@array</CODE>

</TR>
<TR><TD><CODE>$#array</CODE> </TD><TD> scalar </TD><TD> <CODE>@array</CODE>, an array</TD>

</TD><TD> the subscript of the last element in <CODE>@array</CODE> (same as
<CODE>@array -1</CODE>)

</TR>
<TR><TD><CODE>@array[$x, $y]</CODE> </TD><TD> list </TD><TD> <CODE>@array</CODE>, an array</TD>

</TD><TD> a slice, listing two elements from <CODE>@array</CODE> (same as
<CODE>($array[$x], $array[$y])</CODE>)

</TR>
<TR><TD><CODE>"$scalar"</CODE> </TD><TD> scalar (interpolated) </TD><TD> <CODE>$scalar</CODE>, a scalar</TD>

</TD><TD> a string containing the contents of <CODE>$scalar</CODE>

</TR>
<TR><TD><CODE>"@array"</CODE> </TD><TD> scalar (interpolated) </TD><TD> <CODE>@array</CODE>, an array</TD>

</TD><TD> a string containing the elements of <CODE>@array</CODE>, separated by
spaces


</TR>
<TR><TD><CODE>%hash</CODE> </TD><TD> list </TD><TD> <CODE>%hash</CODE>, a hash</TD>

</TD><TD> a list of alternating keys and values from <CODE>%hash</CODE>

</TR>
<TR><TD><CODE>$hash{$x}</CODE> </TD><TD> scalar </TD><TD> <CODE>%hash</CODE>, a hash</TD>

</TD><TD> the element from <CODE>%hash</CODE> with the key of <CODE>$x</CODE>

</TR>
<TR><TD><CODE>@hash{$x, $y}</CODE> </TD><TD> list </TD><TD> <CODE>%hash</CODE>, a hash</TD>

</TD><TD> a slice, listing two elements from <CODE>%hash</CODE> (same as
<CODE>($hash{$x}, $hash{$y})</CODE>
</TR></TABLE> 