#include <opencv2/opencv.hpp>


extern "C" 
{
  cv::VideoCapture *createCapture(int index) 
  { 
    return new cv::VideoCapture(index);
  }

  void queryFrame(cv::VideoCapture *cap, cv::Mat *frame)
  {
    *cap >> *frame;
  }

  void showImage(cv::Mat *frame)
  {
    cv::namedWindow("img", 1);
    cv::imshow("img", *frame);
  }

  int waitKey(int sec)
  {
    return cv::waitKey(sec);
  }

  cv::Mat *createFrame()
  {
    return new cv::Mat();
  }

  cv::Mat *duplicateFrame(cv::Mat *mat)
  {
    return new cv::Mat(*mat);
  }

  uchar getPixelR(cv::Mat *mat, int x, int y) { return mat->at<cv::Vec3b>(y,x)[2]; }
  uchar getPixelG(cv::Mat *mat, int x, int y) { return mat->at<cv::Vec3b>(y,x)[1]; }
  uchar getPixelB(cv::Mat *mat, int x, int y) { return mat->at<cv::Vec3b>(y,x)[0]; }

  void setPixelR(cv::Mat *mat, int x, int y, uchar r) { mat->at<cv::Vec3b>(y,x)[2] = r; }
  void setPixelG(cv::Mat *mat, int x, int y, uchar g) { mat->at<cv::Vec3b>(y,x)[1] = g; }
  void setPixelB(cv::Mat *mat, int x, int y, uchar b) { mat->at<cv::Vec3b>(y,x)[0] = b; }

  uchar zero() { return 0; }

  int rows(cv::Mat *mat) { return mat->rows; }
  int cols(cv::Mat *mat) { return mat->cols; }
}

/*
int main(int, char**)
{
  cv::VideoCapture *cap = createCapture(0);
  cv::Mat *frame = createFrame();
  for(;;)
  {
    queryFrame(cap, frame);
    for (int x = 0; x < cols(frame); x++)
      for (int y = 0; y < rows(frame); y++)
        setPixelR(frame, x, y, zero());
    
    showImage("img", frame);
    if(waitKey(30) >= 0) break;
  }

  return 0;
}
*/
