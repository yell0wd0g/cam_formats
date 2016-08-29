#!/bin/bash

CC="/Library/Developer/CommandLineTools/usr/bin/clang++"

CMD="$CC cam_formats_avf.mm \
/System/Library/Frameworks/AVFoundation.framework/AVFoundation \
/System/Library/Frameworks/Foundation.framework/Foundation \
/System/Library/Frameworks/CoreMedia.framework/CoreMedia \
-o cam_formats_avf_64b"

echo $CMD
eval $CMD

CMD="$CC cam_formats_avf.mm \
/System/Library/Frameworks/AVFoundation.framework/AVFoundation \
/System/Library/Frameworks/Foundation.framework/Foundation \
/System/Library/Frameworks/CoreMedia.framework/CoreMedia \
-m32 \
-o cam_formats_avf_32b"

echo $CMD
eval $CMD


CMD="$CC cam_formats_qtkit.mm \
/System/Library/Frameworks/QTKit.framework/QTKit \
/System/Library/Frameworks/Foundation.framework/Foundation \
/System/Library/Frameworks/CoreMedia.framework/CoreMedia \
-o cam_formats_qtkit_64b"

echo $CMD
eval $CMD

CMD="$CC cam_formats_qtkit.mm \
/System/Library/Frameworks/QTKit.framework/QTKit \
/System/Library/Frameworks/Foundation.framework/Foundation \
/System/Library/Frameworks/CoreMedia.framework/CoreMedia \
-m32 \
-o cam_formats_qtkit_32b"

echo $CMD
eval $CMD