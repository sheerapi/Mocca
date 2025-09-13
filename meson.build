project('mocha', 'cpp', version: '0.0.1')

message('Downloading Skia binaries...')
run_command('./skia.sh', host_machine.system(), 'x64', check: true)

add_project_arguments('-ffunction-sections', '-fdata-sections', '-Wl,--gc-sections', language: 'cpp')
sources = []
dependencies = [dependency('skia')] 

mocha_lib = library(
    'mocha',
    sources: sources,
    dependencies: dependencies,
    include_directories: include_directories('mocha/include'),
)

mocha_dep = declare_dependency(
    link_with: mocha_lib,
    dependencies: dependencies,
    include_directories: include_directories('mocha/include'),
)

executable('sandbox', sources: 'sandbox/main.cpp', dependencies: mocha_dep)