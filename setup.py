import os, platform
import numpy

from distutils.core import setup
from distutils.extension import Extension
from Cython.Build import cythonize

if platform.system() == 'Darwin':
    includes = [numpy.get_include()]
    f = '-framework'
    link_args = [f, 'm3api']
    libs = []
else:
    includes = [numpy.get_include()]
    libs = ['m3api']
    link_args = []



# extra_objects=["../build/libnanovg.a"]

extensions = [
    Extension(  name="ximea",
                sources=['ximea.pyx'],
                include_dirs = includes,
                libraries = libs,
                extra_link_args=link_args,
                # extra_compile_args=[]
            ),
]

setup(  name="ximea",
        version="0.0.1",
        description="Ximea XiAPI Python Bindings",
        ext_modules=cythonize(extensions)
)