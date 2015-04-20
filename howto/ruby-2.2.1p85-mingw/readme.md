# Ruby 2.2.1p85

[rubyinstaller-2.2.1.exe](http://dl.bintray.com/oneclick/rubyinstaller/rubyinstaller-2.2.1.exe)

You don't need to download and install it because all the Ruby files and gems are versioned
in this repository. However, if you want to do it, install the ruby installer and then launch the command

  `ruby gems.rb`

It will take care of the following gems:

* **ffi-1.9.8**  
To make ffi 1.9.8 working with Ruby 2.2.1p85 under Windows this [patch](https://github.com/ffi/ffi/commit/4168ef3dbd56a7b52978efb2ff7d0dc448f8f8f1?diff=unified)
has been applied. I suppose versions 1.9.9+ should work without this fix.

* **bcrypt-3.1.10**  
Simply running `gem install bcrypt` will not work (support for Ruby 2.2 on Windows is missing yet)

* **tuple**  
Ruby 2.2.x support has been added here https://github.com/topac/tuple

* **bdb-0.2.6.5**  
You have to install [Berkeley DB 5.1.29](http://download.oracle.com/berkeley-db). You can skip the install package and
extract the file berkeley_db_5.1.29_include.zip into C:\DevKit\local. Then install the gem provided here.

* **sqlite3-1.3.10**  
Support for ruby 2.2.1 on mingw is missing yet

# DevKit

if you need to add/compile/update gems, download and install the DevKit with the command

  `ruby devkit.rb`

The script does all the work! You only have to check at end that the Ruby path
specified in the file `C:\DevKit\config.yaml` is correct.
