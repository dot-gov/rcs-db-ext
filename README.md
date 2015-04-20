# rcs-db-ext
External libraries, huge binaries, all the big, heavy things on which _rcs_ depends.


## Content

* Java
* Pyhton
* Ruby
* nsis
* nowto - A must read guide on how to setup your Windows vm machine. Check out the notes for [ruby-2.2.1p85-mingw](howto/ruby-2.2.1p85-mingw/readme.md)

## Add --force the Ruby folder!
Some folders under Ruby contains `.gitignore` files. To avoid losing files when adding
use the command `git add --force`, this will add _all_ the files, even the ones ignored by
any `.gitignore`.


## Tools/Scripts

For debugging and development purpose.

* _sym-link-rcs-common_: Create (or delete) a symlink from your _rcs-common_ repository
  (that should be found at ../rcs-common) to the _gems_ folder.
