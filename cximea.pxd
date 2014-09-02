

cdef extern from "m3api/xiApi.h": #ifndef apple:  "xiApi.h"


    ctypedef int XI_RETURN
    ctypedef unsigned DWORD
    ctypedef void*   HANDLE
    ctypedef HANDLE* PHANDLE
    ctypedef HANDLE* LPHANDLE
    ctypedef void*   LPVOID
    ctypedef  DWORD*   PDWORD


    # Error codes xiApi
    cdef enum XI_RET:
        XI_OK                             =  0, #Function call succeeded
        XI_INVALID_HANDLE                 =  1, #Invalid handle
        XI_READREG                        =  2, #Register read error
        XI_WRITEREG                       =  3, #Register write error
        XI_FREE_RESOURCES                 =  4, #Freeing resiurces error
        XI_FREE_CHANNEL                   =  5, #Freeing channel error
        XI_FREE_BANDWIDTH                 =  6, #Freeing bandwith error
        XI_READBLK                        =  7, #Read block error
        XI_WRITEBLK                       =  8, #Write block error
        XI_NO_IMAGE                       =  9, #No image
        XI_TIMEOUT                        = 10, #Timeout
        XI_INVALID_ARG                    = 11, #Invalid arguments supplied
        XI_NOT_SUPPORTED                  = 12, #Not supported
        XI_ISOCH_ATTACH_BUFFERS           = 13, #Attach buffers error
        XI_GET_OVERLAPPED_RESULT          = 14, #Overlapped result
        XI_MEMORY_ALLOCATION              = 15, #Memory allocation error
        XI_DLLCONTEXTISNULL               = 16, #DLL context is NULL
        XI_DLLCONTEXTISNONZERO            = 17, #DLL context is non zero
        XI_DLLCONTEXTEXIST                = 18, #DLL context exists
        XI_TOOMANYDEVICES                 = 19, #Too many devices connected
        XI_ERRORCAMCONTEXT                = 20, #Camera context error
        XI_UNKNOWN_HARDWARE               = 21, #Unknown hardware
        XI_INVALID_TM_FILE                = 22, #Invalid TM file
        XI_INVALID_TM_TAG                 = 23, #Invalid TM tag
        XI_INCOMPLETE_TM                  = 24, #Incomplete TM
        XI_BUS_RESET_FAILED               = 25, #Bus reset error
        XI_NOT_IMPLEMENTED                = 26, #Not implemented
        XI_SHADING_TOOBRIGHT              = 27, #Shading too bright
        XI_SHADING_TOODARK                = 28, #Shading too dark
        XI_TOO_LOW_GAIN                   = 29, #Gain is too low
        XI_INVALID_BPL                    = 30, #Invalid bad pixel list
        XI_BPL_REALLOC                    = 31, #Bad pixel list realloc error
        XI_INVALID_PIXEL_LIST             = 32, #Invalid pixel list
        XI_INVALID_FFS                    = 33, #Invalid Flash File System
        XI_INVALID_PROFILE                = 34, #Invalid profile
        XI_INVALID_CALIBRATION            = 35, #Invalid calibration
        XI_INVALID_BUFFER                 = 36, #Invalid buffer
        XI_INVALID_DATA                   = 38, #Invalid data
        XI_TGBUSY                         = 39, #Timing generator is busy
        XI_IO_WRONG                       = 40, #Wrong operation open/write/read/close
        XI_ACQUISITION_ALREADY_UP         = 41, #Acquisition already started
        XI_OLD_DRIVER_VERSION             = 42, #Old version of device driver installed to the system
        XI_GET_LAST_ERROR                 = 43, #To get error code please call GetLastError function.
        XI_CANT_PROCESS                   = 44, #Data can't be processed
        XI_ACQUISITION_STOPED             = 45, #Acquisition has been stopped. It should be started b
        XI_ACQUISITION_STOPED_WERR        = 46, #Acquisition has been stoped with error.
        XI_INVALID_INPUT_ICC_PROFILE      = 47, #Input ICC profile missed or corrupted
        XI_INVALID_OUTPUT_ICC_PROFILE     = 48, #Output ICC profile missed or corrupted
        XI_DEVICE_NOT_READY               = 49, #Device not ready to operate
        XI_SHADING_TOOCONTRAST            = 50, #Shading too contrast
        XI_ALREADY_INITIALIZED            = 51, #Modile already initialized
        XI_NOT_ENOUGH_PRIVILEGES          = 52, #Application doesn't enough privileges(one or more ap
        XI_NOT_COMPATIBLE_DRIVER          = 53, #Installed driver not compatible with current softwar
        XI_TM_INVALID_RESOURCE            = 54, #TM file was not loaded successfully from resources
        XI_DEVICE_HAS_BEEN_RESETED        = 55, #Device has been reseted, abnormal initial state
        XI_NO_DEVICES_FOUND               = 56, #No Devices Found
        XI_RESOURCE_OR_FUNCTION_LOCKED    = 57, #Resource(device) or function locked by mutex
        XI_BUFFER_SIZE_TOO_SMALL          = 58, #Buffer provided by user is too small
        XI_UNKNOWN_PARAM                  =100, #Unknown parameter
        XI_WRONG_PARAM_VALUE              =101, #Wrong parameter value
        XI_WRONG_PARAM_TYPE               =103, #Wrong parameter type
        XI_WRONG_PARAM_SIZE               =104, #Wrong parameter size
        XI_BUFFER_TOO_SMALL               =105, #Input buffer too small
        XI_NOT_SUPPORTED_PARAM            =106, #Parameter info not supported
        XI_NOT_SUPPORTED_PARAM_INFO       =107, #Parameter info not supported
        XI_NOT_SUPPORTED_DATA_FORMAT      =108, #Data format not supported
        XI_READ_ONLY_PARAM                =109, #Read only parameter
        XI_BANDWIDTH_NOT_SUPPORTED        =111, #This camera does not support currently available ba
        XI_INVALID_FFS_FILE_NAME          =112, #FFS file selector is invalid or NULL
        XI_FFS_FILE_NOT_FOUND             =113, #FFS file not found
        XI_PROC_OTHER_ERROR               =201, #Processing error - other
        XI_PROC_PROCESSING_ERROR          =202, #Error while image processing.
        XI_PROC_INPUT_FORMAT_UNSUPPORTED  =203, #Input format is not supported for processing.
        XI_PROC_OUTPUT_FORMAT_UNSUPPORTED =204, #Output format is not supported for processing.

    #-------------------------------------------------------------------------------------------------------------------
    # xiAPI enumerators
    # Debug level enumerator.
    cdef enum XI_DEBUG_LEVEL:
        XI_DL_DETAIL                 =0, # Same as trace plus locking resources
        XI_DL_TRACE                  =1, # Information level.
        XI_DL_WARNING                =2, # Warning level.
        XI_DL_ERROR                  =3, # Error level.
        XI_DL_FATAL                  =4, # Fatal error level.
        XI_DL_DISABLED               =100, # Print no errors at all.


    # structure containing information about output image format
    cdef enum XI_IMG_FORMAT:
        XI_MONO8                     =0, # 8 bits per pixel
        XI_MONO16                    =1, # 16 bits per pixel
        XI_RGB24                     =2, # RGB data format
        XI_RGB32                     =3, # RGBA data format
        XI_RGB_PLANAR                =4, # RGB planar data format
        XI_RAW8                      =5, # 8 bits per pixel raw data from sensor
        XI_RAW16                     =6, # 16 bits per pixel raw data from sensor
        XI_FRM_TRANSPORT_DATA        =7, # Data from transport layer (e.g. packed). Format see XI_PRM_TRANSPORT_PIXEL_FORMAT


    # structure containing information about bayer color matrix
    cdef enum XI_COLOR_FILTER_ARRAY:
        XI_CFA_NONE                  =0, #  B/W sensors
        XI_CFA_BAYER_RGGB            =1, # Regular RGGB
        XI_CFA_CMYG                  =2, # AK Sony sens
        XI_CFA_RGR                   =3, # 2R+G readout
        XI_CFA_BAYER_BGGR            =4, # BGGR readout
        XI_CFA_BAYER_GRBG            =5, # GRBG readout
        XI_CFA_BAYER_GBRG            =6, # GBRG readout


    # structure containing information about buffer policy(can be safe, data will be copied to user/app buffer or unsafe, user will get internally allocated buffer without data copy).
    cdef enum XI_BP:
        XI_BP_UNSAFE                 =0, # User gets pointer to internally allocated circle buffer and data may be overwritten by device.
        XI_BP_SAFE                   =1, # Data from device will be copied to user allocated buffer or xiApi allocated memory.


    # structure containing information about trigger source
    cdef enum XI_TRG_SOURCE:
        XI_TRG_OFF                   =0, # Camera works in free run mode.
        XI_TRG_EDGE_RISING           =1, # External trigger (rising edge).
        XI_TRG_EDGE_FALLING          =2, # External trigger (falling edge).
        XI_TRG_SOFTWARE              =3, # Software(manual) trigger.

    # structure containing information about trigger functionality
    cdef enum XI_TRG_SELECTOR:
        XI_TRG_SEL_FRAME_START       =0, # Selects a trigger starting the capture of one frame
        XI_TRG_SEL_EXPOSURE_ACTIVE   =1, # Selects a trigger controlling the duration of one frame.
        XI_TRG_SEL_FRAME_BURST_START =2, # Selects a trigger starting the capture of the bursts of frames in an acquisition.
        XI_TRG_SEL_FRAME_BURST_ACTIVE=3, # Selects a trigger controlling the duration of the capture of the bursts of frames in an acquisition.
        XI_TRG_SEL_MULTIPLE_EXPOSURES=4, # Selects a trigger which when first trigger starts exposure and consequent pulses are gating exposure(active HI)


    # structure containing information about acqisition timing modes
    cdef enum XI_ACQ_TIM_MODE:
        XI_ACQ_TIM_MODE_FREE_RUN  =0, # Selects a mode when sensor timing is given by fastest framerate possible (by exposure time and readout).
        XI_ACQ_TIM_MODE_FRAME_RATE=1, # Selects a mode when sensor frame acquisition start is given by frame rate.


    # structure containing information about GPI functionality
    cdef enum XI_GPI_MODE:
        XI_GPI_OFF                   =0, # Input off. In this mode the input level can be get using parameter XI_PRM_GPI_LEVEL.
        XI_GPI_TRIGGER               =1, # Trigger input
        XI_GPI_EXT_EVENT             =2, # External signal input. It is not implemented yet.

    # structure containing information about GPO functionality
    cdef enum XI_GPO_MODE:
        XI_GPO_OFF                   =0, # Output off
        XI_GPO_ON                    =1, # Logical level.
        XI_GPO_FRAME_ACTIVE          =2, # On from exposure started until read out finished.
        XI_GPO_FRAME_ACTIVE_NEG      =3, # Off from exposure started until read out finished.
        XI_GPO_EXPOSURE_ACTIVE       =4, # On during exposure(integration) time
        XI_GPO_EXPOSURE_ACTIVE_NEG   =5, # Off during exposure(integration) time
        XI_GPO_FRAME_TRIGGER_WAIT    =6, # On when sensor is ready for next trigger edge.
        XI_GPO_FRAME_TRIGGER_WAIT_NEG=7, # Off when sensor is ready for next trigger edge.
        XI_GPO_EXPOSURE_PULSE        =8, # Short On/Off pulse on start of each exposure.
        XI_GPO_EXPOSURE_PULSE_NEG    =9, # Short Off/On pulse on start of each exposure.
        XI_GPO_BUSY                  =10, # ON when camera is busy (trigger mode - starts with trigger reception and ends with end of frame transfer from sensor freerun - active when acq active)
        XI_GPO_BUSY_NEG              =11, # OFF when camera is busy (trigger mode  - starts with trigger reception and ends with end of frame transfer from sensor freerun - active when acq active)

    # structure containing information about LED functionality
    cdef enum XI_LED_MODE:
        XI_LED_HEARTBEAT             =0, # set led to blink if link is ok, (led 1), heartbeat (led 2)
        XI_LED_TRIGGER_ACTIVE        =1, # set led to blink if trigger detected
        XI_LED_EXT_EVENT_ACTIVE      =2, # set led to blink if external signal detected
        XI_LED_LINK                  =3, # set led to blink if link is ok
        XI_LED_ACQUISITION           =4, # set led to blink if data streaming
        XI_LED_EXPOSURE_ACTIVE       =5, # set led to blink if sensor integration time
        XI_LED_FRAME_ACTIVE          =6, # set led to blink if device busy/not busy
        XI_LED_OFF                   =7, # set led to zero
        XI_LED_ON                    =8, # set led to one
        XI_LED_BLINK                 =9, # set led to ~1Hz blink

    # structure containing information about parameters type
    cdef enum XI_PRM_TYPE:
        xiTypeInteger                =0, # integer parameter type
        xiTypeFloat                  =1, # float parameter type
        xiTypeString                 =2, # string parameter type

    # Turn parameter On/Off
    cdef enum XI_SWITCH:
        XI_OFF                       =0, # Turn parameter off
        XI_ON                        =1, # Turn parameter on


    # Downsampling types
    cdef enum XI_DOWNSAMPL_TYPE:
        XI_BINNING                   =0, # Downsampling is using  binning
        XI_SKIPPING                  =1, # Downsampling is using  skipping


    # Shutter mode types
    cdef enum XI_SHUTTER_TYPE:
        XI_SHUTTER_GLOBAL            =0, # Sensor Global Shutter(CMOS sensor)
        XI_SHUTTER_ROLLING           =1, # Sensor Electronic Rolling Shutter(CMOS sensor)
        XI_SHUTTER_GLOBAL_RESET_RELEASE=2, # Sensor Global Reset Release Shutter(CMOS sensor)


    # structure containing information about CMS functionality
    cdef enum XI_CMS_MODE:
        XI_CMS_DIS                   =0, # CMS disable
        XI_CMS_EN                    =1, # CMS enable
        XI_CMS_EN_FAST               =2, # CMS enable(fast)


    # structure containing information about options for selection of camera before onening
    cdef enum XI_OPEN_BY:
        XI_OPEN_BY_INST_PATH         =0, # Open camera by its hardware path
        XI_OPEN_BY_SN                =1, # Open camera by its serial number
        XI_OPEN_BY_USER_ID           =2, # open camera by its custom user ID

    #-------------------------------------------------------------------------------------------------------------------
    # xiAPI structures
    # structure containing information about incoming image.
    ctypedef struct XI_IMG: #*LPXI_IMG
        DWORD         size      # Size of current structure on application side. When xiGetImage is called and size>=SIZE_XI_IMG_V2 then GPI_level, tsSec and tsUSec are filled.
        LPVOID        bp        # pointer to data. If NULL, xiApi allocates new buffer.
        DWORD         bp_size   # Filled buffer size. When buffer policy is set to XI_BP_SAFE, xiGetImage will fill this field with current size of image data received.
        XI_IMG_FORMAT frm       # format of incoming data.
        DWORD         width     # width of incoming image.
        DWORD         height    # height of incoming image.
        DWORD         nframe    # frame number(reset by exposure, gain, downsampling change).
        DWORD         tsSec     # TimeStamp in seconds
        DWORD         tsUSec    # TimeStamp in microseconds
        DWORD         GPI_level # Input level
        DWORD         black_level# Black level of image (ONLY for MONO and RAW formats)
        DWORD         padding_x # Number of extra bytes provided at the end of each line to facilitate image alignment in buffers.

    ctypedef XI_IMG* LPXI_IMG


    #    Return number of discovered devices
    #    Returns the pointer to the number of all discovered devices.
    #    @param[out] pNumberDevices           number of discovered devices
    #    @return XI_OK on success, error value otherwise.
    XI_RETURN __cdecl xiGetNumberDevices(PDWORD pNumberDevices)
    # '''
    #    Get device parameter

    #    Allows the user to get the current device state and information.
    #   Parameters can be used:XI_PRM_DEVICE_SN, XI_PRM_DEVICE_TANCE_PATH, XI_PRM_DEVICE_TYPE, XI_PRM_DEVICE_NAME

    #    @param[in] DevId                     index of the device
    #    @param[in] prm                       parameter name string.
    #    @param[in] val                       pointer to parameter set value.
    #    @param[in] size                      pointer to integer.
    #    @param[in] type                      pointer to type container.
    #    @return XI_OK on success, error value otherwise.
    # '''
    XI_RETURN __cdecl xiGetDeviceInfo(DWORD DevId, const char* prm, void* val, DWORD * size, XI_PRM_TYPE * type)
    # '''
    #    Initialize device

    #    This function prepares the camera's software for work.
    #    It populates structures, runs initializing procedures, allocates resources - prepares the camera for work.

    #     Note Function creates and returns handle of the specified device. To de-initialize the camera and destroy the handler xiCloseDevice should be called.

    #    @param[in] DevId                     index of the device
    #    @param[out] hDevice                  handle to device
    #    @return XI_OK on success, error value otherwise.
    # '''
    XI_RETURN __cdecl xiOpenDevice(DWORD DevId, PHANDLE hDevice)
    # '''
    #     Initialize selected device

    #     This function prepares the camera's software for work. Camera is selected by using appropriate enumerator and input parameters.
    #     It populates structures, runs initializing procedures, allocates resources - prepares the camera for work.

    #     \note Function creates and returns handle of the specified device. To de-initialize the camera and destroy the handler xiCloseDevice should be called.

    #     @param[in]  sel                     select method to be used for camera selection
    #     @param[in]  prm                     input string to be used during camera selection
    #     @param[out] hDevice                 handle to device   @return XI_OK on success, error value otherwise.
    #    '''
    XI_RETURN __cdecl xiOpenDeviceBy(XI_OPEN_BY sel, const char* prm, PHANDLE hDevice)
    # '''
    #    Uninitialize device

    #    Closes camera handle and releases allocated resources.

    #    @param[in] hDevice                   handle to device
    #    @return XI_OK on success, error value otherwise.
    # '''
    XI_RETURN __cdecl xiCloseDevice(HANDLE hDevice)
    # '''
    #    Start image acquisition

    #    Begins the work cycle and starts data acquisition from the camera.

    #    @param[in] hDevice                   handle to device
    #    @return XI_OK on success, error value otherwise.
    # '''
    XI_RETURN __cdecl xiStartAcquisition(HANDLE hDevice)
    # '''
    #    Stop image acquisition

    #    Ends the work cycle of the camera, stops data acquisition and deallocates internal image buffers.

    #    @param[in] hDevice                   handle to device
    #    @return XI_OK on success, error value otherwise.
    # '''
    XI_RETURN __cdecl xiStopAcquisition(HANDLE hDevice)
    # '''
    #    Return pointer to image structure

    #    Allows the user to retrieve the frame into LPXI_IMG structure.

    #    @param[in] hDevice                   handle to device
    #    @param[in] timeout                   time interval required to wait for the image (in milliseconds).
    #    @param[out] img                      pointer to image info structure
    #    @return XI_OK on success, error value otherwise.
    # '''
    XI_RETURN __cdecl xiGetImage(HANDLE hDevice, DWORD timeout, LPXI_IMG img)
    # '''
    #    Set device parameter

    #    Allows the user to control device.

    #    @param[in] hDevice                   handle to device
    #    @param[in] prm                       parameter name string.
    #    @param[in] val                       pointer to parameter set value.
    #    @param[in] size                      size of val.
    #    @param[in] type                      val data type.
    #    @return XI_OK on success, error value otherwise.
    # '''
    XI_RETURN __cdecl xiSetParam(HANDLE hDevice, const char* prm, void* val, DWORD size, XI_PRM_TYPE type)
    # '''
    #    Get device parameter

    #    Allows the user to get the current device state and information.

    #    @param[in] hDevice                   handle to device
    #    @param[in] prm                       parameter name string.
    #    @param[in] val                       pointer to parameter set value.
    #    @param[in] size                      pointer to integer.
    #    @param[in] type                      pointer to type container.
    #    @return XI_OK on success, error value otherwise.
    # '''
    XI_RETURN __cdecl xiGetParam(HANDLE hDevice, const char* prm, void* val, DWORD * size, XI_PRM_TYPE * type)

    #Set device parameter
    XI_RETURN __cdecl xiSetParamInt(HANDLE hDevice, const char* prm, const int val)
    XI_RETURN __cdecl xiSetParamFloat(HANDLE hDevice, const char* prm, const float val)
    XI_RETURN __cdecl xiSetParamString(HANDLE hDevice, const char* prm, void* val, DWORD size)
    #Get device parameter
    XI_RETURN __cdecl xiGetParamInt(HANDLE hDevice, const char* prm, int* val)
    XI_RETURN __cdecl xiGetParamFloat(HANDLE hDevice, const char* prm, float* val)
    XI_RETURN __cdecl xiGetParamString(HANDLE hDevice, const char* prm, void* val, DWORD size)

    #Get device info
    XI_RETURN __cdecl xiGetDeviceInfoInt(DWORD DevId, const char* prm, int* value)
    XI_RETURN __cdecl xiGetDeviceInfoString(DWORD DevId, const char* prm, char* value, DWORD value_size)


