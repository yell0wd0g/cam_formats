MAC OS X command line micro utility to print out capture devices' **native capture formats** as they are presented to the OS. It's a bit like `v4l2-ctl --list-formats-ext` command in Linux.

For the video capture case, it also exercises some selectors, e.g. supported 3A modes (Autofocus, Autoexposure, Autowhitebalance), flash, torch, etc.

Needs either/both QTKit and AVFoundation frameworks in the system. AVFoundation needs Mac Os X > 10.6. 


Run `compile.sh` to compile, this should generate four executables: cam_formats_{qtkit,avf}_{32,64}b

When run, prints the name of other type of devices (microphones) and their formats, e.g.:

```
$./cam_formats_avf_64b
[...]
-------------------- FaceTime HD Camera (Built-in) --------------- 0x1a11000005ac8510 --- bltn
Capture format: <AVCaptureDeviceFormat: 0x7c8704a0> 'vide'/'2vuy' enc dims = 160x120, pres dims = 160x120 { 29.97 25.00 24.00 15.00 fps } 
Capture format: <AVCaptureDeviceFormat: 0x7c870940> 'vide'/'2vuy' enc dims = 176x144, pres dims = 176x144 { 29.97 25.00 24.00 15.00 fps } 
Capture format: <AVCaptureDeviceFormat: 0x7c870b30> 'vide'/'2vuy' enc dims = 320x240, pres dims = 320x240 { 29.97 25.00 24.00 15.00 fps } 
Capture format: <AVCaptureDeviceFormat: 0x7c870d20> 'vide'/'2vuy' enc dims = 352x288, pres dims = 352x288 { 29.97 25.00 24.00 15.00 fps } 
Capture format: <AVCaptureDeviceFormat: 0x7c870f10> 'vide'/'2vuy' enc dims = 480x360, pres dims = 480x360 { 29.97 25.00 24.00 15.00 fps } 
Capture format: <AVCaptureDeviceFormat: 0x7c870200> 'vide'/'2vuy' enc dims = 640x480, pres dims = 640x480 { 29.97 25.00 24.00 15.00 fps } 
Capture format: <AVCaptureDeviceFormat: 0x7c871300> 'vide'/'2vuy' enc dims = 960x540, pres dims = 960x540 { 29.97 25.00 24.00 15.00 fps } 
Capture format: <AVCaptureDeviceFormat: 0x7c8714f0> 'vide'/'2vuy' enc dims = 1024x576, pres dims = 1024x576 { 29.97 25.00 24.00 15.00 fps } 
Capture format: <AVCaptureDeviceFormat: 0x7c8716e0> 'vide'/'2vuy' enc dims = 1280x720, pres dims = 1280x720 { 29.97 25.00 24.00 15.00 fps } 
[...]

-------------------- FaceTime HD Camera --------------- DJH5266R8QBG1HPBV ---
isFocusModeSupported: Locked: nay, Single-shot: nay, Continuous: nay
isExposureModeSupported: Locked: yep, Single-shot: nay, Continuous: yep
isWhiteBalanceModeSupported: Locked: yep, Single-shot: nay, Continuous: yep
Flash: nay
isFlashModeSupported: off: nay, (always) on: nay, auto: nay
Torch: nay
isTorchModeSupported: off: nay, (always) on: nay, auto: nay

```
