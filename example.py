import ximea as xi
import logging
import cv2
from time import time
logging.basicConfig(level=logging.DEBUG)




# xi.handle_xi_error(1)
print xi.get_device_count()
print xi.get_device_info(0,xi.XI_PRM_DEVICE_MODEL_ID)

cam = xi.Xi_Camera(DevID=0)
cam.set_binning(4)
# cam.set_debug_level("Error")
ts= time()
for x in range(500):
    dt,ts = time()-ts,time()
    img =  cam.get_image()
    print 1/dt,img.shape

    cv2.imshow("test",img)
    cv2.waitKey(1)

cam.close()


