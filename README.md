vim-livereload
==============

Vim extension to interact with the livereload browser plugin on every save.

Vim-Livereload automatically starts when you start vim. Simply press
the livereload button in your browser and everything should work.

Due to Vim's ruby integration sometimes upon the first save livereload
doesn't work, but the second save and all following work fine then.

## Installation

If you use Janus (which you should) simply go into your ~/.janus
directory, clone the repository and run ***rake*** inside it.

Now when opening vim you can connect from your livereload browser
extension.

##Update
Run ***rake*** in the vim-livereload folder of your .janus folder.

##Prerequisites
Vim needs to be compiled with ruby support
