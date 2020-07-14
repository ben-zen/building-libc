# Define src build

gdtoa_files = files(
  'gdtoa/src/dmisc.c',
  'gdtoa/src/dtoa.c',
  'gdtoa/src/g__fmt.c',
  'gdtoa/src/g_ddfmt.c',
  'gdtoa/src/g_dfmt.c',
  'gdtoa/src/g_ffmt.c',
  'gdtoa/src/g_Qfmt.c',
  'gdtoa/src/g_xfmt.c',
  'gdtoa/src/g_xLfmt.c',
  'gdtoa/src/gdtoa.c',
  'gdtoa/src/gethex.c',
  'gdtoa/src/gmisc.c',
  'gdtoa/src/hd_init.c',
  'gdtoa/src/hexnan.c',
  'gdtoa/src/misc.c',
  'gdtoa/src/smisc.c',
  'gdtoa/src/strtod.c',
  'gdtoa/src/strtodg.c',
  'gdtoa/src/strtodI.c',
  'gdtoa/src/strtof.c',
  'gdtoa/src/strtoId.c',
  'gdtoa/src/strtoIdd.c',
  'gdtoa/src/strtoIf.c',
  'gdtoa/src/strtoIg.c',
  'gdtoa/src/strtoIQ.c',
  'gdtoa/src/strtoIx.c',
  'gdtoa/src/strtoIxL.c',
  'gdtoa/src/strtopd.c',
  'gdtoa/src/strtopdd.c',
  'gdtoa/src/strtopf.c',
  'gdtoa/src/strtopQ.c',
  'gdtoa/src/strtopx.c',
  'gdtoa/src/strtopxL.c',
  'gdtoa/src/strtord.c',
  'gdtoa/src/strtordd.c',
  'gdtoa/src/strtorf.c',
  'gdtoa/src/strtorQ.c',
  'gdtoa/src/strtorx.c',
  'gdtoa/src/strtorxL.c',
  'gdtoa/src/sum.c',
  'gdtoa/src/ulp.c'
)

gdtoa_includes = include_directories('gdtoa/include')

gdtoa_compiler_flags = [
  '-DNO_ERRNO',
  '-DIFNAN_CHECK',
  '-DGDTOA_NO_ASSERT',
  '-DNO_FENV_H'
]

libgdtoa = static_library('gdtoa',
			  gdtoa_files,
			  include_directories: gdtoa_includes,
			  c_args: gdtoa_compiler_flags,
			 )
