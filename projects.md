---
layout: page
title: Projects
mt_id: 29
date: 2006-03-08 02:10:40.000000000 -08:00
---
<a href="http://modperlite.org/" title="mod_perlite">mod_perlite</a>
mod_perlite is a lightweight Perl interpreter module for Apache. Its purpose is to give the same level of convenience of just naming a file 'yourscript<em>.pl</em>' and Then It Just Works (TM).

<a href="http://danga.com/memcached/" title="memcached">memcached</a>
memcached is a fast, dumb cache, optimized for speed and simplicity. I started working on this project in late 2007 just as the binary protocol was being finalized and needed some serious documentation. I am currently the editor for the memcached protocol informational RFC.

<a href="http://informationgateway.org/" title="TWIG">TWIG</a>
TWIG is a groupware suite in PHP. I've been a primary developer of TWIG since 1999.  The last few years have been really slow, but have picked up again in 2005. In late 2004, I started a rewrite project and it's been moving along pretty steadily. The TWIG website is now running on my "TWIG NG" platform, and works great.

<a href="http://dbmail.org/">DBMail</a>
DBMail is an email storage system with a database backend. I've been a co-maintainer of DBMail since 2001. It can receive email from Sendmail, Postfix, and anything that speaks LMTP, store it to the database, and upon retrieval DBMail speaks IMAP and POP3 protocols. I wrote the LMTP daemon, the ManageSieve daemon, and a bunch of the command line tools, along with general bugfixing and whatnot.

<a href="http://libsieve.sf.net/">libSieve</a>
libSieve is a library implementing RFC 3028 and its extensions for sorting your email. I've been the principal for this project since its inception in 2003. I'm mostly doing this as a supporting library for DBMail, but some other folks have gotten pretty excited about libSieve and there are now three or four downstream applications that rely on libSieve.

<a href="http://flex.sf.net/">Flex</a>
Yes, that legendary Unix lexing tool, updated. I got involved with flex in 2004 when I was looking for a way to make libSieve thread safe. I began working with the 2.5.31 experimental release, and became more involved after the 2.5.33 release, which has been very stable. I'm particularly interested in thread safety and bison interaction, and am responsible for the <tt>yylex_init_extra</tt> function and the <tt>%option extra-type="your_type *"</tt> feature. 
