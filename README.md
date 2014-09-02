pyximea
=======

Python bindings for ximea XiAPI

## example code
```python
import ximea as xi
cam = xi.Xi_Camera(DevID=0)
cam.set_param('exposure',10000.0)
img =  cam.get_image()
cam.close()
```


## building
###MacOS
install ximea framework
cd your_local_clone
python setup.py build_ext -i

###Linux (Ubnutu)
todo
