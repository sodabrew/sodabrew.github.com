---
layout: post
title: Plugin Strategies in Open Source, Part 2
mt_id: 66
date: 2008-06-04 16:28:50.000000000 -07:00
---
In any project, feature-creep can be a problem. In an open source project, this
can be particularly acute when there are few developers. Worse yet, someone
becomes super-active just until their major new feature lands and then they
disappear! And then there's the problem of noisy people who won't stop whining
about getting some peculiar feature, or some major new functionality, either or
both of which are just not interesting to anybody else.

An effective plugin strategy actually embraces these people and their pet
features, providing a mechanism for decoupling code from the code project, yet
allowing key features to be injected into the running system from a separate
and contained plugins area. Note the words <em>separate</em> and
<em>contained</em>. Both are very important.

The plugins area must be separate because you want to protect the clear
messaging of your application's features. You also want to keep plugins
separate because there can be a tendency to make <em>everything</em> a plugin.
Don't. Just don't. Really. Core features are core. They are not plugins. Nobody
wants a framework that does nothing until you've loaded a jillion plugins into
it in order to create a working application. So separate is a double-edged
sword: keep the non-essential stuff away from the core applications, and keep
all the essential stuff inside the core application. Sometimes it means
swallowing a plugin into the app. If it makes sense, do it.

The plugins must be contained. And, ideally, also self-contained. That is, you
have a directory like '/your/app/plugins/some_crappy_plugin' for each plugin.
The plugins are contained within '/your/app/plugins' and each one is further
self-contained another directory level below that. Then, provide an API that
allows the plugins to act at a distance. Yes, act at a distance. Normally this
is something that you don't want because it is hard to figure out. But in the
case of plugins, it is just right. The plugin does not need to patch into the
main app code, but rather register itself with the main app and declare which
of its functions should be called from which parts of the main app. It's
runtime integration, runtime configurability, and runtime enable/disable. Sure
it can be slower. But it's so much better than having people distributing
patches that implement their functionality by hacking up your beautiful code.
