project('test_meson', 'c',
    version : '0.1',
    default_options : ['warning_level=everything']
)

add_languages('fortran')

py_mod = import('python')
py = py_mod.find_installation(pure: false)
py_dep = py.dependency()

subdir('src')