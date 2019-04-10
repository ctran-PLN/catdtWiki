#include <iostream>
#include <dirent.h>
#include <regex>
using namespace std;

#include <opencv2/videoio.hpp>
#include <opencv2/core/core.hpp>
#include <opencv2/highgui/highgui.hpp>
using namespace cv;

bool way2sort(string &f1, string &f2)
{
    /** for sorting asc template <someTextMaybeDigit_number.extension> **/
    regex re("[A-za-z0-9]+_+(\\d+)\\.");
    smatch m;
    int f1_num = 0,f2_num = 0;
    // extract frame int from string
    if(regex_search (f1,m,re)) {
        f1_num = stoi(m[m.size()-1]);
    }
    if(regex_search (f2,m,re)) {
        f2_num = stoi(m[m.size()-1]);
    }
    // flip logical sign for desc
    return f1_num < f2_num;
}
vector<string> sortFramesSeq(DIR *fileDir)
{
    // get list of files and sort it by sequence
    string f_name;
    vector<string> fList;
    while (dirent*  pdir = readdir(fileDir)) {
        f_name = (*pdir).d_name;
        if (f_name.at(0)  != '.')
        {
            fList.push_back(f_name);
        }
    }
    // sort files for sequenced frames
    sort(fList.begin(), fList.end(), way2sort);
    
    return fList;
}
int main(int argc, char * argv[]){
    // trigger function help
    if(argc == 1){
        cout << "Example: " << argv[0] << " <path>/folderWithFrames <path>/yourVideoName.avi" << endl;
        return -1;
    }
    // check input frames folder
    if(argv[1] == NULL){
        cout << "Missing input frames folder!" << endl;
        return -1;
    }
    string folder = argv[1];
    // check output video Path
    if(argv[2] == NULL){
        cout << "Missing output video Path!" << endl;
        return -1;
    }
    string output = argv[2];
    
    // check folder exist
    DIR*     dir =opendir(folder.c_str());
    if(!dir){
        cout << "Directory does NOT exist!" << endl;
        return -1;
    }
    // make sure frames seq in order
    vector<string> fList = sortFramesSeq(dir);
    
    string fPath;
    // Define the codec and create VideoWriter object.The output is stored in 'outcpp.avi' file.
    VideoWriter video(output,CV_FOURCC('M','J','P','G'),24, Size(1424,1088));
    Mat frame;
    for(int i=1; i < fList.size(); i++)
    {
        fPath = folder + "/" + fList[i];
        cout << "Writing " << fPath << endl;
        
        frame = imread(fPath, CV_LOAD_IMAGE_COLOR);
        if(frame.empty())
        {
            cout << "No file" << endl;
        }
        video << frame;
        // Display the resulting frame
        //imshow( "Frame", frame );
        //waitKey(25);
    }
    return 0;
    
}
