# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.28

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Disable VCS-based implicit rules.
% : %,v

# Disable VCS-based implicit rules.
% : RCS/%

# Disable VCS-based implicit rules.
% : RCS/%,v

# Disable VCS-based implicit rules.
% : SCCS/s.%

# Disable VCS-based implicit rules.
% : s.%

.SUFFIXES: .hpux_make_needs_suffix_list

# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /opt/homebrew/Cellar/cmake/3.28.1/bin/cmake

# The command to remove a file.
RM = /opt/homebrew/Cellar/cmake/3.28.1/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /Users/tokuyamamorimasa/Desktop/OS/2.6

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /Users/tokuyamamorimasa/Desktop/OS/2.6/build

# Include any dependencies generated for this target.
include CMakeFiles/lsla.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include CMakeFiles/lsla.dir/compiler_depend.make

# Include the progress variables for this target.
include CMakeFiles/lsla.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/lsla.dir/flags.make

CMakeFiles/lsla.dir/lsla.c.o: CMakeFiles/lsla.dir/flags.make
CMakeFiles/lsla.dir/lsla.c.o: /Users/tokuyamamorimasa/Desktop/OS/2.6/lsla.c
CMakeFiles/lsla.dir/lsla.c.o: CMakeFiles/lsla.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/Users/tokuyamamorimasa/Desktop/OS/2.6/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object CMakeFiles/lsla.dir/lsla.c.o"
	/Library/Developer/CommandLineTools/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT CMakeFiles/lsla.dir/lsla.c.o -MF CMakeFiles/lsla.dir/lsla.c.o.d -o CMakeFiles/lsla.dir/lsla.c.o -c /Users/tokuyamamorimasa/Desktop/OS/2.6/lsla.c

CMakeFiles/lsla.dir/lsla.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing C source to CMakeFiles/lsla.dir/lsla.c.i"
	/Library/Developer/CommandLineTools/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /Users/tokuyamamorimasa/Desktop/OS/2.6/lsla.c > CMakeFiles/lsla.dir/lsla.c.i

CMakeFiles/lsla.dir/lsla.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling C source to assembly CMakeFiles/lsla.dir/lsla.c.s"
	/Library/Developer/CommandLineTools/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /Users/tokuyamamorimasa/Desktop/OS/2.6/lsla.c -o CMakeFiles/lsla.dir/lsla.c.s

# Object files for target lsla
lsla_OBJECTS = \
"CMakeFiles/lsla.dir/lsla.c.o"

# External object files for target lsla
lsla_EXTERNAL_OBJECTS =

lsla: CMakeFiles/lsla.dir/lsla.c.o
lsla: CMakeFiles/lsla.dir/build.make
lsla: CMakeFiles/lsla.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --bold --progress-dir=/Users/tokuyamamorimasa/Desktop/OS/2.6/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking C executable lsla"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/lsla.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/lsla.dir/build: lsla
.PHONY : CMakeFiles/lsla.dir/build

CMakeFiles/lsla.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/lsla.dir/cmake_clean.cmake
.PHONY : CMakeFiles/lsla.dir/clean

CMakeFiles/lsla.dir/depend:
	cd /Users/tokuyamamorimasa/Desktop/OS/2.6/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /Users/tokuyamamorimasa/Desktop/OS/2.6 /Users/tokuyamamorimasa/Desktop/OS/2.6 /Users/tokuyamamorimasa/Desktop/OS/2.6/build /Users/tokuyamamorimasa/Desktop/OS/2.6/build /Users/tokuyamamorimasa/Desktop/OS/2.6/build/CMakeFiles/lsla.dir/DependInfo.cmake "--color=$(COLOR)"
.PHONY : CMakeFiles/lsla.dir/depend

