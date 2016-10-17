#include <opencv2/opencv.hpp>
#include <SDL.h>

extern "C" 
{
  cv::VideoCapture *createCapture(int index) 
  { 
    cv::VideoCapture *cap = new cv::VideoCapture(index);
    if(!cap || !cap->isOpened())
    {
      SDL_SetError("couldn't initialize camera %d", index);
    }
    return cap;
  }

  void destroyCapture(cv::VideoCapture *cap)
  {
    delete cap;
  }

  SDL_Surface *querySurface(cv::VideoCapture *cap)
  {
    cv::Mat frame;
    bool gotFrame = cap->read(frame);

    if (!gotFrame)
    {
        SDL_SetError("capture returned a NULL frame");
        return NULL;
    }

    // TODO: how to get the correct depth using cv::Mat?
    IplImage iplimage = (IplImage) frame;
    SDL_Surface *surface = SDL_CreateRGBSurfaceFrom(
        (void*)iplimage.imageData,
        iplimage.width, iplimage.height,
        iplimage.depth * iplimage.nChannels, iplimage.widthStep,
        0xff0000, 0x00ff00, 0x0000ff, 0);

    if(!surface)
    {
        SDL_SetError("couldn't convert Mat to Surface");
        return NULL;
    }

    return surface;
  }
}

/*
int main(int, char**)
{
  cv::VideoCapture *cap = createCapture(0);
  if(!cap || !cap->isOpened())
  {
      SDL_Log("Couldn't initialize camera.");
      return 1;
  }

  SDL_Surface *frame;
  do { frame = queryFrame(cap); } while (!frame);

  SDL_Init(SDL_INIT_VIDEO);
  SDL_Window* window;
  SDL_Renderer* renderer;
  SDL_CreateWindowAndRenderer(frame->w, frame->h, 0, &window, &renderer);

  Uint32 start;
  SDL_Event event;
  bool running = true;
  while(running)
  {
    start = SDL_GetTicks();
    while(SDL_PollEvent(&event))
    {
      switch(event.type)
      {
        case SDL_QUIT:
          running = false;
          break;
        case SDL_KEYDOWN:
          switch(event.key.keysym.sym)
          {
            case SDLK_ESCAPE:
              running = false;
              break;
          }
      }
    }

    SDL_Texture *texture = SDL_CreateTextureFromSurface(renderer, frame);
    SDL_RenderCopy(renderer, texture, NULL, NULL);
    SDL_RenderPresent(renderer);

    SDL_FreeSurface(frame);
    frame = queryFrame(cap);
  }
 
  return 0;
}
*/
