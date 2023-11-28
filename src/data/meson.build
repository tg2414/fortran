data_sources = [
    'data.dat'
]

files = run_command(py,
    ['-c', 'import glob; import os; cwd = os.getcwd(); files = glob.glob("./*dat"); print([os.path.basename(f) for f in files])']
).stdout().strip()

message(files)

py.install_sources(
    data_sources,
    subdir : 'test_meson/data'
)