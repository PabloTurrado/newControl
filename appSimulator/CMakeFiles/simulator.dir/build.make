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
include appSimulator/CMakeFiles/simulator.dir/depend.make

# Include the progress variables for this target.
include appSimulator/CMakeFiles/simulator.dir/progress.make

# Include the compile flags for this target's objects.
include appSimulator/CMakeFiles/simulator.dir/flags.make

appSimulator/CMakeFiles/simulator.dir/simulator.cpp.o: appSimulator/CMakeFiles/simulator.dir/flags.make
appSimulator/CMakeFiles/simulator.dir/simulator.cpp.o: appSimulator/simulator.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /home/alex/gitControl/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object appSimulator/CMakeFiles/simulator.dir/simulator.cpp.o"
	cd /home/alex/gitControl/appSimulator && /usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/simulator.dir/simulator.cpp.o -c /home/alex/gitControl/appSimulator/simulator.cpp

appSimulator/CMakeFiles/simulator.dir/simulator.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/simulator.dir/simulator.cpp.i"
	cd /home/alex/gitControl/appSimulator && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/alex/gitControl/appSimulator/simulator.cpp > CMakeFiles/simulator.dir/simulator.cpp.i

appSimulator/CMakeFiles/simulator.dir/simulator.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/simulator.dir/simulator.cpp.s"
	cd /home/alex/gitControl/appSimulator && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/alex/gitControl/appSimulator/simulator.cpp -o CMakeFiles/simulator.dir/simulator.cpp.s

appSimulator/CMakeFiles/simulator.dir/simulator.cpp.o.requires:
.PHONY : appSimulator/CMakeFiles/simulator.dir/simulator.cpp.o.requires

appSimulator/CMakeFiles/simulator.dir/simulator.cpp.o.provides: appSimulator/CMakeFiles/simulator.dir/simulator.cpp.o.requires
	$(MAKE) -f appSimulator/CMakeFiles/simulator.dir/build.make appSimulator/CMakeFiles/simulator.dir/simulator.cpp.o.provides.build
.PHONY : appSimulator/CMakeFiles/simulator.dir/simulator.cpp.o.provides

appSimulator/CMakeFiles/simulator.dir/simulator.cpp.o.provides.build: appSimulator/CMakeFiles/simulator.dir/simulator.cpp.o

appSimulator/CMakeFiles/simulator.dir/glutapp.cpp.o: appSimulator/CMakeFiles/simulator.dir/flags.make
appSimulator/CMakeFiles/simulator.dir/glutapp.cpp.o: appSimulator/glutapp.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /home/alex/gitControl/CMakeFiles $(CMAKE_PROGRESS_2)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object appSimulator/CMakeFiles/simulator.dir/glutapp.cpp.o"
	cd /home/alex/gitControl/appSimulator && /usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/simulator.dir/glutapp.cpp.o -c /home/alex/gitControl/appSimulator/glutapp.cpp

appSimulator/CMakeFiles/simulator.dir/glutapp.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/simulator.dir/glutapp.cpp.i"
	cd /home/alex/gitControl/appSimulator && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/alex/gitControl/appSimulator/glutapp.cpp > CMakeFiles/simulator.dir/glutapp.cpp.i

appSimulator/CMakeFiles/simulator.dir/glutapp.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/simulator.dir/glutapp.cpp.s"
	cd /home/alex/gitControl/appSimulator && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/alex/gitControl/appSimulator/glutapp.cpp -o CMakeFiles/simulator.dir/glutapp.cpp.s

appSimulator/CMakeFiles/simulator.dir/glutapp.cpp.o.requires:
.PHONY : appSimulator/CMakeFiles/simulator.dir/glutapp.cpp.o.requires

appSimulator/CMakeFiles/simulator.dir/glutapp.cpp.o.provides: appSimulator/CMakeFiles/simulator.dir/glutapp.cpp.o.requires
	$(MAKE) -f appSimulator/CMakeFiles/simulator.dir/build.make appSimulator/CMakeFiles/simulator.dir/glutapp.cpp.o.provides.build
.PHONY : appSimulator/CMakeFiles/simulator.dir/glutapp.cpp.o.provides

appSimulator/CMakeFiles/simulator.dir/glutapp.cpp.o.provides.build: appSimulator/CMakeFiles/simulator.dir/glutapp.cpp.o

# Object files for target simulator
simulator_OBJECTS = \
"CMakeFiles/simulator.dir/simulator.cpp.o" \
"CMakeFiles/simulator.dir/glutapp.cpp.o"

# External object files for target simulator
simulator_EXTERNAL_OBJECTS =

appSimulator/simulator: appSimulator/CMakeFiles/simulator.dir/simulator.cpp.o
appSimulator/simulator: appSimulator/CMakeFiles/simulator.dir/glutapp.cpp.o
appSimulator/simulator: appSimulator/CMakeFiles/simulator.dir/build.make
appSimulator/simulator: appSimulator/CMakeFiles/simulator.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking CXX executable simulator"
	cd /home/alex/gitControl/appSimulator && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/simulator.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
appSimulator/CMakeFiles/simulator.dir/build: appSimulator/simulator
.PHONY : appSimulator/CMakeFiles/simulator.dir/build

appSimulator/CMakeFiles/simulator.dir/requires: appSimulator/CMakeFiles/simulator.dir/simulator.cpp.o.requires
appSimulator/CMakeFiles/simulator.dir/requires: appSimulator/CMakeFiles/simulator.dir/glutapp.cpp.o.requires
.PHONY : appSimulator/CMakeFiles/simulator.dir/requires

appSimulator/CMakeFiles/simulator.dir/clean:
	cd /home/alex/gitControl/appSimulator && $(CMAKE_COMMAND) -P CMakeFiles/simulator.dir/cmake_clean.cmake
.PHONY : appSimulator/CMakeFiles/simulator.dir/clean

appSimulator/CMakeFiles/simulator.dir/depend:
	cd /home/alex/gitControl && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/alex/gitControl /home/alex/gitControl/appSimulator /home/alex/gitControl /home/alex/gitControl/appSimulator /home/alex/gitControl/appSimulator/CMakeFiles/simulator.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : appSimulator/CMakeFiles/simulator.dir/depend
