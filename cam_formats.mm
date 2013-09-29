// This micro program prints out all connected camera devices' native capture 
// formats as they present them to the OS. 
// In a way, it's like v4l2-ctl --list-formats-ext command in Linux, iterating
// over all connected devices.
// Needs AVFoundation framework in the system, and that in turn implies a
// version of Mac Os X > 10.6.

#import <AVFoundation/AVFoundation.h>

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
      for (AVCaptureDeviceFormat* currdf in device.formats)
        NSLog(@"Capture format: %@ ", currdf);
    }
  }
}
