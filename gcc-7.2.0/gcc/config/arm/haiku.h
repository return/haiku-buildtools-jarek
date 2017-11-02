/* Definitions of target machine for GNU compiler, HaikuOS/arm version.
   Copyright (C) 2002-2017 Free Software Foundation, Inc.
   
   This file is part of GCC.

   GCC is free software; you can redistribute it and/or modify it
   under the terms of the GNU General Public License as published
   by the Free Software Foundation; either version 3, or (at your
   option) any later version.

   GCC is distributed in the hope that it will be useful, but WITHOUT
   ANY WARRANTY; without even the implied warranty of MERCHANTABILITY
   or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public
   License for more details.

   Under Section 7 of GPL version 3, you are granted additional
   permissions described in the GCC Runtime Library Exception, version
   3.1, as published by the Free Software Foundation.

   You should have received a copy of the GNU General Public License
   along with GCC; see the file COPYING3.  If not see
   <http://www.gnu.org/licenses/>.  */

/* Run-time Target Specification.  */
#undef  TARGET_DEFAULT_FLOAT_ABI
#define TARGET_DEFAULT_FLOAT_ABI ARM_FLOAT_ABI_HARD

/* TARGET_BIG_ENDIAN_DEFAULT is set in
   config.gcc for big endian configurations.  */
#if TARGET_BIG_ENDIAN_DEFAULT
#define TARGET_ENDIAN_DEFAULT    MASK_BIG_END
#define TARGET_ENDIAN_OPTION     "mbig-endian"
#define TARGET_LINKER_EMULATION  "armelfb_haiku"
#else
#define TARGET_ENDIAN_DEFAULT    0
#define TARGET_ENDIAN_OPTION     "mlittle-endian"
#define TARGET_LINKER_EMULATION  "armelf_haiku"
#endif

#define ARM_TARGET2_DWARF_FORMAT (DW_EH_PE_pcrel | DW_EH_PE_indirect)

#undef  TARGET_OS_CPP_BUILTINS
#define TARGET_OS_CPP_BUILTINS() 		\
  do						\
    {						\
	HAIKU_TARGET_OS_CPP_BUILTINS ();	\
	TARGET_BPABI_CPP_BUILTINS ();		\
	builtin_define ("__ARM__");			\
    }						\
  while (false)

/* We default to a soft-float ABI so that binaries can run on all
   target hardware.  */
#undef TARGET_DEFAULT_FLOAT_ABI
#ifdef TARGET_FREEBSD_ARM_HARD_FLOAT
#define TARGET_DEFAULT_FLOAT_ABI ARM_FLOAT_ABI_HARD
#else
#define TARGET_DEFAULT_FLOAT_ABI ARM_FLOAT_ABI_SOFT
#endif

#undef ARM_DEFAULT_ABI

/* AACPS_LINUX has access to kernel atomic ops while we don't.
   But AACPS defaults to short_enums.  */
#define ARM_DEFAULT_ABI ARM_ABI_AAPCS_LINUX

#undef TARGET_DEFAULT
#define TARGET_DEFAULT (TARGET_ENDIAN_DEFAULT)

/* We do not have any MULTILIB_OPTIONS specified, so there are no
   MULTILIB_DEFAULTS.  */
#undef  MULTILIB_DEFAULTS

/* Use the default LIBGCC_SPEC, not the empty version in haiku.h, as we
   do not use multilib (needed ??).  */
#undef LIBGCC_SPEC

/* If ELF is the default format, we should not use /lib/elf.  */

#define SUBTARGET_EXTRA_LINK_SPEC " -m " TARGET_LINKER_EMULATION " -p"

#undef	LINK_SPEC
#define LINK_SPEC  "%{h*} \
   %{static:-Bstatic} \
   %{shared:-shared} \
   %{symbolic:-Bsymbolic} \
   %{!static: \
     %{rdynamic:-export-dynamic} \
     %{!shared:-dynamic-linker " HAIKU_DYNAMIC_LINKER "}} \
   -X \
   %{mbig-endian:-EB} %{mlittle-endian:-EL}" \
   SUBTARGET_EXTRA_LINK_SPEC

#undef SUBTARGET_ASM_FLOAT_SPEC
#ifdef TARGET_FREEBSD_ARM_HARD_FLOAT
/* Default to full vfp if we build for arm*hf.  */
#define SUBTARGET_ASM_FLOAT_SPEC "%{!mfpu=*:-mfpu=vfp}"
#else
#define SUBTARGET_ASM_FLOAT_SPEC "%{!mfpu=*:-mfpu=softvfp}"
#endif

#undef  SUBTARGET_CPP_SPEC
#define SUBTARGET_CPP_SPEC HAIKU_CPP_SPEC

#undef  SUBTARGET_EXTRA_SPECS
#define SUBTARGET_EXTRA_SPECS					\
  { "subtarget_extra_asm_spec",	SUBTARGET_EXTRA_ASM_SPEC },	\
  { "subtarget_asm_float_spec", SUBTARGET_ASM_FLOAT_SPEC }, 	\
  { "haiku_dynamic_linker", HAIKU_DYNAMIC_LINKER }

/* We do not have any MULTILIB_OPTIONS specified, so there are no
   MULTILIB_DEFAULTS.  */
#undef  MULTILIB_DEFAULTS
