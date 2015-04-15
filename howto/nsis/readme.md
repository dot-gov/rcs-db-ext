# NSIS

Is in the folder ```nsis/nsis``` so you don't need to install it anymore. It works on Windows and on OSX using _Wine_.

__NOTE: Some files were removed from the version that you can find in this repository (to keep it smaller).__

By the way, for documentation purpose, here's a guide on how to install it:

### Install on Windows

1. Download version 2.46 here http://prdownloads.sourceforge.net/nsis/nsis-2.46-setup.exe?download and intall it

2. Download the [special build](http://nsis.sourceforge.net/Special_Builds) with the _advanced logging_ feature here http://prdownloads.sourceforge.net/nsis/nsis-2.46-log.zip?download

3. Replace the file _makensis.exe_ and the folder _Stubs_

4. We use some plugins that can be found here http://nsis.sourceforge.net/Category:Plugins
These plugins are: AdvSplash, Banner, BgImage, Dialer, EnumINI, ExecDos, ExecDos64, InstallOptions, LangDLL, Math, NSISdl, NSISpcre, SimpleFC, SimpleSC, Splash, StartMenu, System, TypeLib, UserInfo, VPatch, md5dll, nsDialogs, nsExec.


### Install on Mac OSX

1. Follow the instructions for Windows but call _makensis.exe_ with _Wine_

