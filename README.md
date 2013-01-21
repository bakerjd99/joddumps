joddumps README
===============

This repository holds [JOD](http://bakerjd99.wordpress.com/the-jod-page/) dictionary dump scripts. 

A JOD 
[dump script](https://docs.google.com/document/d/1lk6Ua6qqcphlL7PYXeYeAsEsax31kCn2C0Do87vzc1M/edit?hl=en_US&pli=1) 
is a serialized ASCII script that may be used to create, update or archive
a JOD dictionary database. This repository contains holds current versions of my working
JOD dictionaries. For more about JOD see the [The JOD Page](http://bakerjd99.wordpress.com/the-jod-page/).

The following example shows hold to restore JOD dictionaries from repository dump scripts.

1. Use Git to pull scripts to a local `joddumps` directory.

        git init
		git remote add joddumps https://github.com/bakerjd99/joddumps.git
		git pull joddumps master
		
2. [Start J](http://www.jsoftware.com/), load JOD and create dictionaries.
   [JOD](http://www.jsoftware.com/jwiki/Addons/general/jod) is a J addon use [JAL](http://www.jsoftware.com/jwiki/JAL) to install it.

        load 'general/jod'
		
        newd 'utils';'c:/users/owner/j64-601/utils'
        newd 'jod';'c:/users/owner/j64-601/jod'
        newd 'joddev';'c:/users/owner/j64-601/joddev'

3. Run the dump scripts:

        od 'utils'
        0!:0 <'c:/joddumps/utils.ijs'
        0 globs&> }. revo ''  NB. rebuilds cross references
        3 od ''

        od ;:'jod utils'
        0!:0 <'c:/joddumps/jod.ijs'
        0  globs&> }. revo '' 
        3 od ''

        od ;:'joddev jod utils'
        0!:0 <'c:/joddumps/joddev.ijs'
        0  globs&> }. revo '' 
        3 od ''

John Baker
January 19, 2013

