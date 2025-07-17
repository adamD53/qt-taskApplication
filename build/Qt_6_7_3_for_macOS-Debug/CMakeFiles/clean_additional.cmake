# Additional clean files
cmake_minimum_required(VERSION 3.16)

if("${CONFIG}" STREQUAL "" OR "${CONFIG}" STREQUAL "Debug")
  file(REMOVE_RECURSE
  "CMakeFiles/apptaskApplication_autogen.dir/AutogenUsed.txt"
  "CMakeFiles/apptaskApplication_autogen.dir/ParseCache.txt"
  "apptaskApplication_autogen"
  )
endif()
