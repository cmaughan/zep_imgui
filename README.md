# vulkan_imgui_vcpkg_starter
Minimal example of using vcpkg to bootstrap a vulkan/imgui.  Also sets up the high DPI manifest file for Windows.
A font is loaded, which may be too big for low DPI screens; adjust as appropriate until the code reads the DPI and scales correctly

This would work cross platform if a shell script was added to do the vcpkg bit; I just haven't done it yet.

The CMake creates an config_app.h with the #define for the root of the project.  It also loads the package.

There is just 1 source file which creates the vulkan window and displays the IMGui.  This is the easiest way to bootstrap a 3D/ImGui Vulkan app IMHO 

To build:
- Run prebuild.bat in the root directory.  This will install all the necessary packages
- Run config.bat to make the project.
- Load up VC 2022, open the solution in the build directory, set the main project as the startup project, run it.



