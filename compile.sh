#!/bin/bash

CMD="../../chromium/src/third_party/llvm-build/Release+Asserts/bin/clang++ cam_formats.mm \
/System/Library/Frameworks/AVFoundation.framework/AVFoundation \
/System/Library/Frameworks/Foundation.framework/Foundation \
/System/Library/Frameworks/CoreMedia.framework/CoreMedia \
-o cam_formats"

echo $CMD
eval $CMD