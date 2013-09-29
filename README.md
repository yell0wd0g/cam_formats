cam_formats
===========

Command line micro utility to print out Mac cameras native capture formats.

Basically is like a "v4l2-ctl --list-formats-ext" command in Linux systems. Typical output for my laptop:

$./cam_formats
2013-09-29 11:35:19.215 cam_formats[12504:707] -------------------- FaceTime HD Camera (Built-in) ---------------
2013-09-29 11:35:19.216 cam_formats[12504:707] Capture format: <AVCaptureDeviceFormat: 0x7ff1ec20d590> 'vide'/'2vuy' enc dims = 160x120, pres dims = 160x120 { 29.97 25.00 24.00 15.00 fps } 
2013-09-29 11:35:19.217 cam_formats[12504:707] Capture format: <AVCaptureDeviceFormat: 0x7ff1ec20c5f0> 'vide'/'2vuy' enc dims = 176x144, pres dims = 176x144 { 29.97 25.00 24.00 15.00 fps } 
2013-09-29 11:35:19.217 cam_formats[12504:707] Capture format: <AVCaptureDeviceFormat: 0x7ff1ec20cd50> 'vide'/'2vuy' enc dims = 320x240, pres dims = 320x240 { 29.97 25.00 24.00 15.00 fps } 
2013-09-29 11:35:19.218 cam_formats[12504:707] Capture format: <AVCaptureDeviceFormat: 0x7ff1ec20b2a0> 'vide'/'2vuy' enc dims = 352x288, pres dims = 352x288 { 29.97 25.00 24.00 15.00 fps } 
2013-09-29 11:35:19.218 cam_formats[12504:707] Capture format: <AVCaptureDeviceFormat: 0x7ff1ec213c70> 'vide'/'2vuy' enc dims = 480x360, pres dims = 480x360 { 29.97 25.00 24.00 15.00 fps } 
2013-09-29 11:35:19.219 cam_formats[12504:707] Capture format: <AVCaptureDeviceFormat: 0x7ff1ec213c80> 'vide'/'2vuy' enc dims = 640x480, pres dims = 640x480 { 29.97 25.00 24.00 15.00 fps } 
2013-09-29 11:35:19.219 cam_formats[12504:707] Capture format: <AVCaptureDeviceFormat: 0x7ff1ec2140e0> 'vide'/'2vuy' enc dims = 960x540, pres dims = 960x540 { 29.97 25.00 24.00 15.00 fps } 
2013-09-29 11:35:19.219 cam_formats[12504:707] Capture format: <AVCaptureDeviceFormat: 0x7ff1ec2140f0> 'vide'/'2vuy' enc dims = 1024x576, pres dims = 1024x576 { 29.97 25.00 24.00 15.00 fps } 
2013-09-29 11:35:19.220 cam_formats[12504:707] Capture format: <AVCaptureDeviceFormat: 0x7ff1ec214560> 'vide'/'2vuy' enc dims = 1280x720, pres dims = 1280x720 { 29.97 25.00 24.00 15.00 fps } 
