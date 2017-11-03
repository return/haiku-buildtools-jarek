CMAKE_MINIMUM_REQUIRED(VERSION 2.8)
PROJECT(haiku-buildtools)

include(GNUInstallDirs)

IF("${CMAKE_SOURCE_DIR}" STREQUAL "${CMAKE_BINARY_DIR}")
	MESSAGE(FATAL_ERROR "Sorry, in source builds are not supported")
ENDIF()

IF("${HAIKU_SOURCE_DIR}" STREQUAL "")
	IF("$ENV{HAIKU_SOURCE_DIR}" STREQUAL "")
		IF(NOT IS_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/../haiku)
			MESSAGE(FATAL_ERROR "Please define Haiku source directory")
		ELSE()
			get_filename_component(HAIKU_SOURCE_DIR	"${CMAKE_CURRENT_SOURCE_DIR}/../haiku" REALPATH CACHE)
		ENDIF()
	ELSE()
		SET(HAIKU_SOURCE_DIR "$ENV{HAIKU_SOURCE_DIR}" CACHE PATH "")
	ENDIF()
ELSE()
	SET(HAIKU_SOURCE_DIR "${HAIKU_SOURCE_DIR}" CACHE PATH "")
ENDIF()

IF("${HAIKU_TOOLCHAIN_INSTALL_PREFIX}" STREQUAL "")
	IF("$ENV{HAIKU_TOOLCHAIN_INSTALL_PREFIX}" STREQUAL "")
		SET(HAIKU_TOOLCHAIN_INSTALL_PREFIX	"${CMAKE_INSTALL_PREFIX}")
	ELSE()
		SET(HAIKU_TOOLCHAIN_INSTALL_PREFIX "$ENV{HAIKU_TOOLCHAIN_INSTALL_PREFIX}")
	ENDIF()
ENDIF()

MESSAGE(STATUS "Using Haiku source directory ${HAIKU_SOURCE_DIR}")

if(${CMAKE_HOST_SYSTEM_PROCESSOR} MATCHES "i[3-6]86")
	set(HARDINFO_ARCH "x86")
elseif(${CMAKE_HOST_SYSTEM_PROCESSOR} MATCHES "x86_64")
	set(HARDINFO_ARCH "x86")
	add_definitions(-DHAIKU_HOST_PLATFORM_64_BIT=1)
elseif(${CMAKE_HOST_SYSTEM_PROCESSOR} MATCHES "(ppc|ppc32|ppc64|ppc64le)")
	set(HARDINFO_ARCH "ppc")
elseif(${CMAKE_HOST_SYSTEM_PROCESSOR} MATCHES "mips")
	set(HARDINFO_ARCH "mips")
elseif(${CMAKE_HOST_SYSTEM_PROCESSOR} MATCHES "parisc.*")
	set(HARDINFO_ARCH "parisc")
elseif(${CMAKE_HOST_SYSTEM_PROCESSOR} MATCHES "sparc{32,64}")
	set(HARDINFO_ARCH "sparc")
elseif(${CMAKE_HOST_SYSTEM_PROCESSOR} MATCHES "arm.*")
	set(HARDINFO_ARCH "arm")
elseif(${CMAKE_HOST_SYSTEM_PROCESSOR} MATCHES "aarch64.*")
	set(HARDINFO_ARCH "aarch64")
	add_definitions(-DHAIKU_HOST_PLATFORM_64_BIT=1)
elseif(${CMAKE_HOST_SYSTEM_PROCESSOR} MATCHES "ia64")
	set(HARDINFO_ARCH "ia64")
elseif(${CMAKE_HOST_SYSTEM_PROCESSOR} MATCHES "alpha")
	set(HARDINFO_ARCH "alpha")
elseif(${CMAKE_HOST_SYSTEM_PROCESSOR} MATCHES "s390.*")
	set(HARDINFO_ARCH "s390")
elseif(${CMAKE_HOST_SYSTEM_PROCESSOR} MATCHES "m68k")
	set(HARDINFO_ARCH "m68k")
elseif(${CMAKE_HOST_SYSTEM_PROCESSOR} MATCHES "sh[3-5]")
	set(HARDINFO_ARCH "sh")
elseif(${CMAKE_HOST_SYSTEM_PROCESSOR} MATCHES "(riscv|riscv32|riscv64)")
	set(HARDINFO_ARCH "riscv")
else()
	message(FATAL_ERROR "Unsupported architecture: ${CMAKE_HOST_SYSTEM_PROCESSOR}")
endif()

