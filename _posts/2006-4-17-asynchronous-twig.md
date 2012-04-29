---
layout: post
title: Asynchronous TWIG
mt_id: 36
date: 2006-04-17 09:20:14.000000000 -07:00
---
Last week I got an itch to learn something about AJAX, and procrastinate a little bit on some work. I started out by trying to find some useful springboard to get into AJAXland, but discovered that a) most of the PHP toolkits for AJAX are really big and foreboding, and b) JSON notation is the new preferred X format in AJAX. So we'll call it Ajax and Jason, I guess.

After a while, I scoped out a few bare-bones tutorials and hacked together my own script in their fashion. Then I found a Jason converter for PHP that follows the semantics of what will probably be a pair of PHP built-ins, json_encode and json_decode. Simple as that. Pass in an array and it spits out the array in Jason, ready for consumption by your JavaScript. Well, about six hours of hacking later, I now have TWIG 4's data tables slurping data asynchronously from Jason modules. Model-View separation suddenly became incredibly easy! In fact, when I copy-pasted code from the Wiki feature, the first to get its Jason upgrade, into the Mail feature, and tied it together with a simple public domain tree system, it pulled up my mailboxes but showed me the contents of the Wiki system! Wait, that's good! It took just five keystrokes to switch the request over to grab data from Mail :-)
