---
layout: post
title: Two request monty for persistent services on non-persistent hosts
mt_id: 60
date: 2007-11-07 12:15:46.000000000 -08:00
---
A problem I've been thinking about for a long time was how to build a backend
service for a stateless web frontend. All of the solutions I have seen involve
building a daemon that lives on the server and holds the persistent data. Or,
in the case of PHP, weird ass service side session cookie things built right
into the language.

The solution I want is a hack that is as full featured as building a daemon and
does not require modifying the operating environment. And today it hit me: the
two request monty.

Here's the setup: you have a script that's running in the web server, it has an
execution time limit, you're allowed to create and listen on sockets. Yes, I'm
thinking of PHP safe mode here. To create the service, your web app makes a
request back to the host web server, spinning up the service script. That
script then creates a socket listening to some local port, tries to increase
its max execution time, sets a timer for just under whatever that time limit
is, writes this information to some common location (typically the database
behind your web app) then begins listening on the socket for requests for
whatever kind of persistent data you need. When the timer fires, the script
makes a request back to the host web server, spinning up a new service script.
The new service spins up on some other port, connects to the first service and
grabs all of its data, then writes its information to the database and begins
serving persistent data to your application.

Total hack beyond hack, but satisfies the requirements: does not require a new
daemon, does not require new modules on the server, runs in safe mode, runs
with time limits.
