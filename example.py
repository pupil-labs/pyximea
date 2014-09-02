import ximea as xi
import logging
import cv2
from time import time
logging.basicConfig(level=logging.DEBUG)




# xi.handle_xi_error(1)
print xi.get_device_count()
print xi.get_device_info(0,'device_name')

cam = xi.Xi_Camera(DevID=0)
cam.set_debug_level("Warning")
ts= time()
cam.set_param('exposure',10000.0)
# cam.set_param('limit_bandwidth',360)
cam.set_param('aeag',1)
cam.set_param('exp_priority',0)
# cam.set_param('shutter_type',0)
cam.set_binning(4)
cam.set_param('width',400)
cam.set_param('height',300)
cam.set_param('offsetX',50)
cam.set_param('offsetY',50)
print cam.get_param('framerate',float)
for x in range(100):
    dt,ts = time()-ts,time()
    img =  cam.get_image()
    print 1/dt,img.shape

    #comment out below 2 lines to run above 60fps.
    # cv2.imshow("test",img)
    # cv2.waitKey(1)

cam.close()


