---
layout: post
title: Updating Soekris firmware using Kermit
mt_id: 87
date: 2009-09-23 18:59:44.000000000 -07:00
---
I've had trouble getting minicom's xmodem to fully upload a Soekris firmware
image over USB serial adapters, and I've never been a big fan of minicom in the
first place. I like good old Kermit. Recently I discovered how to get Kermit to
speak xmodem, and used it to update the firmware on my Soekris Net4801.

First, install kermit and lrzsz. Next, connect your Soekris box. Now fire up kermit and go!

{% highlight sh %}
$ kermit

set protocol xmodem-crc download {} {lsx %s} {} {lrx %s} {}
set line /dev/ttyUSB0
set speed 19200
set carrier-watch off
set flow none
connect

> download -

send /binary firmware-file-name
connect

> flashupdate
{% endhighlight %}
