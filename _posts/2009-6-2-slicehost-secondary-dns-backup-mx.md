---
layout: post
title: Slicehost as secondary DNS and backup MX
mt_id: 81
date: 2009-06-02 11:18:50.000000000 -07:00
---
This blog runs on my own server, on my own DSL line, with my own domains and DNS, running my own email service using some of my own email code.

Until those days when the lines are down and the tubes are tied up and the power is out and the magic smoke goes poof. Those days, I want nothing more than a normal hosted email service like everyone else.

But let's get real. No I don't! I like running my own stuff! Of course it's embarrassing to bounce email when my server is offline, so what's really important is to follow the best-practices for running a proper site, including secondary DNS and backup MX.

The first thing to do when figuring out secondary DNS is to figure out how many domains you have. I only run email for 3 domains, but I have a raft of neat domains that I own. Most secondary DNS services charge on a per-domain basis, so getting secondary service for 25 domains will cost a bundle, and doesn't even begin to solve the problem of a backup MX.

Looking around some more, I found that some hosting services provide unlimited DNS service along with a subscription for a hosted virtual machine. The best of those services is <a href="http://slicehost.com/">Slicehost</a>, starting at $20/month for a basic virtual machine instance with 256 MB of RAM and 10 GB of disk. I highly recommend this service and the basic configuration for your backup MX.

Ok, so we've got a virtual machine instance, now what? Gotta install something on it! I recommend whatever is the most recent Ubuntu LTS. You don't need or want any new hotness for your backup MX. You need and want stupidly simple and someone-else-is-supporting-this reliable. Ubuntu LTS. Do it.

 
