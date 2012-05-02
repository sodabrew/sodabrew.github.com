---
layout: post
title: libSieve hacking
mt_id: 50
date: 2007-07-28 20:00:45.000000000 -07:00
---
Today I spent some time hacking on libSieve for the first time in way too long.
I was telling a friend about the inefficiency of putting all of your keywords
into a lexer because it has to go through tons of state shifts to get to the
terminals. A better way to do it is to match a generic identifier with a
regular expression, then look up the matches in a hash table of keywords. Well,
enough was enough, time for me to do that! The old CMU sieve-lex.l, with 56
keywords each as its own lexer state, yielded this flex -v output:

{% highlight c %}
/bin/sh ../ylwrap sieve-lex.l lex.yy.c sieve-lex.c -- flex -v -s -olex.yy.c
flex version 2.5.33 usage statistics:
scanner options: -svB8 -Cem -olex.yy.c -Plibsieve_sieve
584/2000 NFA states
340/1000 DFA states (737 words)
72 rules
Compressed tables always back-up
Beginning-of-line patterns used
3/40 start conditions
179 epsilon states, 98 double epsilon states
8/100 character classes needed 22/500 words of storage, 0 reused
1235 state/nextstate pairs created
414/821 unique/duplicate transitions
347/1000 base-def entries created
448/2000 (peak 399) nxt-chk entries created
28/2500 (peak 266) template nxt-chk entries created
0 empty table entries
8 protos created
7 templates created, 23 uses
38/256 equivalence classes created
4/256 meta-equivalence classes created
0 (15 saved) hash collisions, 81 DFAs equal
0 sets of reallocations needed
1884 total table entries needed
{% endhighlight %}

After moving the keywords out of sieve-lex.l and into sieve-keywords.gperf,
replacing them all with a generic state,

{% highlight c %}
ident           :?[a-zA-Z_][a-zA-Z_0-9]*
&lt;INITIAL&gt;{ident}        { int k = libsieve_keyword(yytext, yyleng); ... error handling ... }
{% endhighlight %}

the flex -v output reads like this:

{% highlight c %}
flex version 2.5.33 usage statistics:
scanner options: -svB8 -Cem -olex.yy.c -Plibsieve_sieve
146/2000 NFA states
72/1000 DFA states (304 words)
19 rules
Compressed tables always back-up
Beginning-of-line patterns used
3/40 start conditions
79 epsilon states, 50 double epsilon states
11/100 character classes needed 165/500 words of storage, 1 reused
830 state/nextstate pairs created
144/686 unique/duplicate transitions
83/1000 base-def entries created
204/2000 (peak 392) nxt-chk entries created
88/2500 (peak 308) template nxt-chk entries created
0 empty table entries
13 protos created
11 templates created, 35 uses
28/256 equivalence classes created
8/256 meta-equivalence classes created
3 (3 saved) hash collisions, 79 DFAs equal
0 sets of reallocations needed
858 total table entries needed
{% endhighlight %}

Ok, that's better. But what about that one ident with the :? up front? What if it were this:

{% highlight c %}
ident           [a-zA-Z_][a-zA-Z_0-9]*
&lt;INITIAL&gt;{ident}        { int k = libsieve_keyword(yytext, yyleng); ... error handling ... }

&lt;INITIAL&gt;:{ident}        { int k = libsieve_keyword(yytext, yyleng); ... error handling ... }
{% endhighlight %}

And flex -v says:

flex version 2.5.33 usage statistics:
scanner options: -svB8 -Cem -olex.yy.c -Plibsieve_sieve
150/2000 NFA states
73/1000 DFA states (306 words)
20 rules
Compressed tables always back-up
Beginning-of-line patterns used
3/40 start conditions
81 epsilon states, 52 double epsilon states
11/100 character classes needed 165/500 words of storage, 3 reused
844 state/nextstate pairs created
145/699 unique/duplicate transitions
85/1000 base-def entries created
207/2000 (peak 420) nxt-chk entries created
96/2500 (peak 336) template nxt-chk entries created
0 empty table entries
14 protos created
12 templates created, 36 uses
28/256 equivalence classes created
8/256 meta-equivalence classes created
0 (4 saved) hash collisions, 79 DFAs equal
0 sets of reallocations needed
868 total table entries needed
{% endhighlight %}