IF("${HAIKU_ARCH}" STREQUAL "")
	IF("$ENV{HAIKU_ARCH}" STREQUAL "")
		MESSAGE(STATUS "Architecture not specified. Using host architecture ${HARDINFO_ARCH}")
		SET(HAIKU_ARCH "${HARDINFO_ARCH}" CACHE STRING "")
	ELSE()
		SET(HAIKU_ARCH "$ENV{HAIKU_ARCH}" CACHE STRING "")
	ENDIF()
ELSE()
	SET(HAIKU_ARCH "$ENV{HAIKU_ARCH}" CACHE STRING "")
ENDIF()

MESSAGE(STATUS "Building cross tools for architecture ${HARDINFO_ARCH}")

IF("${HAIKU_ARCH}" STREQUAL "x86")
	SET(HAIKU_TRIPLET	"i586-pc-haiku" CACHE STRING "")
ELSEIF("${HAIKU_ARCH}" STREQUAL "x86_64")
	SET(HAIKU_TRIPLET	"x86_64-unknown-haiku" CACHE STRING "")
ELSEIF("${HAIKU_ARCH}" STREQUAL "ppc")
	SET(HAIKU_TRIPLET	"powerpc-apple-haiku" CACHE STRING "")
ELSEIF("${HAIKU_ARCH}" STREQUAL "m68k")
	SET(HAIKU_TRIPLET	"m68k-unknown-haiku" CACHE STRING "")
ELSEIF("${HAIKU_ARCH}" STREQUAL "arm")
	SET(HAIKU_TRIPLET	"arm-haiku-gnueabi" CACHE STRING "")
ELSEIF("${HAIKU_ARCH}" STREQUAL "mips")
	SET(HAIKU_TRIPLET	"mipsel-unknown-haiku" CACHE STRING "")
ELSEIF("${HAIKU_ARCH}" STREQUAL "aarch64")
	SET(HAIKU_TRIPLET	"aarch64-haiku" CACHE STRING "")
ELSE()
	MESSAGE(FATAL_ERROR "Target architecture not supported")
ENDIF()

SET(HAIKU_SYSROOT		"${CMAKE_CURRENT_BINARY_DIR}/sysroot")
SET(HAIKU_INCLUDE_DIR	"${HAIKU_SYSROOT}/boot/system/develop/headers")
SET(HAIKU_LIB_DIR		"${HAIKU_SYSROOT}/boot/system/develop/lib")

