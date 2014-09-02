import cython
cimport cximea as xi
from constants import *
cimport numpy as np
import numpy as np
#logging
import logging
logger = logging.getLogger(__name__)


class XI_Error(Exception):
    """General Exception for this module"""
    def __init__(self, arg):
        super(XI_Error, self).__init__()
        self.arg = arg


class XI_Wrong_Param_Type_Error(Exception):
    """Parameter Type was wrong."""
    def __init__(self, arg):
        super(XI_Wrong_Param_Type_Error, self).__init__()
        self.arg = arg




cpdef handle_xi_error(xi.XI_RETURN ret):
    if ret !=0:
        try:
            error = error_codes[ret]
        except KeyError:
            error = ("UNKNOWN","Error not defined in API")
        if ret == 103:
            raise XI_Wrong_Param_Type_Error("Wrong Paramter Type")
        elif ret == 101:
            logger.warning(error[0]+": "+error[1])
        else:
            logger.warning(error[0]+": "+error[1])
            # raise XI_Error(error[0]+": "+error[1])



def get_device_count():
    cdef xi.DWORD num
    handle_xi_error( xi.xiGetNumberDevices(&num) )
    return num

def get_device_info(xi.DWORD DevID, const char* parameter_name):
    """
    devID: device id (0-n)
    parameter_name:
        "device_name"
        "device_type"
        "device_sn"
        "device_inst_path"
    """
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
            raise Exception("Please init with at one device selction argument.")

        if self._xi_device == NULL:
            raise Exception("Could not Open Device.")


    def __init__(self, xi.DWORD DevID=-1,const char* user_id=NULL,const char* serial=NULL,const char* hw_path=NULL):
        self.aquisition_active = False

    def set_param(self,const char* param_name,value):
        '''
        set paramter:
        param_name : see constants.py
        val: value to set, type depends on param, usually float
        '''
        self.stop_aquisition()
        if type(value) == int:
            handle_xi_error( xi.xiSetParamInt(self._xi_device,param_name,value))
        elif type(value) == float:
            handle_xi_error( xi.xiSetParamFloat(self._xi_device,param_name,value))
        elif type(value) == str:
            handle_xi_error( xi.xiSetParamString(self._xi_device,param_name,<char*>value,len(value)))
        else:
            logger.warning("value is not int,float or string")

    def get_param(self,const char* param_name,type_hint=None):
        '''
        get paramter:
        param_name : see constants.py
        '''
        cdef int int_value
        cdef float float_value
        cdef char[512] string
        if type_hint is not None:
            if type_hint == int:
                int_value = 0
                handle_xi_error( xi.xiGetParamInt(self._xi_device,param_name,&int_value))
                return int_value
            elif type_hint == float:
                float_value = 0.0
                handle_xi_error( xi.xiGetParamFloat(self._xi_device,param_name,&float_value))
                return float_value
            elif type_hint == str:
                string
                handle_xi_error( xi.xiGetParamString(self._xi_device,param_name,string,len(string)))
                return string

        else:
            try:
                float_value = 0.0
                handle_xi_error( xi.xiGetParamFloat(self._xi_device,param_name,&float_value))
                return float_value
            except XI_Wrong_Param_Type_Error:
                #its not an int lets try float
                pass
            try:
                int_value = 0
                handle_xi_error( xi.xiGetParamInt(self._xi_device,param_name,&int_value))
                return int_value
            except XI_Wrong_Param_Type_Error:
                #ints not a float, lets try str.
                pass
            string
            handle_xi_error( xi.xiGetParamString(self._xi_device,param_name,string,len(string)))
            return string


    cdef start_aquisition(self):
        self._xi_image
        self._xi_image.size = SIZE_XI_IMG_V2
        self._xi_image.bp = NULL
        self._xi_image.bp_size = 0

        handle_xi_error( xi.xiSetParamInt(self._xi_device,XI_PRM_BUFFER_POLICY,xi.XI_BP_SAFE))
        handle_xi_error( xi.xiStartAcquisition(self._xi_device) )
        self.aquisition_active = True

    cdef stop_aquisition(self):
        if self.aquisition_active:
            handle_xi_error( xi.xiStopAcquisition(self._xi_device) )
            self.aquisition_active = False

    def set_binning(self,xi.DWORD bin_level):
        self.stop_aquisition()
        handle_xi_error( xi.xiSetParamInt(self._xi_device,XI_PRM_DOWNSAMPLING_TYPE,XI_SKIPPING))
        handle_xi_error( xi.xiSetParamInt(self._xi_device,XI_PRM_DOWNSAMPLING,bin_level))


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
        if not self.aquisition_active:
            self.start_aquisition()
        cdef xi.XI_RETURN ret
        ret = xi.xiGetImage(self._xi_device,timeout_ms,&self._xi_image)
        if ret != 0:
            handle_xi_error(ret)
            raise Error("Image aquisition error")
        # print self._xi_image.width,self._xi_image.height,self._xi_image.bp_size,self._xi_image.tsSec,self._xi_image.nframe

        cdef int [:, :, :] carr_view #dummy init for compiler....
        img_array = np.asarray(<np.uint8_t[:self._xi_image.bp_size]> self._xi_image.bp).reshape((self._xi_image.height,self._xi_image.width))
        # img_array = np.asarray(<np.uint8_t[:self._xi_image.height*self._xi_image.width,]> self._xi_image.bp).reshape((self._xi_image.height,self._xi_image.width))
        return img_array

    def close(self):
        self.stop_aquisition()

    def __dealloc__(self):
        if self._xi_device is not NULL:
            handle_xi_error( xi.xiCloseDevice(self._xi_device) )


