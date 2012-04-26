---
layout: post
title: Lagging on my bugs
mt_id: 13
date: 2005-02-18 05:51:38.000000000 -08:00
---
I have two bugs on my plate for over a week, and I'm really lagging on them. Stupid other things to do. DBMail 2.0.3 needs a bug fix for users who are over quota. Right now it bounces the message with a temporary failure. This leads to the MTA trying to deliver again. Temporary failure. Again. Temporary failure. Eventually the queue gets pretty blocked up. Not so good. And TWIG 2.8.1 needs a fix for the FindHTML function that gets called to process the To, From, CC, BCC headers for possible HTML in email addresses. Better handled by the imap_rfc822_parse_address function provided by the imap c-client. On a 40,000 address test corpus I ran, imap_rfc822 took 1.6 seconds to parse those 40k addresses. FindHTML took an hour before I killed the process. Not so good.

So instead I'm working on some homework and distracting myself with the TWIG website. Two years ago I had the idea to write the TWIG website in TWIG. So I hacked up a version to do that. And today I had an epiphany for how I can do it a lot smarter from within the TWIG 3 framework I've began 8 months ago. Can't wait to have time to get this really cooking!