function(sysroot_configure_files srcDir destDir)
    file(MAKE_DIRECTORY ${destDir})

    file(GLOB templateFiles RELATIVE ${srcDir} ${srcDir}/*)
    
    foreach(templateFile ${templateFiles})
        set(srcTemplatePath ${srcDir}/${templateFile})
        if(NOT IS_DIRECTORY ${srcTemplatePath})
            configure_file(
                    ${srcTemplatePath}
                    ${destDir}/${templateFile}
                    COPYONLY)
        else()
        	sysroot_configure_files(${srcDir}/${templateFile} ${destDir}/${templateFile})
        endif(NOT IS_DIRECTORY ${srcTemplatePath})
    endforeach(templateFile)
endfunction(sysroot_configure_files)

sysroot_configure_files(${HAIKU_SOURCE_DIR}/headers/config ${HAIKU_INCLUDE_DIR}/config)
sysroot_configure_files(${HAIKU_SOURCE_DIR}/headers/os ${HAIKU_INCLUDE_DIR}/os)
sysroot_configure_files(${HAIKU_SOURCE_DIR}/headers/posix ${HAIKU_INCLUDE_DIR}/posix)

include(ExternalProject)
include(ProcessorCount)

ProcessorCount(N)
if(NOT N EQUAL 0)
	set(PROJ_BUILD_EXTRA_ARGS -j${N})
endif()
   
ExternalProject_Add(binutils
	SOURCE_DIR ${CMAKE_CURRENT_SOURCE_DIR}/binutils-2.29
	CONFIGURE_COMMAND ${CMAKE_CURRENT_SOURCE_DIR}/binutils-2.29/configure 
						--prefix=${HAIKU_TOOLCHAIN_INSTALL_PREFIX} 
						--disable-nls 
						--target=${HAIKU_TRIPLET}
						--with-sysroot=${HAIKU_SYSROOT}
	BUILD_COMMAND make ${PROJ_BUILD_EXTRA_ARGS}
	INSTALL_COMMAND make install)

function(GenerateGCCStage1)
	ExternalProject_Add(gcc-stage1
		SOURCE_DIR ${CMAKE_CURRENT_SOURCE_DIR}/gcc-7.2.0
		CONFIGURE_COMMAND ${CMAKE_CURRENT_SOURCE_DIR}/gcc-7.2.0/configure
							--prefix=${HAIKU_TOOLCHAIN_INSTALL_PREFIX}
							--disable-nls
							--target=${HAIKU_TRIPLET}
							--disable-shared 
							--with-system-zlib
							--enable-languages=c
							--enable-lto
							--enable-__cxa-atexit 
							--enable-threads=posix
							--with-sysroot=${HAIKU_SYSROOT}
							--disable-multilib
							--disable-libstdcxx
		BUILD_COMMAND make ${PROJ_BUILD_EXTRA_ARGS}
		INSTALL_COMMAND make install
		DEPENDS binutils)
endfunction()

function(GenerateGCCStage2)
	ExternalProject_Add(gcc-stage2
		SOURCE_DIR ${CMAKE_CURRENT_SOURCE_DIR}/gcc-7.2.0
		CONFIGURE_COMMAND ${CMAKE_CURRENT_SOURCE_DIR}/gcc-7.2.0/configure
							--prefix=${HAIKU_TOOLCHAIN_INSTALL_PREFIX}
							--disable-nls
							--target=${HAIKU_TRIPLET}
							--disable-shared
							--with-system-zlib
							--enable-languages=c,c++ 
							--enable-lto
							--enable-__cxa-atexit 
							--enable-threads=posix
							--with-sysroot=${HAIKU_SYSROOT}
							--disable-multilib
		BUILD_COMMAND make ${PROJ_BUILD_EXTRA_ARGS}
		INSTALL_COMMAND make install
		DEPENDS binutils)
endfunction()

#### Check if we have dummy glue for architecture

SET(arch_glue_files "crti.o;crtn.o;haiku_version_glue.o;init_term_dyn.o;start_dyn.o;libroot.so")
SET(arch_glue_files_fine YES)

FOREACH(_f ${arch_glue_files})
	IF(NOT EXISTS ${CMAKE_CURRENT_SOURCE_DIR}/cmake/precompiled/${HAIKU_ARCH}/${_f})
		SET(arch_glue_files_fine NO)
		BREAK()
	ENDIF()
ENDFOREACH(_f ${arch_glue_files})

IF(arch_glue_files_fine)
	MESSAGE(STATUS "Using precompiled glue code")
	FOREACH(_f ${arch_glue_files})
		CONFIGURE_FILE(${CMAKE_CURRENT_SOURCE_DIR}/cmake/precompiled/${HAIKU_ARCH}/${_f}
			${HAIKU_LIB_DIR}/${_f}
			COPYONLY)
	ENDFOREACH(_f ${arch_glue_files})

	#### We can just build stage 2 directly as we can can pass autoconf test ###
	GenerateGCCStage2()
ELSE()
	#### BUILD GCC without libstdc++. It will be built later
	GenerateGCCStage1()

	SET(__CROSS_COMPILE__		"${HAIKU_TOOLCHAIN_INSTALL_PREFIX}/${CMAKE_INSTALL_BINDIR}/${HAIKU_TRIPLET}-")

	#### Generate toolchain file
	configure_file(${CMAKE_CURRENT_SOURCE_DIR}/cmake/cross-runtime/CrossToolchainFile.cmake.in
		${CMAKE_CURRENT_BINARY_DIR}/cmake/cross-runtime/CrossToolchainFile.cmake
		@ONLY)

	#### Create build target to cross compile glue code
	ExternalProject_Add(glue-code
		SOURCE_DIR ${CMAKE_CURRENT_SOURCE_DIR}/cmake/cross-runtime
		CMAKE_ARGS -DCMAKE_INSTALL_PREFIX=${HAIKU_LIB_DIR}
		 		   -DCMAKE_BUILD_TYPE=Debug
		 		   -DHAIKU_ARCH=${HAIKU_ARCH}
		 		   -DCMAKE_TOOLCHAIN_FILE=${CMAKE_CURRENT_BINARY_DIR}/cmake/cross-runtime/CrossToolchainFile.cmake
				   -DHAIKU_SOURCE_DIR=${HAIKU_SOURCE_DIR}
				   -DHAIKU_EXTRA_INSTALL_PREFIX=${CMAKE_CURRENT_SOURCE_DIR}/cmake/precompiled/${HAIKU_ARCH}
		DEPENDS gcc-stage1)

	#### BUILD full GCC
	GenerateGCCStage2()

	add_dependencies(gcc-stage2 glue-code)			   
ENDIF()
