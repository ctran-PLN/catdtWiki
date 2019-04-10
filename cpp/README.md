## C++ utils for extracting and building video
These C++ functions are for supporting processing videos and frames at a lower level for performance boost. Treat each function (.cpp) as a script to perform 1 task, and do NOT build them together. In other to run it, you will need to use `gcc` to rebuild it.

* buildFrames2Video: input 1 folder of frame(s) and output 1 video to selected directory.
* saveMovie2Frames: input 1 video and output frame(s) to selected directory.  

### Libraries:
* boost 1.69.0
* opencv2 3.4

### Will add Cmake file in the future for cross-platform development.
