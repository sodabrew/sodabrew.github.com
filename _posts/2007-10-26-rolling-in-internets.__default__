---
layout: post
title: Rolling in Internets
mt_id: 57
date: 2007-10-26 18:18:41.000000000 -07:00
---
Well, it finally happened. I caved. I bought Internets <span style="font-weight: bold" class="Apple-style-span"><span style="font-style: italic" class="Apple-style-span">everywhere</span></span> with a Sprint plan and the Novatel USB727 doohickey. Bonus points to Novatel for packing a GPS and a EVDO rev A modem into such a small package and providing working Linux instructions involving only standard kernel serial drivers!

<img src="http://hydricacid.com/wp/wp-content/uploads/2007/10/nvu727dora_lpi.gif" alt="Novatel USB727" />

My critique of the instructions is also a strength: they're looong, repeated several times for various distributions, but also totally idiot-proofed. At the very end, the steps to quickly get the modem dialing from the command line are presented.

Instruction for using the Sprint U727 in Linux, (and very likely the Verizon USB727, too). Here's what works for me:<ul>	<li>First, add this line to /etc/modprobe.conf:<tt>options usbserial vendor=0x1410 product=0x4100</tt></li>	<li>Create <tt>/etc/wvdial.conf</tt> with these contents:
<code>
[Dialer Defaults]
Modem = /dev/ttyUSB0
Baud = 460800
Init1 = ATZ
Init2 = ATQ0 V1 E1 S0=0 &amp;C1 &amp;D2 +FCLASS=0
ISDN = 0
Modem Type = USB Modem
Phone = #777
Username = ''
Password = ''
Carrier Check = no
Stupid Mode = yes</code></li>	<li>Then, each time you want to use the modem:</li></ul><ol id="null">	<li> Insert the USB modem.</li>	<li>Wait for the device to be recognized as a cdrom.</li>	<li><tt>eject /dev/cdrom</tt>(since I don't have any other cdrom - you might need to eject /dev/cdrom1 or something)</li>	<li>Wait a beat.</li>	<li><tt>wvdial</tt></li>	<li><tt>route add default ppp0</tt></li></ol>
