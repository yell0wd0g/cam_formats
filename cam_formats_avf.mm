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
#import <IOKit/audio/IOAudioTypes.h>

// Device connection types
const char* TransportTypeAsString(int connection) {
  switch (connection) {
  case kIOAudioDeviceTransportTypeBuiltIn: return "bltn";
  case kIOAudioDeviceTransportTypePCI: return "pci ";
  case kIOAudioDeviceTransportTypeUSB: return "usb ";
  case kIOAudioDeviceTransportTypeFireWire: return "1394";
  case kIOAudioDeviceTransportTypeNetwork: return "ntwk";
  case kIOAudioDeviceTransportTypeWireless: return "wrls";
  case kIOAudioDeviceTransportTypeOther: return "othr";
  case kIOAudioDeviceTransportTypeBluetooth: return "blue";
  case kIOAudioDeviceTransportTypeVirtual: return "virt";
  case kIOAudioDeviceTransportTypeDisplayPort: return "dprt";
  case kIOAudioDeviceTransportTypeHdmi: return "hdmi";
  default: return "unknown";
  }
};

int main() {
  NSArray* devices = [AVCaptureDevice devices];

  NSLog(@" I see %ld devices.", (unsigned long)[devices count]);
  for (AVCaptureDevice* device in devices) {
    NSLog(@"-------------------- %@ --------------- %@ --- %s",
          [device localizedName], [device uniqueID],
          TransportTypeAsString([device transportType]));
    for (AVCaptureDeviceFormat* currdf in device.formats) {
      NSLog(@"Capture format: %@", currdf);
    }
  }

  NSArray* video_devices = [AVCaptureDevice devicesWithMediaType:@"video"];
  for (AVCaptureDevice* device in video_devices) {
    NSLog(@"-------------------- %@ --------------- %@ ---",
          [device localizedName], [device uniqueID]);
    NSLog(@"isFocusModeSupported: Locked: %s, Single-shot: %s, Continuous: %s",
          [device isFocusModeSupported:AVCaptureFocusModeLocked] ? "yep"
                                                                 : "nay",
          [device isFocusModeSupported:AVCaptureFocusModeAutoFocus] ? "yep"
                                                                    : "nay",
          [device isFocusModeSupported:AVCaptureFocusModeContinuousAutoFocus]
              ? "yep"
              : "nay");

    NSLog(
        @"isExposureModeSupported: Locked: %s, Single-shot: %s, Continuous: %s",
        [device isExposureModeSupported:AVCaptureExposureModeLocked] ? "yep"
                                                                     : "nay",
        [device isExposureModeSupported:AVCaptureExposureModeAutoExpose]
            ? "yep"
            : "nay",
        [device
            isExposureModeSupported:AVCaptureExposureModeContinuousAutoExposure]
            ? "yep"
            : "nay");

    NSLog(@"isWhiteBalanceModeSupported: Locked: %s, Single-shot: %s, "
          @"Continuous: %s",
          [device isWhiteBalanceModeSupported:AVCaptureWhiteBalanceModeLocked]
              ? "yep"
              : "nay",
          [device isWhiteBalanceModeSupported:
                      AVCaptureWhiteBalanceModeAutoWhiteBalance]
              ? "yep"
              : "nay",
          [device isWhiteBalanceModeSupported:
                      AVCaptureWhiteBalanceModeContinuousAutoWhiteBalance]
              ? "yep"
              : "nay");

#if TARGET_OS_IPHONE
    // |videoZoomFactor| is marked NS_AVAILABLE_IOS(7_0)
    NSLog(@"videoZoomFactor: %f", [device videoZoomFactor]);
#endif

    NSLog(@"Flash: %s", [device hasFlash] ? "yep" : "nay");
    NSLog(@"isFlashModeSupported: off: %s, (always) on: %s, auto: %s",
          [device isFlashModeSupported:AVCaptureFlashModeOff] ? "yep" : "nay",
          [device isFlashModeSupported:AVCaptureFlashModeOn] ? "yep" : "nay",
          [device isFlashModeSupported:AVCaptureFlashModeAuto] ? "yep" : "nay");
    NSLog(@"Torch: %s", [device hasTorch] ? "yep" : "nay");
    NSLog(@"isTorchModeSupported: off: %s, (always) on: %s, auto: %s",
          [device isTorchModeSupported:AVCaptureTorchModeOff] ? "yep" : "nay",
          [device isTorchModeSupported:AVCaptureTorchModeOn] ? "yep" : "nay",
          [device isTorchModeSupported:AVCaptureTorchModeAuto] ? "yep" : "nay");

#if TARGET_OS_IPHONE
    // These guys are marked NS_AVAILABLE_IOS(8_0)
    NSLog(@"exposureTargetBias: min %f, max %f, current %f",
          device.minExposureTargetBias, device.maxExposureTargetBias,
          device.exposureTargetBias);

    NSLog(@"maxWhiteBalanceGain: %f", device.maxWhiteBalanceGain);

    NSLog(@"Current ISO: %f", device.ISO);
#endif

  }
}


