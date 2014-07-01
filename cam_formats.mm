// Copyright 2014 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.
//
//
// This utility prints out all connected camera devices' native capture
// formats as they present them to the OS.
// In a way, it's like v4l2-ctl --list-formats-ext command in Linux, iterating
// over all connected devices.
// Needs AVFoundation framework in the system, and that in turn implies a
// version of Mac Os X > 10.6.
//
// Also prints the name of other type of devices and their formats.
//

#import <AVFoundation/AVFoundation.h>
#import <CoreMedia/CoreMedia.h>

int main(){

  //NSBundle* avFoundationBundle = [NSBundle
  //   bundleWithPath:@"/System/Library/Frameworks/AVFoundation.framework"];
  //[avFoundationBundle load];

  //NSArray* devices = [[avFoundationBundle classNamed:@"AVCaptureDevice"]
  //   devices];
  NSArray* devices = [AVCaptureDevice devices];

  NSLog(@" I see %ld devices.", [devices count]);
  for (AVCaptureDevice* device in devices) {
    NSLog(@"-------------------- %@ --------------- %@", 
          [device localizedName], [device uniqueID]);
    for (AVCaptureDeviceFormat* currdf in device.formats)
        NSLog(@"Capture format: %@ ", currdf);
  }
}


