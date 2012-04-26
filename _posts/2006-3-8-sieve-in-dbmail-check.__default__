---
layout: post
title: ! 'Sieve in DBMail: Check!'
mt_id: 33
date: 2006-03-08 02:27:31.000000000 -08:00
---
DBMail now has Sieve script support, starting with DBMail 2.1.4 and libSieve 2.1.10. A marathon two weeks of integration, three releases of libSieve, and two releases of the DBMail 2.1 development series, and it's together and working. And it was only on my todo list for two years. Probably the most interesting part of the experience was working on both sides of a library: maintaining the library and the downstream application consuming it. Even when it was tempting to Just Fix It (TM) when I came across a bug, most of the time these bugs were crashes caused by misunderstandings or garbage data flowing between the programs. Within a single program, you can just document that a function doesn't like garbage, refactor the function and its consumer, whatever. But when you've got a library intended for consumption in its own right -- and an [almost] frozen API -- Garbage In Garbage Out (TM) is a less than ideal situation. The better approach is to handle the garbage elegantly and return useful error messages, like this: Error: you gave me garbage but all you're going to get back is this lousy error message. And a t-shirt, I suppose ;-)
