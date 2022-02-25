# vulkan_imgui_vcpkg_starter
Minimal example of using vcpkg to bootstrap a vulkan/imgui.  Also sets up the high DPI manifest file for Windows (which for now means you might see small UI because the fonts are not scaled)

This would work cross platform if a shell script was added to do the vcpkg bit; I just haven't done it yet.

To build:
- Run prebuild.bat in the root directory.  This will install all the necessary packages
- Run config.bat to make the project.
- Load up VC 2022, open the solution in the build directory, run it.



