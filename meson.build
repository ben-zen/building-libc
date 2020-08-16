# Building the Embedded Artistry libc
project('Embedded Artistry libc',
	['c', 'cpp'],
	default_options : [
	  'c_std=c11',
          'build.c_std=c11', # native: true target
	  'cpp_std=c++17',
          'build.cpp_std=c++17', # native: true target
          'warning_level=3',
          'werror=false',
          'debug=true',
          'optimization=g'
	],
	license: 'MIT',
	meson_version: '>0.51.0',
	version: '1.0')

c_compiler = meson.get_compiler('c')

add_project_arguments(
  c_compiler.get_supported_arguments(
    '-Wno-unknown-pragmas',
    '-Wno-nonnull',
    '-Wno-nonnull-compare'
  ), language: 'c')

debug = get_option('debug')
disable_unimplemented_apis = get_option('hide-unimplemented-libc-apis')
enable_gnu_src = get_option('enable-gnu-extensions')

if debug
  add_project_arguments('-DDEBUG', '-DGDTOA_HOST_DEBUG', language: ['c', 'cpp'])
endif

arch_directory_template = 'arch/@0@/include'
build_machine_arch_includes = include_directories(arch_directory_template.format(build_machine.cpu_family()))
host_machine_arch_includes = include_directories(arch_directory_template.format(host_machine.cpu_family()))

openlibm_includes = include_directories(
  'subprojects/openlibm/include',
  'subprojects/openlibm/src',
  is_system: true
)

openlibm_dep = declare_dependency(
  include_directories: openlibm_includes
)

libprintf_files = files('subprojects/printf/printf.c')
libprintf_includes = include_directories(
  'subprojects/printf',
  is_system: true
)
libprintf = static_library(
  'printf',
  libprintf_files,
  include_directories: libprintf_includes
)
libprintf_dep = declare_dependency(
  include_directories: libprintf_includes,
  link_with: libprintf
)

libprintf_native = static_library(
  'printf_native',
  libprintf_files,
  include_directories: libprintf_includes,
  native: true
)
libprintf_native_dep = declare_dependency(
  include_directories: libprintf_includes,
  link_with: libprintf_native
)

printf_test_files = files('subprojects/printf/test/test_suite.cpp')
printf_tests = executable(
  'printf_tests',
  printf_test_files,
  native: true
)

test('printf_tests',
     printf_tests,
     args: ['-s',
	    '-r',
	    'xml',
	    '-o',
     	    meson.build_root() + '/test/printf_tests.xml'])

run_target('printf-tests',
           command: printf_tests)

run_target('printf-tests-xml',
           command: [printf_tests, '-s', '-r', 'xml', '-o', meson.build_root() + '/test/printf_tests.xml'])

run_target('clear-test-results',
           command: [meson.source_root() + '/tools/clean-xml-tests.sh'])

cmocka_dep = dependency('cmocka', native: true, required: false, fallback: ['cmocka', 'cmocka_native_dep'])
cmocka_inc = include_directories('subprojects/cmocka-1.1.5/include')

subdir('src')
subdir('test')
