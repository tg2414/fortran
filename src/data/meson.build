# find all *dat files
data_sources = run_command(py,
    ['-c', 'import glob; import os; files = glob.glob("./*dat"); names = [os.path.basename(f) for f in files]; print(*names, sep=" ")']
).stdout().strip().split(' ')

# install *dat files
py.install_sources(
    data_sources,
    subdir : 'test_meson/data'
)