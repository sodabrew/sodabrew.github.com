---
layout: post
title: Things that make MySQL dumb
mt_id: 56
date: 2007-10-19 17:56:18.000000000 -07:00
---
[http://forums.mysql.com/read.php?92,133026,133102](http://forums.mysql.com/read.php?92,133026,133102)

> Hi.
> Since the updates on a memory table should be very fast, the locks are taken for a very short time only. I won't expect that they become a bottleneck. But I must admit that I don't have any experiences with applications like this.
> If they do indeed become a bottleneck, you could try to use a transactional engine that uses row level locks, like InnoDB. But I guess that the overhead will outweigh the improvements in locking.
> 
> Regards
> Ingo
> 
> Ingo Strüwing, Senior Software Developer - Storage Engines
> MySQL AB, www.mysql.com

Ouch, man. That's my cerebellum you're destroying.
