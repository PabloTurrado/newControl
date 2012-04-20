# Install script for directory: /home/alex/gitControl

# Set the install prefix
IF(NOT DEFINED CMAKE_INSTALL_PREFIX)
  SET(CMAKE_INSTALL_PREFIX "/usr/local/mrcore")
ENDIF(NOT DEFINED CMAKE_INSTALL_PREFIX)
STRING(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
IF(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  IF(BUILD_TYPE)
    STRING(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  ELSE(BUILD_TYPE)
    SET(CMAKE_INSTALL_CONFIG_NAME "")
  ENDIF(BUILD_TYPE)
  MESSAGE(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
ENDIF(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)

# Set the component getting installed.
IF(NOT CMAKE_INSTALL_COMPONENT)
  IF(COMPONENT)
    MESSAGE(STATUS "Install component: \"${COMPONENT}\"")
    SET(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  ELSE(COMPONENT)
    SET(CMAKE_INSTALL_COMPONENT)
  ENDIF(COMPONENT)
ENDIF(NOT CMAKE_INSTALL_COMPONENT)

# Install shared libraries without execute permission?
IF(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  SET(CMAKE_INSTALL_SO_NO_EXE "1")
ENDIF(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  list(APPEND CPACK_ABSOLUTE_DESTINATION_FILES
   "/usr/local/mrcore/data/configMyRoom.txt~;/usr/local/mrcore/data/myRoom.world;/usr/local/mrcore/data/configMyRoom.txt;/usr/local/mrcore/data/config.txt;/usr/local/mrcore/data/configSquaredRoom.txt~;/usr/local/mrcore/data/configSquaredRingWalls.txt;/usr/local/mrcore/data/configSquaredRoom.txt;/usr/local/mrcore/data/rampas.world;/usr/local/mrcore/data/configSquaredRingNoWalls.txt;/usr/local/mrcore/data/squaredRingNoWalls.world;/usr/local/mrcore/data/config2.txt;/usr/local/mrcore/data/controlTest.world;/usr/local/mrcore/data/squaredRingWalls.world;/usr/local/mrcore/data/configControl.txt;/usr/local/mrcore/data/squaredRoom.world;/usr/local/mrcore/data/flat.world")
FILE(INSTALL DESTINATION "/usr/local/mrcore/data" TYPE FILE FILES
    "/home/alex/gitControl/data/configMyRoom.txt~"
    "/home/alex/gitControl/data/myRoom.world"
    "/home/alex/gitControl/data/configMyRoom.txt"
    "/home/alex/gitControl/data/config.txt"
    "/home/alex/gitControl/data/configSquaredRoom.txt~"
    "/home/alex/gitControl/data/configSquaredRingWalls.txt"
    "/home/alex/gitControl/data/configSquaredRoom.txt"
    "/home/alex/gitControl/data/rampas.world"
    "/home/alex/gitControl/data/configSquaredRingNoWalls.txt"
    "/home/alex/gitControl/data/squaredRingNoWalls.world"
    "/home/alex/gitControl/data/config2.txt"
    "/home/alex/gitControl/data/controlTest.world"
    "/home/alex/gitControl/data/squaredRingWalls.world"
    "/home/alex/gitControl/data/configControl.txt"
    "/home/alex/gitControl/data/squaredRoom.world"
    "/home/alex/gitControl/data/flat.world"
    )
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")

IF(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for each subdirectory.
  INCLUDE("/home/alex/gitControl/libraries/cmake_install.cmake")
  INCLUDE("/home/alex/gitControl/appSimulator/cmake_install.cmake")
  INCLUDE("/home/alex/gitControl/appTeleop/cmake_install.cmake")
  INCLUDE("/home/alex/gitControl/tests/cmake_install.cmake")

ENDIF(NOT CMAKE_INSTALL_LOCAL_ONLY)

IF(CMAKE_INSTALL_COMPONENT)
  SET(CMAKE_INSTALL_MANIFEST "install_manifest_${CMAKE_INSTALL_COMPONENT}.txt")
ELSE(CMAKE_INSTALL_COMPONENT)
  SET(CMAKE_INSTALL_MANIFEST "install_manifest.txt")
ENDIF(CMAKE_INSTALL_COMPONENT)

FILE(WRITE "/home/alex/gitControl/${CMAKE_INSTALL_MANIFEST}" "")
FOREACH(file ${CMAKE_INSTALL_MANIFEST_FILES})
  FILE(APPEND "/home/alex/gitControl/${CMAKE_INSTALL_MANIFEST}" "${file}\n")
ENDFOREACH(file)
