---
layout: post
title: Summer of Code 2006
mt_id: 37
date: 2006-04-28 13:00:57.000000000 -07:00
---
I'm planning on putting out a few proposals to get into the SoC 2006. I had hoped to get TWIG in as a mentor, but that didn't go through. So I'll take a tangent, and definitely see if there's other good PHP work that can benefit everyone. My ideas are:

<a href="http://summer.cs.pdx.edu/?q=node/12">Portland State University</a>: Open to "projects that might fall through the cracks" -- I'm going to pitch XIDLE/XCB, TWIG and the network monitoring integration.

<a href="http://xorg.freedesktop.org/wiki/SummerOfCodeIdeas">X.Org:</a>  See if they'll go for my XIDLE request to get that working again. Otherwise, check out their XCB stuff. I'd like to learn it!

<a href="http://dev.joomla.org/content/view/1360/85/">Joomla</a>: wants to do a phpGACL layer, a DB abstraction layer and an AJAX layer. I'm good for all of those. I'm not sure if I want to be reporting to this project, although the work looks good.

<a href="http://wiki.horde.org/SummerOfCode2006">Horde</a> LDAP Browser / Manager: Develop a Horde LDAP application capable of both browsing and managing an LDAP directory. Should also support importing and exporting LDIF files. Now this would just be funny. Basically I'd port/rewrite my TWIG ldap browser into Horde. Or maybe is funny-sad :-\

<a href="http://www.postgresql.org/developer/summerofcode">PostgreSQL:</a> PL/PHP Build Improvments: PL/PHP is a PHP based procedural language for PostgreSQL. This project would clean up memory usage and the plphp_proc_desc struct, be built without Apache's SAPI module, allow large resultsets to be processed through transparent use of prefetching on a cursor when spi_exec is called, and support IN/OUT and named parameters.

Proposal <a href="http://www.perlfoundation.org/gc/grants/proposals.html">guidelines</a> and <a href="http://mediawiki.blender.org/index.php/BlenderDev/SoCIKProposal">example.</a>
