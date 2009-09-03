#! /bin/sh
destroot="/usr/local/"
version="5.2.0"
prefix="qwt-"${version}

install_name_tool -id ${destroot}${prefix}/lib/libqwt.${version}.dylib ${destroot}${prefix}/lib/libqwt.${version}.dylib
install_name_tool -change libqwt.5.dylib ${destroot}${prefix}/lib/libqwt.5.2.0.dylib /Developer/Applications/Qt/plugins/designer/libqwt_designer_plugin.dylib
