---
layout: post
title: Running nmbd on OpenBSD
mt_id: 5
date: 2008-09-12 12:45:52.000000000 -07:00
---
Some days I need to share files across subnets at home, and always end up frustrated that some part of the infrastructure is there to give me a headache. Like, say, that Windows file shares still cannot readily browse across subnets! (Neither did Rendezvous/Bonjour on the Mac, originally, but it does now.) Consequently I set up just nmbd on my OpenBSD firewall, which routes between my various wireless and wired networks, so provide the NetBIOS name resolution across subnets needed to allow for cross-subnet Windows network browsing. Note, crucially, that I'm not running smbd. No files are being shared here, no users are being authenticated, I am strictly using nmbd as a name server.<span style="font-family: Verdana; font-size: 13px; line-height: normal" class="Apple-style-span">Take the <em>smb.conf</em> from <a href="http://www.linuxplanet.com/linuxplanet/tutorials/6451/">part 1</a> and add these lines to the <em>[global]</em> section:
<pre>   domain master = yes    preferred master = yes     local master = yes    wins support = yes    wins proxy = yes</pre>
</span><span style="font-family: 'Courier New'; font-size: 11px; line-height: 13px; white-space: pre" class="Apple-style-span">   os level = 65</span>

http://files.dns-sd.org/draft-cheshire-dnsext-dns-sd.txt

http://www.ietf.org/rfc/rfc2136.txt

http://www.apple.com/support/downloads/bonjourforwindows.html

http://www.chaoticsoftware.com/ProductPages/NetworkBeacon.html

http://developer.apple.com/networking/bonjour/faq.html
