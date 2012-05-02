---
layout: post
title: Upgrading an HP dv2000
mt_id: 95
date: 2011-05-25 18:17:40.000000000 -07:00
---
My gal has a laptop that she really likes, an HP dv2000 - dv2225nr to be exact
- even though it's slooow. I'd gotten pretty near to talking her into replacing
it when the new job provided a spiffy ThinkPad that she can bring home now and
then. Needing only a personal machine to sync her iPhone and surf the web, I
said, "What if we just put in a hundred bucks to make it less slow and do a
Windows Vista detox?"

Ok, $185 bucks later, and I have some recommendations to make to the lazywebs about this laptop model.

Things I learned:

The AMD Turion 64 x2 with GeForce Go 6150 chipset in this system will happily
accept sticks of 4GB DDR2 RAM, probably for a maximum capacity of 8GB. But I
stopped at mixing a 4GB stick with an existing 1GB stick, for a total of 5GB.

Check in the BIOS how much RAM is set aside for that GeForce Go 6150. The
default is probably 64MB from the factory (with the default 1GB memory
configuration, this makes sense I suppose), but you can go to 128MB. Now that
128MB is basically a rounding error on the total memory size, use it.

I tried to clone the original hard drive, but taking it out of the machine
caused it to lose its magic smoke. That meant my Windows 7 Upgrade edition was
no longer valid for a clean install on a new 7200RPM drive. Follow these
directions to get around that:

*  Finish the installation with the activate-later option.
*  Once you're up and running, run <tt>regedit</tt> as Administrator
*  Change this key from 1 to 0:<br />
*  HKEY_LOCAL_MACHINE/Software/Microsoft/Windows/CurrentVersion/Setup/OOBE/MediaBootInstall</tt>
*  Close <tt>regedit</tt>
*  Run </tt>cmd</tt> as Administrator
*  Run <tt>slmgr /rearm</tt> at the command line
*  Close <tt>cmd</tt>
*  Activate by going to System -> Change product key

Windows 7 64-bit runs great, uses all of the RAM and all that jazz. \[Insert
pointless argument about pointer sizes and 64-bit bloat and how I'd be better
off with 3.5GB usable RAM at 32-bits. I don't care; everything else I touch
these days is 64-bit. Consistency FTW.\]

Finally, the 1.6GHz Turion TL-50 CPU sits in an S1G1 socket, so $20 got me a
2GHz TL-60 with double the L1 cache and a 31W TDP, down from 35W. Runs faster,
cooler, and I pretend that the battery lasts a little more. That's what I told
my girlfriend, anyhow! Winning!
