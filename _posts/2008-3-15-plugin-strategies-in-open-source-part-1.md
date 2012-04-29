---
layout: post
title: Plugin Strategies in Open Source, Part 1
mt_id: 64
date: 2008-03-15 17:11:01.000000000 -07:00
---
Once upon a time, I worked<a href="#note">*</a> on an open source groupware
application called <a href="http://informationgateway.org">TWIG</a>, The Web
Information Gateway. I started posting fixes, wrote some code to scratch my
itches, and pretty soon I got CVS commit access.  I wrote a new module for
scheduling meetings, and the guys on the development team loved it, so I
committed it, and life was good. Pretty soon, I was using this module to
schedule meetings in rooms that got to be conflicting and overlapped. I also
had heard that back at my high school, there was a (particular teacher)[http://www.huffingtonpost.com/esther-wojcicki]
who thought she was the Goddess-of-all-Writing and therefore could simply walk
up to the whiteboard in the main computer lab and erase other teachers from the
schedule in order to accommodate her clearly superior, holy and blessed
classes.

So I wrote a reservations module that integrated into this groupware platform,
and it worked, and I got positive feedback from the folks back at my old high
school, folks on the twig users mailing list, and from the development team, so
I committed it.

The maintainer flipped out. "NO MORE MODULES!" he said, "REMOVE THIS OR I WILL
REVOKE YOUR CVS ACCESS!"

Other developers and users came to my defense and said, "But this module is
useful, it's excellent, it complements the scheduling and meetings features.
It's killer!"

"DIE MODULES, DIE!" the maintainer said.

The project died.

<a title="note" name="note"></a><em>Actually, I still use TWIG personally, and
I still hack on it when I have time, and every now and then there are new users
who post to the mailing list, and I generally respond to help them out within a
few hours. But the project is effectively dead.</em>
