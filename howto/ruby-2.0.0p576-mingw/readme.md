# ruby-2.0.0p576 (32bit) on Windows

* Install ruby-2.0.0p576 32bit for Widndows (rubyinstaller-2.0.0-p576)
* Install the 32bit devkit (DevKit-mingw64-32-4.7.2-20130224-1151-sfx)


## tuple 0.1.2

    gem install tuple-0.1.2.gem

_Definiti tipi u_int8_t e u_int32_t in tuple.c_

## bdb 0.2.6.5

First install berkeley-db 4.5 into the DevKit, then run

    gem install bdb-0.2.6.5.gem

_Inserito c:/devkit/local in extconf.rb_

## minitar 0.5.5

    gem install minitar-0.5.5.gem


## eventmachine 1.0.3

The version 1.0.3 MAY NOT compile when installing on windows

    https://stackoverflow.com/questions/17361958/eventmachine-gem-install-fail

So, install it specifying the github repo (https://github.com/eventmachine/eventmachine) in the gemfile.


## ruby-opencv 0.0.10 (not needed)

Simply use the command

    gem install ruby-opencv -v 0.0.10 --platform=x86-mingw32


## bson 2.3.0

Patch the file C:\RCS\Ruby\include\ruby-2.0.0\ruby\win32.h as described here

    https://github.com/mongoid/mongoid/issues/3489#issuecomment-34218208

and then run

    gem install bson