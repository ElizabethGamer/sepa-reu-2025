# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 4.0

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
CMAKE_COMMAND = /usr/local/bin/cmake

# The command to remove a file.
RM = /usr/local/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /Users/Elizabeth/Downloads/receipts/parallel/sepa-reu-2025/beginnerparlay

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /Users/Elizabeth/Downloads/receipts/parallel/sepa-reu-2025/beginnerparlay/build

# Include any dependencies generated for this target.
include CMakeFiles/beginnerparlay.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include CMakeFiles/beginnerparlay.dir/compiler_depend.make

# Include the progress variables for this target.
include CMakeFiles/beginnerparlay.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/beginnerparlay.dir/flags.make

CMakeFiles/beginnerparlay.dir/codegen:
.PHONY : CMakeFiles/beginnerparlay.dir/codegen

CMakeFiles/beginnerparlay.dir/src/filter.cpp.o: CMakeFiles/beginnerparlay.dir/flags.make
CMakeFiles/beginnerparlay.dir/src/filter.cpp.o: /Users/Elizabeth/Downloads/receipts/parallel/sepa-reu-2025/beginnerparlay/src/filter.cpp
CMakeFiles/beginnerparlay.dir/src/filter.cpp.o: CMakeFiles/beginnerparlay.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/Users/Elizabeth/Downloads/receipts/parallel/sepa-reu-2025/beginnerparlay/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/beginnerparlay.dir/src/filter.cpp.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/beginnerparlay.dir/src/filter.cpp.o -MF CMakeFiles/beginnerparlay.dir/src/filter.cpp.o.d -o CMakeFiles/beginnerparlay.dir/src/filter.cpp.o -c /Users/Elizabeth/Downloads/receipts/parallel/sepa-reu-2025/beginnerparlay/src/filter.cpp

CMakeFiles/beginnerparlay.dir/src/filter.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/beginnerparlay.dir/src/filter.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /Users/Elizabeth/Downloads/receipts/parallel/sepa-reu-2025/beginnerparlay/src/filter.cpp > CMakeFiles/beginnerparlay.dir/src/filter.cpp.i

CMakeFiles/beginnerparlay.dir/src/filter.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/beginnerparlay.dir/src/filter.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /Users/Elizabeth/Downloads/receipts/parallel/sepa-reu-2025/beginnerparlay/src/filter.cpp -o CMakeFiles/beginnerparlay.dir/src/filter.cpp.s

CMakeFiles/beginnerparlay.dir/src/main.cpp.o: CMakeFiles/beginnerparlay.dir/flags.make
CMakeFiles/beginnerparlay.dir/src/main.cpp.o: /Users/Elizabeth/Downloads/receipts/parallel/sepa-reu-2025/beginnerparlay/src/main.cpp
CMakeFiles/beginnerparlay.dir/src/main.cpp.o: CMakeFiles/beginnerparlay.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/Users/Elizabeth/Downloads/receipts/parallel/sepa-reu-2025/beginnerparlay/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object CMakeFiles/beginnerparlay.dir/src/main.cpp.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/beginnerparlay.dir/src/main.cpp.o -MF CMakeFiles/beginnerparlay.dir/src/main.cpp.o.d -o CMakeFiles/beginnerparlay.dir/src/main.cpp.o -c /Users/Elizabeth/Downloads/receipts/parallel/sepa-reu-2025/beginnerparlay/src/main.cpp

CMakeFiles/beginnerparlay.dir/src/main.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/beginnerparlay.dir/src/main.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /Users/Elizabeth/Downloads/receipts/parallel/sepa-reu-2025/beginnerparlay/src/main.cpp > CMakeFiles/beginnerparlay.dir/src/main.cpp.i

CMakeFiles/beginnerparlay.dir/src/main.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/beginnerparlay.dir/src/main.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /Users/Elizabeth/Downloads/receipts/parallel/sepa-reu-2025/beginnerparlay/src/main.cpp -o CMakeFiles/beginnerparlay.dir/src/main.cpp.s

CMakeFiles/beginnerparlay.dir/src/prefix.cpp.o: CMakeFiles/beginnerparlay.dir/flags.make
CMakeFiles/beginnerparlay.dir/src/prefix.cpp.o: /Users/Elizabeth/Downloads/receipts/parallel/sepa-reu-2025/beginnerparlay/src/prefix.cpp
CMakeFiles/beginnerparlay.dir/src/prefix.cpp.o: CMakeFiles/beginnerparlay.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/Users/Elizabeth/Downloads/receipts/parallel/sepa-reu-2025/beginnerparlay/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building CXX object CMakeFiles/beginnerparlay.dir/src/prefix.cpp.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/beginnerparlay.dir/src/prefix.cpp.o -MF CMakeFiles/beginnerparlay.dir/src/prefix.cpp.o.d -o CMakeFiles/beginnerparlay.dir/src/prefix.cpp.o -c /Users/Elizabeth/Downloads/receipts/parallel/sepa-reu-2025/beginnerparlay/src/prefix.cpp

