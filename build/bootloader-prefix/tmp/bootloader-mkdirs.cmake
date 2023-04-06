# Distributed under the OSI-approved BSD 3-Clause License.  See accompanying
# file Copyright.txt or https://cmake.org/licensing for details.

cmake_minimum_required(VERSION 3.5)

file(MAKE_DIRECTORY
  "C:/Espressif/frameworks/esp-idf-v5.0/components/bootloader/subproject"
  "C:/esp-mqtt/esp-aws-iot/examples/mqtt/tls_mutual_auth/build/bootloader"
  "C:/esp-mqtt/esp-aws-iot/examples/mqtt/tls_mutual_auth/build/bootloader-prefix"
  "C:/esp-mqtt/esp-aws-iot/examples/mqtt/tls_mutual_auth/build/bootloader-prefix/tmp"
  "C:/esp-mqtt/esp-aws-iot/examples/mqtt/tls_mutual_auth/build/bootloader-prefix/src/bootloader-stamp"
  "C:/esp-mqtt/esp-aws-iot/examples/mqtt/tls_mutual_auth/build/bootloader-prefix/src"
  "C:/esp-mqtt/esp-aws-iot/examples/mqtt/tls_mutual_auth/build/bootloader-prefix/src/bootloader-stamp"
)

set(configSubDirs )
foreach(subDir IN LISTS configSubDirs)
    file(MAKE_DIRECTORY "C:/esp-mqtt/esp-aws-iot/examples/mqtt/tls_mutual_auth/build/bootloader-prefix/src/bootloader-stamp/${subDir}")
endforeach()
if(cfgdir)
  file(MAKE_DIRECTORY "C:/esp-mqtt/esp-aws-iot/examples/mqtt/tls_mutual_auth/build/bootloader-prefix/src/bootloader-stamp${cfgdir}") # cfgdir has leading slash
endif()
