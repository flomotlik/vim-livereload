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

##Thx
[Guard-Livereload](https://github.com/guard/guard-livereload) whose code I pretty much copied with slight changes.

Thx to Adam Coffman for his [Explanation on using Ruby support in Vim](https://github.com/thecoffman/Jumpback.vim)

##License
Copyright (c) 2012 Florian Motlik

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
"Software"), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
