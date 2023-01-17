#----------------------------------------------------------------
# Generated CMake target import file for configuration "Release".
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "Project::Project" for configuration "Release"
set_property(TARGET Project::Project APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(Project::Project PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_RELEASE "CXX"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/Project.lib"
  )

list(APPEND _cmake_import_check_targets Project::Project )
list(APPEND _cmake_import_check_files_for_Project::Project "${_IMPORT_PREFIX}/lib/Project.lib" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
