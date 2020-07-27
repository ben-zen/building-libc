# Building the Embedded Artistry libc
project('Embedded Artistry libc',
	['c', 'cpp'],
	default_options : [
	  'c_std=c11',
	  'cpp_std=c++17'
	],
	license: 'MIT',
	meson_version: '>0.51.0',
	version: '1.0')


libbsd_dep = meson.get_compiler('c').find_library('bsd')

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

printf_test_files = files('subprojects/printf/test/test_suite.cpp')
printf_tests = executable('printf_tests',
                          printf_test_files)

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

cmocka_dep = dependency('cmocka', required: false, fallback: ['cmocka', 'cmocka_dep'])


subdir('src')
subdir('test')
