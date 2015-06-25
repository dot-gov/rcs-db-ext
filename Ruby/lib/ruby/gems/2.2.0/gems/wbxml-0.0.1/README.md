# wbxml

http://wbxml.rubyforge.org/

Convert XML to WBXML for WAP mobile phone services
wbxml is a simple Ruby wrapper for the wbxml2 library.

## Features

* libwbxml are bundled with the repo (no need to do extra work to install the gem)
* Added support for __ruby 1.9+__ (dropped support for ruby 1.8+)
* Added support for __Windows__. You need to place [expat libraries and headers](http://sourceforge.net/projects/mingw/files/MinGW/Extension/expat/expat-2.0.1-1/libexpat-2.0.1-1-mingw32-dev.tar.gz/download) into your DevKit folder first.

## Usage

```ruby
require 'wbxml'

# WBXML.xml_to_wbxml(...) converts XML to WBXML
# WBXML.wbxml_to_xml(...) converts WBXML to XML

xml = <<END
<?xml version="1.0"?>
<!DOCTYPE si PUBLIC "-//WAPFORUM//DTD SI 1.0//EN" "http://www.wapforum.org/DTD/si.dtd">
<si>
  <indication href="http://wap.yahoo.com">
    m-Qube Msg
  </indication>
</si>
END

w = WBXML.xml_to_wbxml(xml)

=> "\003\005j\000E\306\f\003wap.yahoo.com\000\001\003m-Qube Msg\000\001\001"

```

## License

MIT

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
'Software'), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
