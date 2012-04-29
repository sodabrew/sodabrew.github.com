---
layout: post
title: Saved by Foremost
mt_id: 25
date: 2005-05-28 17:50:32.000000000 -07:00
---
Many of the indirect blocks on the filesystem were hosed, so a big, big chunk of data cannot be organized back into a coherent chunk. *sigh* Making things worse is that there's a filesystem-in-a-filesystem, because the backup image has an older backup image in it. So even with indirect block searches, there's no way to know which filesystem's block offsets you're looking at. <a href="http://formost.sf.net/">Foremost</a> is the tool that scanned the data and recovered a goodly many of my pictures.

For the future, everyone should be using XFS, and regularly running `xfs_fsr` which comes from the xfsdump package. It reorganizes a file's blocks so that they are contiguous. Apparently it's a daily cron job on IRIX. Make it part of your life on Linux.
