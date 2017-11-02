cmake_minimum_required(VERSION 2.8)
project(cross-runtime)

enable_language(C)
enable_language(ASM)

set(CMAKE_CRT_GLUE_LINK_CREATE_SHARED_LIBRARY 	"${CMAKE_COMMAND} -E copy <OBJECTS> <TARGET>" CACHE STRING "" FORCE)

include_directories(${HAIKU_SOURCE_DIR}/headers/private)

FUNCTION(MakeGlue _Src _Dst)
	ADD_LIBRARY(${_Dst}
		SHARED
		${_Src})
		
	SET_TARGET_PROPERTIES(${_Dst}
		PROPERTIES 
		PREFIX ""
		SUFFIX ".o"
		LINKER_LANGUAGE CRT_GLUE_LINK)
ENDFUNCTION()

MakeGlue(${HAIKU_SOURCE_DIR}/src/system/glue/haiku_version_glue.c haiku_version_glue)
MakeGlue(${HAIKU_SOURCE_DIR}/src/system/glue/init_term_dyn.c init_term_dyn)
MakeGlue(${HAIKU_SOURCE_DIR}/src/system/glue/start_dyn.c start_dyn)
MakeGlue(${HAIKU_SOURCE_DIR}/src/system/glue/arch/${HAIKU_ARCH}/crti.S crti)
MakeGlue(${HAIKU_SOURCE_DIR}/src/system/glue/arch/${HAIKU_ARCH}/crtn.S crtn)

add_library(root
	SHARED
	${HAIKU_SOURCE_DIR}/src/system/libroot/stubbed/libroot_stubs.c)

set_property(TARGET root PROPERTY LINK_FLAGS "-nostdlib -Wl,--version-script=${HAIKU_SOURCE_DIR}/src/system/libroot/libroot_versions")
set_property(TARGET root APPEND PROPERTY LINK_DEPENDS ${HAIKU_SOURCE_DIR}/src/system/libroot/libroot_versions)

install(TARGETS haiku_version_glue init_term_dyn start_dyn crti crtn root
	DESTINATION ${CMAKE_INSTALL_PREFIX})

install(TARGETS haiku_version_glue init_term_dyn start_dyn crti crtn root
	DESTINATION ${HAIKU_EXTRA_INSTALL_PREFIX})

