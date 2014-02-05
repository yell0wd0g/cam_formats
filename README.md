cam_formats
===========

Command line micro utility to print out Mac cameras native capture formats as they are presented to the OS. In a way, it's like `v4l2-ctl --list-formats-ext` command in Linux, iterating over all connected devices.

Needs AVFoundation framework in the system, and that in turn implies a version of Mac Os X > 10.6.

It also prints the name of other type of devices (microphones) and their formats.

