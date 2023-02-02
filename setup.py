from setuptools import setup, Extension
from Cython.Build import cythonize
import numpy as np 


exts = []
exts.append(Extension(
    name="clib.cfoo",
    sources=['clib/cfoo.pyx', 'clib/foo.c'],
    include_dirs=['clib', np.get_include()]
))


setup(
    ext_modules=cythonize(exts)
)