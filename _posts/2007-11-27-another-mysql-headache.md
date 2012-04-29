---
layout: post
title: Another MySQL headache
mt_id: 61
date: 2007-11-27 16:55:11.000000000 -08:00
---
In <a href="http://www.dbmail.org/mantis/view.php?id=655">http://www.dbmail.org/mantis/view.php?id=655</a>, Mr. Maenaka writes:<blockquote>MySQL's automatic reconnection is unsafe because of the following reason.First, SET NAMES query is a required arbitration between server and client if both's character encoding is different. This should be done at the time of connection open. (Of course you can issue SET NAMES between every query with the huge overhead though.) By the way, MySQL's automatic reconnection is made transparent to the client. So the client never know that SET NAMES should be issued again.  Therefore, if the connection is restored this way, the character encoding mismatch may occur (and some or all data is garbled or lost). </blockquote>No, really, seriously, you auto-reconnect without setting my connection-specific settings in the new connection? What kind of crack are you smoking at MySQL AB!? 
