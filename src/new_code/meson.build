# include directory for numpy 
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
  include_directories: [inc_np, inc_f2py]
)
fortranobject_dep = declare_dependency(
  link_with: fortranobject_lib,
  include_directories: [inc_np, inc_f2py],
)

openmp_dep = dependency('openmp', language: 'fortran') # will build but wont use the fortran file
# linker_dep = dependency('lgomp', language: 'fortran')
# openmp_dep = dependency('openmp') 
# openmp_dep = dependency('-openmp') # wont build 


numpy_nodepr_api = '-DNPY_NO_DEPRECATED_API=NPY_1_9_API_VERSION'

# combine fortran files
fortran_src = [
  'fortran_src/t_fortran.f90'
]

# link and compile fortran code
fortran_module = custom_target('t_fortran_module',
  input: fortran_src,
  output : ['t_fortran_modulemodule.c', 't_fortran_module-f2pywrappers2.f90'],
  command : [py, '-m', 'numpy.f2py', '-m', 't_fortran_module', '@INPUT@', '--build-dir', '@OUTDIR@']
)

py.extension_module('t_fortran_module',
    [fortran_src, fortran_module],
    c_args : numpy_nodepr_api,
    include_directories : inc_np,
    dependencies : [fortranobject_dep, openmp_dep],
    link_language : 'fortran',
    install : true,
    subdir : 't_fortran_package'
)

# python sources
python_sources = [
    't_python.py'
]

py.install_sources(
    python_sources,
    subdir : 't_python_package'
)
