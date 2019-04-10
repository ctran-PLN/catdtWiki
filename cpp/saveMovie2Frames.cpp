#include <iostream>
#include <sys/stat.h>
#include <sys/types.h>
using namespace std;

#include <opencv2/imgcodecs.hpp>
#include <opencv2/videoio.hpp>
using namespace cv;

void save_frame(Mat &frame, int &frameNum, const string &frameName, const string &output){

    string filePath = output + "/" +  frameName +"_"+  to_string(frameNum)+ ".jpg";
    imwrite(filePath, frame);
}
void extract_frames(const string &frameName, const string &videoFilePath, const string &output){
    //open video file
    VideoCapture cap(videoFilePath);
   
    if(!cap.isOpened())  // check if we succeeded
        throw "Can NOT open video file "+videoFilePath;
    for(int i=0;i<1000;i++)
    {
        cout << "Reading frame " << i << endl;
        Mat frame;
        cap >> frame; // get frame from video
        cout << "Saving frame " << i << endl;
        save_frame(frame, i, frameName, output);
    }
}

int main(int argc, char * argv[]){
    if(argc == 1){
        cout << "Example: " << argv[0] << " <FrameName> <path>/video.mp4 <path>/myOutput" << endl;
        return -1;
    }
    // check frameName
    if(argv[1] == NULL){
        cout << "Missing frameName!" << endl;
        return -1;
    }
    // check input video Path
    if(argv[2] == NULL){
        cout << "Missing videoFilePath!" << endl;
        return -1;
    }
    // check output path
    if(argv[3] == NULL){
        cout << "Missing outputPath!" << endl;
        return -1;
    }
    // create output if not exist
    if (mkdir(argv[3], 0777) == -1)
        cout << "Directory "<< argv[3] << " existed." << endl;
    else
        cout << "Directory "<< argv[3] << " created." << endl;
    
    extract_frames(argv[1], argv[2], argv[3]);
    cout << "Output folder in "<< argv[3] << endl;
    return 0;
}
