---
layout: post
title: Introducing a Memcached Module for Varnish 3
mt_id: 98
date: 2012-01-28 13:01:59.000000000 -08:00
---
[Varnish](http://varnish-cache.org) makes your websites go faster.
[Memcached](http://memcached.org), makes your websites go faster. Blog posts
abound on using Varnish's excellent embedded C functionality to link
libmemcached into your VCLs, and Poul himself has written about his surprise in
learning that many VCLs were actually thin wrappers around a C library where
all of the business logic of a VCL would live.

Starting in Varnish 3, the balance can now shift back towards the VCL itself as
the driver of business logic, with first-class "vmod" modules providing new VCL
functions. (If you've been around a while, you might recognize the same
progression that PHP took in the late 90's and early 2000's, back when PHP
looked like a promising future.)

Without further ado, I present
[libvmod-memcached](http://github.com/sodabrew/libvmod-memcached), a Varnish
Memcached Module. Here's a quick example script that flushed the cache for a
page every 20 hits.

{% highlight cpp %}
import memcached;

sub vcl_init {
	memcached.servers("localhost");
}

sub vcl_hit {
	if( memcached.incr(req.url, 1) == 0 ) {
		memcached.set(req.url, 0, 86400, 0);
	}
	if( memcached.get(req.url) == "20" {
		purge_url(req.url);
	}
}
{% endhighlight %}

Note that VCL does not allow arbitrary variables, so I'm doing two memcached
queries here. Fixing that will be another blog post!
