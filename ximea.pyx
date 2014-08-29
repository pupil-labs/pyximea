import cython
cimport cximea as xi
from constants import *
cimport numpy as np
import numpy as np
#logging
import logging
logger = logging.getLogger(__name__)


cpdef handle_xi_error(xi.XI_RETURN ret):
    if ret !=0:
        try:
            error = error_codes[ret]
        except KeyError:
            error = ("UNKNOWN","Error not defined in API")

        logger.error(error[0]+": "+error[1])



def get_device_count():
    cdef xi.DWORD num
    handle_xi_error( xi.xiGetNumberDevices(&num) )
    return num

def get_device_info(xi.DWORD DevID, const char* parameter_name):
    cdef char[512] info
    handle_xi_error(xi.xiGetDeviceInfoString(DevID,parameter_name,info,len(parameter_name) ) )
    return info

cdef class Xi_Camera:
    cdef xi.HANDLE _xi_device
    cdef bint aquisition_active
    cdef xi.XI_IMG _xi_image
    def __cinit__(self, xi.DWORD DevID=-1,const char* user_id=NULL,const char* serial=NULL,const char* hw_path=NULL):
        self._xi_device = NULL
        if DevID >=0:
            handle_xi_error( xi.xiOpenDevice(DevID,&self._xi_device) )
        elif user_id:
            handle_xi_error( xi.xiOpenDeviceBy(xi.XI_OPEN_BY_USER_ID,user_id,&self._xi_device) )
        elif serial:
            handle_xi_error( xi.xiOpenDeviceBy(xi.XI_OPEN_BY_USER_ID,serial,&self._xi_device) )
        elif hw_path:
            handle_xi_error( xi.xiOpenDeviceBy(xi.XI_OPEN_BY_USER_ID,hw_path,&self._xi_device) )
        else:
            raise Error("Please init with at one device selction argument.")

        if self._xi_device == NULL:
            raise Error("Could not Open Device.")


    def __init__(self, xi.DWORD DevID=-1,const char* user_id=NULL,const char* serial=NULL,const char* hw_path=NULL):
        self.start_aquisition()

    cdef start_aquisition(self):
        self._xi_image
        self._xi_image.size = SIZE_XI_IMG_V2
        self._xi_image.bp = NULL
        self._xi_image.bp_size = 0



        handle_xi_error( xi.xiSetParamInt(self._xi_device,XI_PRM_HEIGHT,300))
        handle_xi_error( xi.xiSetParamInt(self._xi_device,XI_PRM_WIDTH,400))

        handle_xi_error( xi.xiSetParamInt(self._xi_device,XI_PRM_OFFSET_X,100))
        handle_xi_error( xi.xiSetParamInt(self._xi_device,XI_PRM_OFFSET_Y,100))

        handle_xi_error( xi.xiSetParamInt(self._xi_device,XI_PRM_SHUTTER_TYPE,0))
        # handle_xi_error( xi.xiSetParamInt(self._xi_device,XI_PRM_LIMIT_BANDWIDTH,400*8))

        # handle_xi_error( xi.xiSetParamInt(self._xi_device,XI_PRM_IMAGE_DATA_FORMAT,0))
        # handle_xi_error( xi.xiSetParamInt(self._xi_device,XI_PRM_OUTPUT_DATA_BIT_DEPTH,0))
        handle_xi_error( xi.xiSetParamInt(self._xi_device,XI_PRM_ACQ_TIMING_MODE,0))


        handle_xi_error( xi.xiSetParamInt(self._xi_device,XI_PRM_EXPOSURE,12000)) #just enough for 80fps capture
        handle_xi_error( xi.xiSetParamInt(self._xi_device,XI_PRM_AEAG,1))
        handle_xi_error( xi.xiSetParamFloat(self._xi_device,XI_PRM_EXP_PRIORITY,0))

        # handle_xi_error( xi.xiSetParamFloat(self._xi_device,XI_PRM_GAIN,8))
        # handle_xi_error( xi.xiSetParamInt(self._xi_device,XI_PRM_BUFFER_POLICY,xi.XI_BP_SAFE))


        handle_xi_error( xi.xiStartAcquisition(self._xi_device) )
        self.aquisition_active = True

    cdef stop_aquisition(self):
        handle_xi_error( xi.xiStopAcquisition(self._xi_device) )
        self.aquisition_active = False

    def set_binning(self,xi.DWORD bin_level):
        self.stop_aquisition()
        handle_xi_error( xi.xiSetParamInt(self._xi_device,XI_PRM_DOWNSAMPL_TYPE,XI_SKIPPING))
        handle_xi_error( xi.xiSetParamInt(self._xi_device,XI_PRM_DOWNSAMPL,bin_level))
        self.start_aquisition()


    def set_debug_level(self,level):
        '''
        set lgging verbosity for this camera:
            Detail   : Same as trace plus locking resources
            Trace    : Information level.
            Warning  : Warning level.
            Error    : Error level.
            Fatal    : Fatal error level.
            Disabled : Print no errors at all.

        '''
        try:
            lvl = logger_levels[level]
        except KeyError:
            raise Exception("Level '%s' not avaible in API"%level)
        handle_xi_error( xi.xiSetParamInt(self._xi_device,XI_PRM_DEBUG_LEVEL,lvl) )



    def get_image(self, xi.DWORD timeout_ms=500):
        cdef xi.XI_RETURN ret
        ret = xi.xiGetImage(self._xi_device,timeout_ms,&self._xi_image)

        if ret != 0:
            handle_xi_error(ret)
            raise Error("Image aquisition error")
        cdef np.npy_intp shape[1]
        # print self._xi_image.width,self._xi_image.height,self._xi_image.bp_size,self._xi_image.tsSec,self._xi_image.nframe

        cdef int [:, :, :] carr_view #dummy init for compiler....
        # img_array = np.asarray(<np.uint8_t[:self._xi_image.bp_size,]> self._xi_image.bp).reshape((self._xi_image.height,self._xi_image.width))
        img_array = np.asarray(<np.uint8_t[:self._xi_image.height*self._xi_image.width,]> self._xi_image.bp).reshape((self._xi_image.height,self._xi_image.width))
        return img_array

    def close(self):
        self.stop_aquisition()

    def __dealloc__(self):
        if self._xi_device is not NULL:
            handle_xi_error( xi.xiCloseDevice(self._xi_device) )




