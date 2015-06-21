BUNDLE=`ruby -r readline -e 'puts $LOADED_FEATURES.grep /readline/'`
OLD=`otool -L $BUNDLE | awk '/libedit/{print $1}'`
NEW=`brew list readline | grep libreadline.dylib`
sudo install_name_tool -change $OLD $NEW $BUNDLE
