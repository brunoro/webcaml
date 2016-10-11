#include "opencv2/opencv.hpp"
#include <string>

extern "C" {
  cv::VideoCapture *createCapture(int index) 
  { 
    return new cv::VideoCapture(index);
  }

  void queryFrame(cv::VideoCapture *cap, cv::Mat *frame)
  {
    *cap >> *frame;
  }

  void showImage(std::string name, cv::Mat *frame)
  {
    cv::namedWindow(name, 1);
    cv::imshow(name, *frame);
  }

  int waitKey(int sec)
  {
    return cv::waitKey(sec);
  }

  cv::Mat *createFrame()
  {
    return new cv::Mat();
  }
}

/*
int main(int, char**)
{
  cv::VideoCapture *cap = createCapture(0);
  cv::Mat *frame = createFrame();
  for(;;)
  {
    queryFrame(cap, frame);
    showImage("img", frame);
    if(waitKey(30) >= 0) break;
  }

  return 0;
}
*/
