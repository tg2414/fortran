 
# include directory for numpy numpy 
incdir_numpy = run_command(py,
  ['-c', 'import os; os.chdir(".."); import numpy; print(numpy.get_include())'],
  check : true
).stdout().strip()
inc_np = include_directories(incdir_numpy)

# include f2py
incdir_f2py = run_command(py,
    ['-c', 'import os; os.chdir(".."); import numpy.f2py; print(numpy.f2py.get_include())'],
    check : true
).stdout().strip()
inc_f2py = include_directories(incdir_f2py)
fortranobject_c = incdir_f2py / 'fortranobject.c'

# f2py fortran library
fortranobject_lib = static_library('_fortranobject',
  fortranobject_c,
  dependencies: py_dep,
  include_directories: [inc_np, inc_f2py],
)
fortranobject_dep = declare_dependency(
  link_with: fortranobject_lib,
  include_directories: [inc_np, inc_f2py],
)

numpy_nodepr_api = '-DNPY_NO_DEPRECATED_API=NPY_1_9_API_VERSION'

# works
# # link and compile fortran code
# fortran_module = custom_target('fortran_code',
#   input: 'fortran_source_code/fortran_code.f90',
#   output : ['fortran_codemodule.c', 'fortran_code-f2pywrappers2.f90'],
#   command : [py, '-m', 'numpy.f2py', '-m', 'fortran_code', '@INPUT@', '--build-dir', '@OUTDIR@']
# )
# py.extension_module('fortran_code',
#     ['fortran_source_code/fortran_code.f90', fortran_module],
#     c_args : numpy_nodepr_api,
#     include_directories : inc_np,
#     dependencies : fortranobject_dep,
#     link_language : 'fortran',
#     install : true,
#     subdir : 'test_meson'
# )

# combine fortran files
fortran_src = [
  'fortran_source_code/fortran_code.f90',
  'fortran_source_code/fortran_code2.f90'
]

# link and compile fortran code
fortran_module = custom_target('fortran_code_bundle',
  input: fortran_src,
  output : ['fortran_code_bundlemodule.c', 'fortran_code_bundle-f2pywrappers2.f90'],
  command : [py, '-m', 'numpy.f2py', '-m', 'fortran_code_bundle', '@INPUT@', '--build-dir', '@OUTDIR@']
)
py.extension_module('fortran_code_bundle',
    [['fortran_source_code/fortran_code.f90','fortran_source_code/fortran_code2.f90'], fortran_module],
    c_args : numpy_nodepr_api,
    include_directories : inc_np,
    dependencies : fortranobject_dep,
    link_language : 'fortran',
    install : true,
    subdir : 'fortran_code_sub_directory'
)

# python sources
python_sources = [
    '__init__.py',
    'main.py'
]

py.install_sources(
    python_sources,
    subdir : 'python_code_sub_directory'
)

# look inside these directories for more meson.build files 
subdir('data')
subdir('new_code')
