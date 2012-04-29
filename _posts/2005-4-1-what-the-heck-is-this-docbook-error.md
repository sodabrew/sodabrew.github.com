---
layout: post
title: What the heck is this DocBook error?
mt_id: 17
date: 2005-04-01 10:52:36.000000000 -08:00
---
I DocBookified the TWIG manual, but I can't compile it due to some strange errors that don't appear to be coming from the DTD...

<code>jade -t tex -V tex-backend 
        -d print.dsl 
        /usr/share/sgml/xml.dcl AdminManual.db
jade:AdminManual.db:3:57:E: URL not supported by this version
jade:print.dsl:1:0:E: end of document in prolog
jade:E: specification document does not have the DSSSL architecture as a base architecture
make: *** [AdminManual.tex] Error 1</code>
