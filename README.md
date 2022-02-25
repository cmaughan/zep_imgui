# Zep/ImGui

![Screenshot](https://github.com/cmaughan/zep_imgui/tree/main/screenshots/screenshot.png)

This example shows two approaches to integrating Zep into an existing ImGui app.  Either as a single header include, or as a library.  Either way Zep is included as a submodule.
The base app is a simple Vulkan+SDL2+ImGui demo.  The Zep editor has been added to this foundation, but any ImGui backend will work.
To see the integration look in the following changelist to see what is required:
https://github.com/cmaughan/zep_imgui/commit/0f623e8b38f725473e9b7e34a3abdad5c0d92e74

The process to integrate Zep should take no more than an hour or so.  Any problems, please ask :)

Key Points:
- The editor.cpp/.h files abstract the interaction with Zep and contain the useful boilerplate
- The main.cpp has been modified to create/display/destroy zep.
- The font chosen works better than the default.
- This demo is scaled for High DPI; your mileage may vary ;)
- Make sure zep can find the zep.cfg to get the theming right.  The demo does this by making a #define that points to the root of the project
- Look at the defines in CMakeLists: 
    - To include Zep as a compiled library, uncomment this:
        #set (ZEP_LIB 1) 
    - The demo is designed for SDL integration:
        add_definitions(-DZEP_USE_SDL)
    - You want this, unless you want to present a different list of files to Zep:
        add_definitions(-DZEP_FEATURE_CPP_FILE_SYSTEM)

This example is currently windows only; but Zep is cross platform and apart from setting up config/prebuild scripts on linux, the process is the same.
The config.bat file is setup for Visual Studio 2022; modify as appropriate.

To build:
- Run prebuild.bat in the root directory.  This will install all the necessary packages
- Run config.bat to make the project.
- Run build.bat


