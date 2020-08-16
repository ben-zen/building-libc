libc_test_files = files(
  'main.c',
  'ctype/ctype_tests.c',
  'ctype/isalnum.c',
  'ctype/isalpha.c',
  'ctype/isascii.c',
  'ctype/isblank.c',
  'ctype/iscntrl.c',
  'ctype/isdigit.c',
  'ctype/isgraph.c',
  'ctype/islower.c',
  'ctype/isprint.c',
  'ctype/ispunct.c',
  'ctype/isspace.c',
  'ctype/isupper.c',
  'ctype/isxdigit.c',
  'ctype/toascii.c',
  'ctype/tolower.c',
  'ctype/toupper.c',
  'stdlib/abs.c',
  'stdlib/atof.c',
  'stdlib/atoi.c',
  'stdlib/atol.c',
  'stdlib/atoll.c',
  'stdlib/bsearch.c',
  'stdlib/calloc.c',
  'stdlib/div.c',
  'stdlib/heapsort.c',
  'stdlib/imaxabs.c',
  'stdlib/imaxdiv.c',
  'stdlib/labs.c',
  'stdlib/ldiv.c',
  'stdlib/llabs.c',
  'stdlib/lldiv.c',
  'stdlib/qsort_r.c',
  'stdlib/qsort.c',
  'stdlib/rand.c',
  'stdlib/realloc.c',
  'stdlib/stdlib_tests.c',
  'stdlib/strtod.c',
  'stdlib/strtof.c',
  'stdlib/strtol.c',
  'stdlib/strtoll.c',
  'stdlib/strtoul.c',
  'stdlib/strtoull.c',
  'string/memcmp.c',
  'string/memcpy.c',
  'string/memmem.c',
  'string/memmove.c',
  'string/memset.c',
  'string/strcat.c',
  'string/strchr.c',
  'string/strcmp.c',
  'string/strcpy.c',
  'string/strdup.c',
  'string/string_tests.c',
  'string/strlen.c',
  'string/strncat.c',
  'string/strncmp.c',
  'string/strncpy.c',
  'string/strndup.c',
  'string/strnlen.c',
  'string/strnstr.c',
  'string/strrchr.c',
  'string/strstr.c',
  'string/strtok.c',
  'test/rand.c'
)

libc_test_flags = build_c_compiler.get_supported_arguments(
  '-Wno-unused-parameter'
)

libc_tests = executable(
  'libc_test',
  libc_test_files,
  c_args: libc_test_flags,
  include_directories: [cmocka_inc],
  dependencies: [cmocka_dep, libc_native_dep],
  native: true
)

test_output_dir = 'CMOCKA_XML_FILE=' + meson.build_root() + '/test/%g.xml'
test('libc_tests',
     libc_tests,
     env: [test_output_dir])

run_target('libc-tests-xml',
           command: [
             meson.source_root() + '/tools/run_with_env.sh',
             libc_tests,
             test_output_dir],
           depends: [ libc_tests ])
            