CMakeFiles/beginnerparlay.dir/src/prefix.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/beginnerparlay.dir/src/prefix.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /Users/Elizabeth/Downloads/receipts/parallel/sepa-reu-2025/beginnerparlay/src/prefix.cpp > CMakeFiles/beginnerparlay.dir/src/prefix.cpp.i

CMakeFiles/beginnerparlay.dir/src/prefix.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/beginnerparlay.dir/src/prefix.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /Users/Elizabeth/Downloads/receipts/parallel/sepa-reu-2025/beginnerparlay/src/prefix.cpp -o CMakeFiles/beginnerparlay.dir/src/prefix.cpp.s

CMakeFiles/beginnerparlay.dir/src/reduction.cpp.o: CMakeFiles/beginnerparlay.dir/flags.make
CMakeFiles/beginnerparlay.dir/src/reduction.cpp.o: /Users/Elizabeth/Downloads/receipts/parallel/sepa-reu-2025/beginnerparlay/src/reduction.cpp
CMakeFiles/beginnerparlay.dir/src/reduction.cpp.o: CMakeFiles/beginnerparlay.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/Users/Elizabeth/Downloads/receipts/parallel/sepa-reu-2025/beginnerparlay/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Building CXX object CMakeFiles/beginnerparlay.dir/src/reduction.cpp.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/beginnerparlay.dir/src/reduction.cpp.o -MF CMakeFiles/beginnerparlay.dir/src/reduction.cpp.o.d -o CMakeFiles/beginnerparlay.dir/src/reduction.cpp.o -c /Users/Elizabeth/Downloads/receipts/parallel/sepa-reu-2025/beginnerparlay/src/reduction.cpp

CMakeFiles/beginnerparlay.dir/src/reduction.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/beginnerparlay.dir/src/reduction.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /Users/Elizabeth/Downloads/receipts/parallel/sepa-reu-2025/beginnerparlay/src/reduction.cpp > CMakeFiles/beginnerparlay.dir/src/reduction.cpp.i

CMakeFiles/beginnerparlay.dir/src/reduction.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/beginnerparlay.dir/src/reduction.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /Users/Elizabeth/Downloads/receipts/parallel/sepa-reu-2025/beginnerparlay/src/reduction.cpp -o CMakeFiles/beginnerparlay.dir/src/reduction.cpp.s

# Object files for target beginnerparlay
beginnerparlay_OBJECTS = \
"CMakeFiles/beginnerparlay.dir/src/filter.cpp.o" \
"CMakeFiles/beginnerparlay.dir/src/main.cpp.o" \
"CMakeFiles/beginnerparlay.dir/src/prefix.cpp.o" \
"CMakeFiles/beginnerparlay.dir/src/reduction.cpp.o"

# External object files for target beginnerparlay
beginnerparlay_EXTERNAL_OBJECTS =

beginnerparlay: CMakeFiles/beginnerparlay.dir/src/filter.cpp.o
beginnerparlay: CMakeFiles/beginnerparlay.dir/src/main.cpp.o
beginnerparlay: CMakeFiles/beginnerparlay.dir/src/prefix.cpp.o
beginnerparlay: CMakeFiles/beginnerparlay.dir/src/reduction.cpp.o
beginnerparlay: CMakeFiles/beginnerparlay.dir/build.make
beginnerparlay: CMakeFiles/beginnerparlay.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --bold --progress-dir=/Users/Elizabeth/Downloads/receipts/parallel/sepa-reu-2025/beginnerparlay/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "Linking CXX executable beginnerparlay"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/beginnerparlay.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/beginnerparlay.dir/build: beginnerparlay
.PHONY : CMakeFiles/beginnerparlay.dir/build

CMakeFiles/beginnerparlay.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/beginnerparlay.dir/cmake_clean.cmake
.PHONY : CMakeFiles/beginnerparlay.dir/clean

CMakeFiles/beginnerparlay.dir/depend:
	cd /Users/Elizabeth/Downloads/receipts/parallel/sepa-reu-2025/beginnerparlay/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /Users/Elizabeth/Downloads/receipts/parallel/sepa-reu-2025/beginnerparlay /Users/Elizabeth/Downloads/receipts/parallel/sepa-reu-2025/beginnerparlay /Users/Elizabeth/Downloads/receipts/parallel/sepa-reu-2025/beginnerparlay/build /Users/Elizabeth/Downloads/receipts/parallel/sepa-reu-2025/beginnerparlay/build /Users/Elizabeth/Downloads/receipts/parallel/sepa-reu-2025/beginnerparlay/build/CMakeFiles/beginnerparlay.dir/DependInfo.cmake "--color=$(COLOR)"
.PHONY : CMakeFiles/beginnerparlay.dir/depend

