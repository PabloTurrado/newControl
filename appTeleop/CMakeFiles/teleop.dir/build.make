# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 2.8

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canoncical targets will work.
.SUFFIXES:

# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list

# Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E remove -f

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/alex/gitControl

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/alex/gitControl

# Include any dependencies generated for this target.
include appTeleop/CMakeFiles/teleop.dir/depend.make

# Include the progress variables for this target.
include appTeleop/CMakeFiles/teleop.dir/progress.make

# Include the compile flags for this target's objects.
include appTeleop/CMakeFiles/teleop.dir/flags.make

appTeleop/CMakeFiles/teleop.dir/teleop.cpp.o: appTeleop/CMakeFiles/teleop.dir/flags.make
appTeleop/CMakeFiles/teleop.dir/teleop.cpp.o: appTeleop/teleop.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /home/alex/gitControl/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object appTeleop/CMakeFiles/teleop.dir/teleop.cpp.o"
	cd /home/alex/gitControl/appTeleop && /usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/teleop.dir/teleop.cpp.o -c /home/alex/gitControl/appTeleop/teleop.cpp

appTeleop/CMakeFiles/teleop.dir/teleop.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/teleop.dir/teleop.cpp.i"
	cd /home/alex/gitControl/appTeleop && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/alex/gitControl/appTeleop/teleop.cpp > CMakeFiles/teleop.dir/teleop.cpp.i

appTeleop/CMakeFiles/teleop.dir/teleop.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/teleop.dir/teleop.cpp.s"
	cd /home/alex/gitControl/appTeleop && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/alex/gitControl/appTeleop/teleop.cpp -o CMakeFiles/teleop.dir/teleop.cpp.s

appTeleop/CMakeFiles/teleop.dir/teleop.cpp.o.requires:
.PHONY : appTeleop/CMakeFiles/teleop.dir/teleop.cpp.o.requires

appTeleop/CMakeFiles/teleop.dir/teleop.cpp.o.provides: appTeleop/CMakeFiles/teleop.dir/teleop.cpp.o.requires
	$(MAKE) -f appTeleop/CMakeFiles/teleop.dir/build.make appTeleop/CMakeFiles/teleop.dir/teleop.cpp.o.provides.build
.PHONY : appTeleop/CMakeFiles/teleop.dir/teleop.cpp.o.provides

appTeleop/CMakeFiles/teleop.dir/teleop.cpp.o.provides.build: appTeleop/CMakeFiles/teleop.dir/teleop.cpp.o

appTeleop/CMakeFiles/teleop.dir/glutapp.cpp.o: appTeleop/CMakeFiles/teleop.dir/flags.make
appTeleop/CMakeFiles/teleop.dir/glutapp.cpp.o: appTeleop/glutapp.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /home/alex/gitControl/CMakeFiles $(CMAKE_PROGRESS_2)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object appTeleop/CMakeFiles/teleop.dir/glutapp.cpp.o"
	cd /home/alex/gitControl/appTeleop && /usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/teleop.dir/glutapp.cpp.o -c /home/alex/gitControl/appTeleop/glutapp.cpp

appTeleop/CMakeFiles/teleop.dir/glutapp.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/teleop.dir/glutapp.cpp.i"
	cd /home/alex/gitControl/appTeleop && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/alex/gitControl/appTeleop/glutapp.cpp > CMakeFiles/teleop.dir/glutapp.cpp.i

appTeleop/CMakeFiles/teleop.dir/glutapp.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/teleop.dir/glutapp.cpp.s"
	cd /home/alex/gitControl/appTeleop && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/alex/gitControl/appTeleop/glutapp.cpp -o CMakeFiles/teleop.dir/glutapp.cpp.s

appTeleop/CMakeFiles/teleop.dir/glutapp.cpp.o.requires:
.PHONY : appTeleop/CMakeFiles/teleop.dir/glutapp.cpp.o.requires

appTeleop/CMakeFiles/teleop.dir/glutapp.cpp.o.provides: appTeleop/CMakeFiles/teleop.dir/glutapp.cpp.o.requires
	$(MAKE) -f appTeleop/CMakeFiles/teleop.dir/build.make appTeleop/CMakeFiles/teleop.dir/glutapp.cpp.o.provides.build
.PHONY : appTeleop/CMakeFiles/teleop.dir/glutapp.cpp.o.provides

appTeleop/CMakeFiles/teleop.dir/glutapp.cpp.o.provides.build: appTeleop/CMakeFiles/teleop.dir/glutapp.cpp.o

# Object files for target teleop
teleop_OBJECTS = \
"CMakeFiles/teleop.dir/teleop.cpp.o" \
"CMakeFiles/teleop.dir/glutapp.cpp.o"

# External object files for target teleop
teleop_EXTERNAL_OBJECTS =

appTeleop/teleop: appTeleop/CMakeFiles/teleop.dir/teleop.cpp.o
appTeleop/teleop: appTeleop/CMakeFiles/teleop.dir/glutapp.cpp.o
appTeleop/teleop: appTeleop/CMakeFiles/teleop.dir/build.make
appTeleop/teleop: appTeleop/CMakeFiles/teleop.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking CXX executable teleop"
	cd /home/alex/gitControl/appTeleop && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/teleop.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
appTeleop/CMakeFiles/teleop.dir/build: appTeleop/teleop
.PHONY : appTeleop/CMakeFiles/teleop.dir/build

appTeleop/CMakeFiles/teleop.dir/requires: appTeleop/CMakeFiles/teleop.dir/teleop.cpp.o.requires
appTeleop/CMakeFiles/teleop.dir/requires: appTeleop/CMakeFiles/teleop.dir/glutapp.cpp.o.requires
.PHONY : appTeleop/CMakeFiles/teleop.dir/requires

appTeleop/CMakeFiles/teleop.dir/clean:
	cd /home/alex/gitControl/appTeleop && $(CMAKE_COMMAND) -P CMakeFiles/teleop.dir/cmake_clean.cmake
.PHONY : appTeleop/CMakeFiles/teleop.dir/clean

appTeleop/CMakeFiles/teleop.dir/depend:
	cd /home/alex/gitControl && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/alex/gitControl /home/alex/gitControl/appTeleop /home/alex/gitControl /home/alex/gitControl/appTeleop /home/alex/gitControl/appTeleop/CMakeFiles/teleop.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : appTeleop/CMakeFiles/teleop.dir/depend

