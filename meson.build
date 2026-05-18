project(
    'libcs50',
    'c',
    version: '11.1.0',
    default_options: [
        'c_std=c11',
        'warning_level=3',
        'default_library=both',
    ],
)

libcs50_inc = include_directories('src')

libcs50 = library(
    'cs50',
    'src/cs50.c',
    include_directories: libcs50_inc,
    version: meson.project_version(),
    soversion: '11',
    gnu_symbol_visibility: 'default',
    install: true,
)

# Declare a dependency so this can be used as a Meson subproject
libcs50_dep = declare_dependency(
    include_directories: libcs50_inc,
    link_with: libcs50,
)
meson.override_dependency('libcs50', libcs50_dep)

install_headers('src/cs50.h')

install_data('src/cs50.c', install_dir: get_option('prefix') / 'src')

install_man(
    'docs/get_char.3',
    'docs/get_double.3',
    'docs/get_float.3',
    'docs/get_int.3',
    'docs/get_long.3',
    'docs/get_long_long.3',
    'docs/get_string.3'
)

pkg = import('pkgconfig')
pkg.generate(
    libcs50,
    name: 'libcs50',
    description: 'CS50 library for C',
    version: meson.project_version(),
)

cmake_config = configuration_data()
cmake_config.set('LIBCS50_INCLUDEDIR',get_option('includedir'),)
cmake_config.set('LIBCS50_LIBDIR',  get_option('libdir'))

configure_file(
    input: 'cmake/libcs50Config.cmake.in',
    output: 'libcs50Config.cmake',
    configuration: cmake_config,
    install: true,
    install_dir: get_option('libdir') / 'cmake' / 'libcs50',
)
configure_file(
    input: 'cmake/libcs50Targets.cmake.in',
    output: 'libcs50Targets.cmake',
    configuration: cmake_config,
    install: true,
    install_dir: get_option('libdir') / 'cmake' / 'libcs50',
)
