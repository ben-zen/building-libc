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

build_c_compiler = meson.get_compiler('c', native: true)
host_c_compiler = meson.get_compiler('c', native: false)

project_arguments = [
  '-Wno-unknown-pragmas',
  '-Wno-nonnull',
  '-Wno-nonnull-compare']
add_project_arguments(
  build_c_compiler.get_supported_arguments(
    project_arguments
  ), language: 'c', native: true)

add_project_arguments(
  host_c_compiler.get_supported_arguments(
    project_arguments
  ), language: 'c', native: false)


debug = get_option('debug')
disable_builtins = get_option('disable-builtins')
disable_stack_protection = get_option('disable-stack-protection')
disable_unimplemented_apis = get_option('hide-unimplemented-libc-apis')
enable_gnu_src = get_option('enable-gnu-extensions')


if debug
  debug_flags = ['-DDEBUG']
  add_project_arguments(debug_flags, language: ['c', 'cpp'])
  add_project_arguments(debug_flags, language: ['c', 'cpp'], native: true)
endif

arch_directory_template = 'arch/@0@/include'
build_machine_path = arch_directory_template.format(build_machine.cpu_family())
build_machine_arch_includes = include_directories(build_machine_path)
build_machine_arch_sys_includes = include_directories(build_machine_path, is_system: true)
host_machine_path = arch_directory_template.format(host_machine.cpu_family())
host_machine_arch_includes = include_directories(host_machine_path)
host_machine_arch_sys_includes = include_directories(host_machine_path, is_system: true)

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

printf_dep = declare_dependency(
  include_directories: libprintf_includes,
  sources: libprintf_files,
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
