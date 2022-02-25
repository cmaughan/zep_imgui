@echo off

echo %Time%

if not exist "..\vcpkg\" (
  echo Download vcpkg from github
  git clone --single-branch --branch master https://github.com/Rezonality/vcpkg.git ..\vcpkg
  if not exist "..\vcpkg\vcpkg.exe" (
    cd ..\vcpkg 
    call bootstrap-vcpkg.bat -disableMetrics
    cd %~dp0
  )
)

cd ..\vcpkg
echo Installing Libraries 
vcpkg install freetype sdl2[vulkan] imgui[sdl2-binding,freetype,vulkan-binding,docking-experimental] vulkan --triplet x64-windows-static-md --recurse
cd %~dp0

echo %Time%

