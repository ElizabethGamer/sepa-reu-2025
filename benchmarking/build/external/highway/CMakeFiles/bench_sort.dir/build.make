# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.25

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
CMAKE_COMMAND = /opt/cmake-3.25.1/bin/cmake

# The command to remove a file.
RM = /opt/cmake-3.25.1/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/elizabeth/sepa-reu-2025/benchmarking

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/elizabeth/sepa-reu-2025/benchmarking/build

# Include any dependencies generated for this target.
include external/highway/CMakeFiles/bench_sort.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include external/highway/CMakeFiles/bench_sort.dir/compiler_depend.make

# Include the progress variables for this target.
include external/highway/CMakeFiles/bench_sort.dir/progress.make

# Include the compile flags for this target's objects.
include external/highway/CMakeFiles/bench_sort.dir/flags.make

external/highway/CMakeFiles/bench_sort.dir/hwy/contrib/sort/bench_sort.cc.o: external/highway/CMakeFiles/bench_sort.dir/flags.make
external/highway/CMakeFiles/bench_sort.dir/hwy/contrib/sort/bench_sort.cc.o: /home/elizabeth/sepa-reu-2025/benchmarking/external/highway/hwy/contrib/sort/bench_sort.cc
external/highway/CMakeFiles/bench_sort.dir/hwy/contrib/sort/bench_sort.cc.o: external/highway/CMakeFiles/bench_sort.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/elizabeth/sepa-reu-2025/benchmarking/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object external/highway/CMakeFiles/bench_sort.dir/hwy/contrib/sort/bench_sort.cc.o"
	cd /home/elizabeth/sepa-reu-2025/benchmarking/build/external/highway && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT external/highway/CMakeFiles/bench_sort.dir/hwy/contrib/sort/bench_sort.cc.o -MF CMakeFiles/bench_sort.dir/hwy/contrib/sort/bench_sort.cc.o.d -o CMakeFiles/bench_sort.dir/hwy/contrib/sort/bench_sort.cc.o -c /home/elizabeth/sepa-reu-2025/benchmarking/external/highway/hwy/contrib/sort/bench_sort.cc

external/highway/CMakeFiles/bench_sort.dir/hwy/contrib/sort/bench_sort.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/bench_sort.dir/hwy/contrib/sort/bench_sort.cc.i"
	cd /home/elizabeth/sepa-reu-2025/benchmarking/build/external/highway && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/elizabeth/sepa-reu-2025/benchmarking/external/highway/hwy/contrib/sort/bench_sort.cc > CMakeFiles/bench_sort.dir/hwy/contrib/sort/bench_sort.cc.i

external/highway/CMakeFiles/bench_sort.dir/hwy/contrib/sort/bench_sort.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/bench_sort.dir/hwy/contrib/sort/bench_sort.cc.s"
	cd /home/elizabeth/sepa-reu-2025/benchmarking/build/external/highway && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/elizabeth/sepa-reu-2025/benchmarking/external/highway/hwy/contrib/sort/bench_sort.cc -o CMakeFiles/bench_sort.dir/hwy/contrib/sort/bench_sort.cc.s

# Object files for target bench_sort
bench_sort_OBJECTS = \
"CMakeFiles/bench_sort.dir/hwy/contrib/sort/bench_sort.cc.o"

# External object files for target bench_sort
bench_sort_EXTERNAL_OBJECTS =

external/highway/tests/bench_sort: external/highway/CMakeFiles/bench_sort.dir/hwy/contrib/sort/bench_sort.cc.o
external/highway/tests/bench_sort: external/highway/CMakeFiles/bench_sort.dir/build.make
external/highway/tests/bench_sort: external/highway/libhwy.a
external/highway/tests/bench_sort: external/highway/libhwy_test.a
external/highway/tests/bench_sort: external/highway/libhwy_contrib.a
external/highway/tests/bench_sort: lib/libgtest.a
external/highway/tests/bench_sort: lib/libgtest_main.a
external/highway/tests/bench_sort: external/highway/libhwy.a
external/highway/tests/bench_sort: lib/libgtest.a
external/highway/tests/bench_sort: external/highway/CMakeFiles/bench_sort.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/elizabeth/sepa-reu-2025/benchmarking/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable tests/bench_sort"
	cd /home/elizabeth/sepa-reu-2025/benchmarking/build/external/highway && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/bench_sort.dir/link.txt --verbose=$(VERBOSE)
	cd /home/elizabeth/sepa-reu-2025/benchmarking/build/external/highway && /opt/cmake-3.25.1/bin/cmake -D TEST_TARGET=bench_sort -D TEST_EXECUTABLE=/home/elizabeth/sepa-reu-2025/benchmarking/build/external/highway/tests/bench_sort -D TEST_EXECUTOR= -D TEST_WORKING_DIR=/home/elizabeth/sepa-reu-2025/benchmarking/build/external/highway -D TEST_EXTRA_ARGS= -D TEST_PROPERTIES= -D TEST_PREFIX= -D TEST_SUFFIX= -D TEST_FILTER= -D NO_PRETTY_TYPES=FALSE -D NO_PRETTY_VALUES=FALSE -D TEST_LIST=bench_sort_TESTS -D CTEST_FILE=/home/elizabeth/sepa-reu-2025/benchmarking/build/external/highway/bench_sort[1]_tests.cmake -D TEST_DISCOVERY_TIMEOUT=60 -D TEST_XML_OUTPUT_DIR= -P /opt/cmake-3.25.1/share/cmake-3.25/Modules/GoogleTestAddTests.cmake

# Rule to build all files generated by this target.
external/highway/CMakeFiles/bench_sort.dir/build: external/highway/tests/bench_sort
.PHONY : external/highway/CMakeFiles/bench_sort.dir/build

external/highway/CMakeFiles/bench_sort.dir/clean:
	cd /home/elizabeth/sepa-reu-2025/benchmarking/build/external/highway && $(CMAKE_COMMAND) -P CMakeFiles/bench_sort.dir/cmake_clean.cmake
.PHONY : external/highway/CMakeFiles/bench_sort.dir/clean

external/highway/CMakeFiles/bench_sort.dir/depend:
	cd /home/elizabeth/sepa-reu-2025/benchmarking/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/elizabeth/sepa-reu-2025/benchmarking /home/elizabeth/sepa-reu-2025/benchmarking/external/highway /home/elizabeth/sepa-reu-2025/benchmarking/build /home/elizabeth/sepa-reu-2025/benchmarking/build/external/highway /home/elizabeth/sepa-reu-2025/benchmarking/build/external/highway/CMakeFiles/bench_sort.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : external/highway/CMakeFiles/bench_sort.dir/depend

