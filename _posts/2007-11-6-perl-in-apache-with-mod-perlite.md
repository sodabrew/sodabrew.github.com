---
layout: post
title: Perl in Apache with mod_perlite
mt_id: 59
date: 2007-11-06 14:10:12.000000000 -08:00
---
<p>Lately at <a href="http://sixapart.com/">work</a> a few folks have been batting around possible solutions to the perceived problem of how hard it is to run Perl code from Apache. Of course there are very good solutions, mod_cgi, mod_fastcgi, and best of all mod_perl. But there are very good reasons why web hosts shy away from CGI, and why they're deathly afraid of FastCGI and mod_perl. In a nutshell, it all comes down to persistence. PHP is incredibly popular because there <em>is no persistence!</em></p>

<p> <a href="http://majordojo.com/2007/11/how-to-fix-cgi.php">Byrne Reese</a> had the idea of taking mod_php and ripping out the calls to the PHP interpreter, replacing them with a Perl interpreter. "I don't think it's quite that simple..." I said. But Byrne was 80% correct. The other 20% is grabbing the Apache - PerlIO layer from mod_perl and using that to shovel data from STDIN and STDOUT in and out of the Perl script. The resulting code is pretty simple!

</p><p> <a href="http://code.sixapart.com/svn/mod_perlite/">mod_perlite</a> is over at the Six Apart open source code repository, and I've been working on it off and on for just a few days. It builds, loads into Apache extremely simply, and returns "Just Another Perl Hacker" anytime you try to get a page that ends in ".pl"</p>

<p> Fundamentally, mod_perlite tries not to solve all your problems. It is specifically targeted at being 80% good at the 80% problem. With luck, we'll be able to get it onto 64% of web servers like PHP and pals.</p>
<p>
 To Do:<ul id="null">	<li>Thrash at the Apache - PerlIO interface some more.</li>	<li>Develop a script caching model (ala Zend Accelerator or APC).</li>	<li>Add a script run-timer to kill long-running scripts (ala PHP's max_execution_time limit).</li></ul></p>
