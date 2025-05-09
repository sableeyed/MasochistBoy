#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <SDL3/SDL.h>
#include <SDL3/SDL_video.h>
#include <windows.h>

int main(int argc, char **argv) {

    SDL_Window *window;
    bool done = false;

    SDL_Init(SDL_INIT_VIDEO);

    window = SDL_CreateWindow("MasochistBoy", 640, 480, SDL_WINDOW_OPENGL);

    if(NULL == window) {
        SDL_LogError(SDL_LOG_CATEGORY_ERROR, "Window could not be created! SDL_Error: %s\n", SDL_GetError());
        return 1;
    }

    /*
     * not portable which kinda defeats the purpose of SDL and cross platform..
    */

    HWND mboyHwnd = FindWindow(NULL, "MasochistBoy");

    if(mboyHwnd) {
        HMENU hMenuBar = CreateMenu();
        HMENU hMenu = CreateMenu();
        AppendMenu(hMenu, MF_STRING, 1, "About");
        AppendMenu(hMenu, MF_STRING, 2, "Exit");
        AppendMenu(hMenuBar, MF_POPUP, (UINT_PTR) hMenu, "File");
        SetMenu(mboyHwnd, hMenuBar);
    }

    while(!done) {
        SDL_Event event;
        while(SDL_PollEvent(&event)) {
            if(event.type == SDL_EVENT_QUIT) {
                done = true;
            }
        }
    }

    SDL_DestroyWindow(window);

    SDL_Quit();

    return 0;
}