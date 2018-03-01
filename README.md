![](jodtinycube.png) [`joddumps` README](http://bakerjd99.wordpress.com/the-jod-page/)
====================================================================================

This repository holds [JOD](http://bakerjd99.wordpress.com/the-jod-page/) dictionary dump scripts. 

A JOD 
[dump script](https://docs.google.com/document/d/1lk6Ua6qqcphlL7PYXeYeAsEsax31kCn2C0Do87vzc1M/edit?hl=en_US&pli=1) 
is a serialized ASCII script that may be used to create, update or archive
a JOD dictionary database. This repository contains current versions of my working
JOD dictionaries. For more about JOD see the [The JOD Page](http://bakerjd99.wordpress.com/the-jod-page/).

The following example shows how to restore JOD dictionaries from repository dump scripts.
You can get JOD dictionary dump scripts in two ways. You can use Git to pull the scripts 
into a local repository (item 1), or you can use GitHub's Zip download feature (item 0), to grab the
current version of the scripts. For simple testing and exploration the Zip download is
simpler.

0. Use GitHub's Zip download to get the current scripts in one Zip file.
   Extract the files in the Zip file to a local directory like `/jod/joddumps` 
   and proceed to step 2.

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
		
After the dump scripts are loaded into dictionaries they can be opened and used by JOD.

          od ;:'joddev jod utils' [ 3 od ''
	   
	      did ~ 0
        ┌─┬────────────────────────────────────────────────────────────────┐
        │1│┌──────┬──┬─────┬─────┬───────┬───────┬──────┬─────────────────┐│
        │ ││      │--│Words│Tests│Groups*│Suites*│Macros│Path*            ││
        │ │├──────┼──┼─────┼─────┼───────┼───────┼──────┼─────────────────┤│
        │ ││joddev│rw│75   │5    │4      │0      │13    │/joddev/jod/utils││
        │ │├──────┼──┼─────┼─────┼───────┼───────┼──────┼─────────────────┤│
        │ ││jod   │ro│662  │43   │20     │6      │55    │/jod/utils       ││
        │ │├──────┼──┼─────┼─────┼───────┼───────┼──────┼─────────────────┤│
        │ ││utils │ro│330  │7    │17     │0      │9     │/utils           ││
        │ │└──────┴──┴─────┴─────┴───────┴───────┴──────┴─────────────────┘│
        └─┴────────────────────────────────────────────────────────────────┘
     
John Baker
March 1, 2018

