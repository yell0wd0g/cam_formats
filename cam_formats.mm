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

  NSBundle* avFoundationBundle = [NSBundle
     bundleWithPath:@"/System/Library/Frameworks/AVFoundation.framework"];
  [avFoundationBundle load];
  NSArray* devices = [[avFoundationBundle classNamed:@"AVCaptureDevice"]
     devices];
  for (AVCaptureDevice* device in devices) {
    if ([device hasMediaType:AVMediaTypeVideo] ||
        [device hasMediaType:AVMediaTypeMuxed]){
      NSLog(@"-------------------- %@ ---------------", [device localizedName]);
      // Array of formats supported natively by the camera/mic hardware.
      for (AVCaptureDeviceFormat* currdf in device.formats){
        NSLog(@"Capture format: %@ ", currdf);

        /*
        // FourCharCode is from generic Foundation.h
        // The APIs preceded by CMFormatDescription are media-agnostic.
        // Coming from CMFormatDescription.h CMPixelFormatType.
        FourCharCode pixelformat =
            CMFormatDescriptionGetMediaSubType([currdf formatDescription]);
        switch (pixelformat) {
          case kCMPixelFormat_422YpCbCr8:
            NSLog(@" Media Subtype: 2vuy");
            break;
          case kCMPixelFormat_422YpCbCr8_yuvs:
            NSLog(@" Media Subtype: yuvs");
            break;
        case kCMVideoCodecType_JPEG_OpenDML:
            NSLog(@" Media Subtype: dmb1");
            break;
          default:
            NSLog(@"Media subtype unknown: 0x%x", pixelformat);
        }
        // Loads of extra information behind the "Extensions":
        //NSLog(@"Extensions %@",
        //    CMFormatDescriptionGetExtensions([currdf formatDescription]));

        CMVideoDimensions dims =
            CMVideoFormatDescriptionGetDimensions([currdf formatDescription]);
        NSLog(@" Dimensions %dx%d", dims.width, dims.height);

        for (AVFrameRateRange* framerate in
               [currdf videoSupportedFrameRateRanges]){
          NSLog(@" framerate %f-%f",
                [framerate maxFrameRate], [framerate minFrameRate]);
        }
        */
      }
    } else {
      NSLog(@"-Non video---------- %@ ---------------", [device localizedName]);
      for (AVCaptureDeviceFormat* currdf in device.formats)
        NSLog(@"Capture format: %@ ", currdf);
    }
  }
}
