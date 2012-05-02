---
layout: post
title: Handling exit within an eval
mt_id: 65
date: 2008-03-15 17:16:24.000000000 -07:00
---
So I've run into a problem with [mod_perlite](http://modperlite.org/), and it's
that I cannot just override Perl's exit function with a straight perl_destruct
call, a longjmp back to the Apache handler, or anything else at all.

* [Here's how it's handled in mod_perl](http://theory.uwinnipeg.ca/modperl/docs/2.0/api/ModPerl/Util.html#C_exit_).
* [And then there's this possible workaround using goto](http://www.perlmonks.org/?node_id=636127).
* [Shockingly, this works, too](http://www.mail-archive.com/perl-qa-help@perl.org/msg01189.html).

Here's my favorite...

### bar.pl
{% highlight perl lineno %}
exit;
{% endhighlight %}

### Foo.pm
{% highlight perl lineno %}
package Foo;

sub new {
  return bless { };
}

sub DESTROY {
  print "Foo is destroyed\n";
}

1;
{% endhighlight %}

### foo.pl
{% highlight perl lineno %}
use Foo;

my $foo = Foo-&gt;new;

print "I have a foo!\n";

BEGIN { *CORE::GLOBAL::exit = sub { goto EXIT; }; }

eval {
  bar("bar.pl");
}; if ($@) {
  print "$@ happens\n";
}

print "And I'm still here\n";

sub bar {
  eval require $_[0];
  EXIT:
  print "Exiting!\n";
  goto REALLY_EXIT;
}

REALLY_EXIT:
{% endhighlight %}

Yep, that actually works!

{% highlight text %}
I have a foo!  
Exiting!  
Foo is destroyed.  
{% endhighlight %}
