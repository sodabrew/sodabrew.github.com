---
layout: post
title: Convert a Postfix queue to mbox format
mt_id: 90
date: 2009-10-12 20:48:05.000000000 -07:00
---
Today I wanted to convert the contents of my postfix 'deferred' queue, which
was all spam stuck in my MTA, to mbox format so that I could feed it into
various spam-learning systems.

First I converted my Postfix queue to human-readable format with postcat:

{% highlight sh %}
cd /var/spool/postfix/deferred
mkdir spam
for i in {0..9} {A..F}; do mkdir spam/$i; done
for i in `ls */*`; do postcat $i > spam/$i; done
{% endhighlight %}

This made a copy of each file in postcat format, but that's only halfway there
-- postcat has its own output format that isn't anything like an mbox or a
maildir. Inspecting the output, and brushing up on my sed, I came up with this:

{% highlight sed %}
sed -n '
  /^\*\*\* ENVELOPE/,/^\*\*\* MESSAGE CONTENTS/ {
    /^message_arrival_time:/ {
      s/^message_arrival_time: \(.*\)$/\1/
      h
    }
    /^sender:/ {
      s/^sender: \(.*\)$/\1/
      H
      g
      s/\(.*\)\n\(.*\)/From \2 \1/
      p
    }
  }
  /^\*\*\* MESSAGE CONTENTS/,/^\*\*\* HEADER EXTRACTED/ {
    /^\*\*\* MESSAGE CONTENTS/ d
    s/^\*\*\* HEADER EXTRACTED.*$//
    s/^\(>*From \)/>\1/
    p
}' -
{% endhighlight %}

A final pass over all of the messages, and I had my mbox file to train SpamAssassin with:

{% highlight sh %}
for i in `ls */*`; do sh mkmbox.sh < $i >> spam.mbox; done
sa-learn --spam --mbox spam.mbox
{% endhighlight %}
