

###ENUM CONSTANTS
XI_BINNING  = 0
XI_SKIPPING = 1


# xiApi parameters
XI_PRM_DEVICE_NAME                     = "device_name"             # Return device name
XI_PRM_DEVICE_TYPE                     = "device_type"             # Return device type
XI_PRM_DEVICE_MODEL_ID                 = "device_model_id"         # Return device model id
XI_PRM_DEVICE_SN                       = "device_sn"               # Return device serial number
XI_PRM_DEVICE_SENS_SN                  = "device_sens_sn"          # Return sensor serial number
XI_PRM_DEVICE_INSTANCE_PATH            = "device_inst_path"        # Return device system instance path.
XI_PRM_DEVICE_USER_ID                  = "device_user_id"          # Return custom ID of camera.
#
XI_PRM_EXPOSURE                        = "exposure"                # Exposure time in microseconds
XI_PRM_GAIN                            = "gain"                    # Gain in dB
XI_PRM_DOWNSAMPLING                    = "downsampling"            # Change image resolution by binning or skipping.
XI_PRM_DOWNSAMPLING_TYPE               = "downsampling_type"       # Change image downsampling type. XI_DOWNSAMPL_TYPE
XI_PRM_SHUTTER_TYPE                    = "shutter_type"            # Change sensor shutter type(CMOS sensor). XI_SHUTTER_TYPE
XI_PRM_IMAGE_DATA_FORMAT               = "imgdataformat"           # Output data format. XI_IMG_FORMAT
XI_PRM_TRANSPORT_PIXEL_FORMAT          = "transport_pixel_format"  # Current format of pixels on transport layer. XI_GenTL_Image_Format_e
XI_PRM_SENSOR_TAPS                     = "sensor_taps"             # Number of taps
XI_PRM_SENSOR_PIXEL_CLOCK_FREQ_HZ      = "sensor_pixel_clock_freq_hz"# Sensor pixel clock frequency in Hz.
XI_PRM_SENSOR_PIXEL_CLOCK_FREQ_INDEX   = "sensor_pixel_clock_freq_index"# Sensor pixel clock frequency. Selects frequency index for getter of XI_PRM_SENSOR_PIXEL_CLOCK_FREQ_HZ parameter.
XI_PRM_SENSOR_DATA_BIT_DEPTH           = "sensor_bit_depth"        # Sensor output data bit depth.
XI_PRM_OUTPUT_DATA_BIT_DEPTH           = "output_bit_depth"        # Device output data bit depth.
XI_PRM_OUTPUT_DATA_PACKING             = "output_bit_packing"      # Device output data packing (or grouping) enabled. Packing could be enabled if output_data_bit_depth > 8 and packing is available. XI_SWITCH
XI_PRM_FRAMERATE                       = "framerate"               # Define framerate in Hz
XI_PRM_ACQ_TIMING_MODE                 = "acq_timing_mode"         # Type of sensor frames timing. XI_ACQ_TIM_MODE
XI_PRM_AVAILABLE_BANDWIDTH             = "available_bandwidth"     # Calculate and return available interface bandwidth(int Megabits)
XI_PRM_LIMIT_BANDWIDTH                 = "limit_bandwidth"         # Set/get bandwidth(datarate)(in Megabits)
XI_PRM_BUFFER_POLICY                   = "buffer_policy"           # Data move policy XI_BP
XI_PRM_WIDTH                           = "width"                   # Width of the Image provided by the device (in pixels).
XI_PRM_HEIGHT                          = "height"                  # Height of the Image provided by the device (in pixels).
XI_PRM_OFFSET_X                        = "offsetX"                 # Horizontal offset from the origin to the area of interest (in pixels).
XI_PRM_OFFSET_Y                        = "offsetY"                 # Vertical offset from the origin to the area of interest (in pixels).
XI_PRM_LUT_EN                          = "LUTEnable"               # Activates LUT. XI_SWITCH
XI_PRM_LUT_EX                          = "LUTIndex"                # Control the index (offset) of the coefficient to access in the LUT.
XI_PRM_LUT_VALUE                       = "LUTValue"                # Value at entry LUTIndex of the LUT
XI_PRM_TRG_SOURCE                      = "trigger_source"          # Defines source of trigger. XI_TRG_SOURCE
XI_PRM_TRG_SELECTOR                    = "trigger_selector"        # Selects the type of trigger. XI_TRG_SELECTOR
XI_PRM_TRG_SOFTWARE                    = "trigger_software"        # Generates an internal trigger. XI_PRM_TRG_SOURCE must be set to TRG_SOFTWARE.
XI_PRM_TRG_DELAY                       = "trigger_delay"           # Specifies the delay in microseconds (us) to apply after the trigger reception before activating it.
XI_PRM_GPI_SELECTOR                    = "gpi_selector"            # Selects GPI
XI_PRM_GPI_MODE                        = "gpi_mode"                # Defines GPI functionality XI_GPI_MODE
XI_PRM_GPI_LEVEL                       = "gpi_level"               # GPI level
XI_PRM_GPO_SELECTOR                    = "gpo_selector"            # Selects GPO
XI_PRM_GPO_MODE                        = "gpo_mode"                # Defines GPO functionality XI_GPO_MODE
XI_PRM_LED_SELECTOR                    = "led_selector"            # Selects LED
XI_PRM_LED_MODE                        = "led_mode"                # Defines LED functionality XI_LED_MODE
XI_PRM_ACQ_FRAME_BURST_COUNT           = "acq_frame_burst_count"   # Sets number of frames acquired by burst. This burst is used only if trigger is set to FrameBurstStart
#
XI_PRM_IS_DEVICE_EXIST                 = "isexist"                 # Returns 1 if camera connected and works properly. XI_SWITCH
XI_PRM_ACQ_BUFFER_SIZE                 = "acq_buffer_size"         # Acquisition buffer size in bytes
XI_PRM_ACQ_TRANSPORT_BUFFER_SIZE       = "acq_transport_buffer_size"# Acquisition transport buffer size in bytes
XI_PRM_BUFFERS_QUEUE_SIZE              = "buffers_queue_size"      # Queue of field/frame buffers
XI_PRM_RECENT_FRAME                    = "recent_frame"            # GetImage returns most recent frame XI_SWITCH
#
XI_PRM_CMS                             = "cms"                     # Mode of color management system. XI_CMS_MODE
XI_PRM_APPLY_CMS                       = "apply_cms"               # Enable applying of CMS profiles to xiGetImage (see XI_PRM_UT_CMS_PROFILE, XI_PRM_UT_CMS_PROFILE). XI_SWITCH
XI_PRM_INPUT_CMS_PROFILE               = "input_cms_profile"       # Filename for input cms profile (e.g. input.icc)
XI_PRM_OUTPUT_CMS_PROFILE              = "output_cms_profile"      # Filename for output cms profile (e.g. input.icc)
XI_PRM_IMAGE_IS_COLOR                  = "iscolor"                 # Returns 1 for color cameras. XI_SWITCH
XI_PRM_COLOR_FILTER_ARRAY              = "cfa"                     # Returns color filter array type of RAW data. XI_COLOR_FILTER_ARRAY
XI_PRM_WB_KR                           = "wb_kr"                   # White balance red coefficient
XI_PRM_WB_KG                           = "wb_kg"                   # White balance green coefficient
XI_PRM_WB_KB                           = "wb_kb"                   # White balance blue coefficient
XI_PRM_MANUAL_WB                       = "manual_wb"               # Calculates White Balance(xiGetImage function must be called)
XI_PRM_AUTO_WB                         = "auto_wb"                 # Automatic white balance XI_SWITCH
XI_PRM_GAMMAY                          = "gammaY"                  # Luminosity gamma
XI_PRM_GAMMAC                          = "gammaC"                  # Chromaticity gamma
XI_PRM_SHARPNESS                       = "sharpness"               # Sharpness Strenght
XI_PRM_CC_MATRIX_00                    = "ccMTX00"                 # Color Correction Matrix element [0][0]
XI_PRM_CC_MATRIX_01                    = "ccMTX01"                 # Color Correction Matrix element [0][1]
XI_PRM_CC_MATRIX_02                    = "ccMTX02"                 # Color Correction Matrix element [0][2]
XI_PRM_CC_MATRIX_03                    = "ccMTX03"                 # Color Correction Matrix element [0][3]
XI_PRM_CC_MATRIX_10                    = "ccMTX10"                 # Color Correction Matrix element [1][0]
XI_PRM_CC_MATRIX_11                    = "ccMTX11"                 # Color Correction Matrix element [1][1]
XI_PRM_CC_MATRIX_12                    = "ccMTX12"                 # Color Correction Matrix element [1][2]
XI_PRM_CC_MATRIX_13                    = "ccMTX13"                 # Color Correction Matrix element [1][3]
XI_PRM_CC_MATRIX_20                    = "ccMTX20"                 # Color Correction Matrix element [2][0]
XI_PRM_CC_MATRIX_21                    = "ccMTX21"                 # Color Correction Matrix element [2][1]
XI_PRM_CC_MATRIX_22                    = "ccMTX22"                 # Color Correction Matrix element [2][2]
XI_PRM_CC_MATRIX_23                    = "ccMTX23"                 # Color Correction Matrix element [2][3]
XI_PRM_CC_MATRIX_30                    = "ccMTX30"                 # Color Correction Matrix element [3][0]
XI_PRM_CC_MATRIX_31                    = "ccMTX31"                 # Color Correction Matrix element [3][1]
XI_PRM_CC_MATRIX_32                    = "ccMTX32"                 # Color Correction Matrix element [3][2]
XI_PRM_CC_MATRIX_33                    = "ccMTX33"                 # Color Correction Matrix element [3][3]
XI_PRM_DEFAULT_CC_MATRIX               = "defccMTX"                # Set default Color Correction Matrix
#
XI_PRM_AEAG                            = "aeag"                    # Automatic exposure/gain XI_SWITCH
XI_PRM_AEAG_ROI_OFFSET_X               = "aeag_roi_offset_x"       # Automatic exposure/gain ROI offset X
XI_PRM_AEAG_ROI_OFFSET_Y               = "aeag_roi_offset_y"       # Automatic exposure/gain ROI offset Y
XI_PRM_AEAG_ROI_WIDTH                  = "aeag_roi_width"          # Automatic exposure/gain ROI Width
XI_PRM_AEAG_ROI_HEIGHT                 = "aeag_roi_height"         # Automatic exposure/gain ROI Height
XI_PRM_EXP_PRIORITY                    = "exp_priority"            # Exposure priority (0.5 - exposure 50%, gain 50%).
XI_PRM_AE_MAX_LIMIT                    = "ae_max_limit"            # Maximum limit of exposure in AEAG procedure
XI_PRM_AG_MAX_LIMIT                    = "ag_max_limit"            # Maximum limit of gain in AEAG procedure
XI_PRM_AEAG_LEVEL                      = "aeag_level"              # Average intensity of output signal AEAG should achieve(in %)
#
XI_PRM_BPC                             = "bpc"                     # Correction of bad pixels XI_SWITCH
#
XI_PRM_DEBOUNCE_EN                     = "dbnc_en"                 # Enable/Disable debounce to selected GPI XI_SWITCH
XI_PRM_DEBOUNCE_T0                     = "dbnc_t0"                 # Debounce time (x * 10us)
XI_PRM_DEBOUNCE_T1                     = "dbnc_t1"                 # Debounce time (x * 10us)
XI_PRM_DEBOUNCE_POL                    = "dbnc_pol"                # Debounce polarity (pol = 1 t0 - falling edge, t1 - rising edge)
#
XI_PRM_IS_COOLED                       = "iscooled"                # Returns 1 for cameras that support cooling.
XI_PRM_COOLING                         = "cooling"                 # Start camera cooling. XI_SWITCH
XI_PRM_TARGET_TEMP                     = "target_temp"             # Set sensor target temperature for cooling.
XI_PRM_CHIP_TEMP                       = "chip_temp"               # Camera sensor temperature
XI_PRM_HOUS_TEMP                       = "hous_temp"               # Camera housing tepmerature
#
XI_PRM_SENSOR_MODE                     = "sensor_mode"             # Current sensor mode. Allows to select sensor mode by one integer. Setting of this parameter affects: image dimensions and downsampling.
XI_PRM_HDR                             = "hdr"                     # Enable High Dynamic Range feature. XI_SWITCH
XI_PRM_HDR_KNEEPOINT_COUNT             = "hdr_kneepoint_count"     # The number of kneepoints in the PWLR.
XI_PRM_HDR_T1                          = "hdr_t1"                  # position of first kneepoint(in % of XI_PRM_EXPOSURE)
XI_PRM_HDR_T2                          = "hdr_t2"                  # position of second kneepoint (in % of XI_PRM_EXPOSURE)
XI_PRM_KNEEPOINT1                      = "hdr_kneepoint1"          # value of first kneepoint (% of sensor saturation)
XI_PRM_KNEEPOINT2                      = "hdr_kneepoint2"          # value of second kneepoint (% of sensor saturation)
XI_PRM_IMAGE_BLACK_LEVEL               = "image_black_level"       # Last image black level counts. Can be used for Offline processing to recall it.
#
XI_PRM_API_VERSION                     = "api_version"             # Returns version of API.
XI_PRM_DRV_VERSION                     = "drv_version"             # Returns version of current device driver.
XI_PRM_MCU1_VERSION                    = "version_mcu1"            # Returns version of MCU1 firmware.
XI_PRM_MCU2_VERSION                    = "version_mcu2"            # Returns version of MCU2 firmware.
XI_PRM_FPGA1_VERSION                   = "version_fpga1"           # Returns version of FPGA1 firmware.
#
XI_PRM_DEBUG_LEVEL                     = "debug_level"             # Set debug level XI_DEBUG_LEVEL
XI_PRM_AUTO_BANDWIDTH_CALCULATION      = "auto_bandwidth_calculation"# Automatic bandwidth calculation, XI_SWITCH
#
XI_PRM_READ_FILE_FFS                   = "read_file_ffs"           # Read file from camera flash filesystem.
XI_PRM_WRITE_FILE_FFS                  = "write_file_ffs"          # Write file to camera flash filesystem.
XI_PRM_FFS_FILE_NAME                   = "ffs_file_name"           # Set name of file to be written/read from camera FFS.
XI_PRM_FREE_FFS_SIZE                   = "free_ffs_size"           # Size of free camera FFS.
XI_PRM_USED_FFS_SIZE                   = "used_ffs_size"           # Size of used camera FFS.
#
XI_PRM_API_CONTEXT_LIST                = "xiapi_context_list"      # List of current parameters settings context - parameters with values. Used for offline processing.





#-------------------------------------------------------------------------------------------------------------------
# Global definitions
SIZE_XI_IMG_V1              =  28                   # structure size default
SIZE_XI_IMG_V2              =  40                   # structure size with timestamp and GPI level information
SIZE_XI_IMG_V3              =  44                   # structure size with black level information
SIZE_XI_IMG_V4              =  48                   # structure size with horizontal buffer padding information
XI_PRM_INFO_MIN             = ":min"               # Parameter minimum
XI_PRM_INFO_MAX             = ":max"               # Parameter maximum
XI_PRM_INFO_INCREMENT       = ":inc"               # Parameter increment
XI_PRM_INFO                 = ":info"              # Parameter value
XI_PRMM_DIRECT_UPDATE       = ":direct_update"     # Parameter modifier for direct update without stopping the streaming. E.g. XI_PRM_EXPOSURE XI_PRMM_DIRECT_UPDATE can be used with this modifier
XI_MQ_LED_STATUS1           =  1                    # MQ Status 1 LED selection value.
XI_MQ_LED_STATUS2           =  2                    # MQ Status 2 LED selection value.
XI_MQ_LED_POWER             =  3                    # MQ Power LED selection value.
XI_MS_LED_STATUS1           =  1                    # CURRERA-R LED 1 selection value.
XI_MS_LED_STATUS2           =  2                    # CURRERA-R LED 2 selection value.



###ENUM strings:
logger_levels = {
'Detail'  :0,
'Trace'   :1,
'Warning' :2,
'Error'   :3,
'Fatal'   :4,
'Disabled':100
}


###ERROR CODES:
error_codes = {
0 :  ("XI_OK","Function call succeeded"),
1 :  ("XI_INVALID_HANDLE","Invalid handle"),
2 :  ("XI_READREG","Register read error"),
3 :  ("XI_WRITEREG","Register write error"),
4 :  ("XI_FREE_RESOURCES","Freeing resiurces error"),
5 :  ("XI_FREE_CHANNEL","Freeing channel error"),
6 :  ("XI_FREE_BANDWIDTH","Freeing bandwith error"),
7 :  ("XI_READBLK","Read block error"),
8 :  ("XI_WRITEBLK","Write block error"),
9 :  ("XI_NO_IMAGE","No image"),
10 : ("XI_TIMEOUT","Timeout"),
11 : ("XI_INVALID_ARG","Invalid arguments supplied"),
12 : ("XI_NOT_SUPPORTED","Not supported"),
13 : ("XI_ISOCH_ATTACH_BUFFERS","Attach buffers error"),
14 : ("XI_GET_OVERLAPPED_RESULT","Overlapped result"),
15 : ("XI_MEMORY_ALLOCATION","Memory allocation error"),
16 : ("XI_DLLCONTEXTISNULL","DLL context is NULL"),
17 : ("XI_DLLCONTEXTISNONZERO","DLL context is non zero"),
18 : ("XI_DLLCONTEXTEXIST","DLL context exists"),
19 : ("XI_TOOMANYDEVICES","Too many devices connected"),
20 : ("XI_ERRORCAMCONTEXT","Camera context error"),
21 : ("XI_UNKNOWN_HARDWARE","Unknown hardware"),
22 : ("XI_INVALID_TM_FILE","Invalid TM file"),
23 : ("XI_INVALID_TM_TAG","Invalid TM tag"),
24 : ("XI_INCOMPLETE_TM","Incomplete TM"),
25 : ("XI_BUS_RESET_FAILED","Bus reset error"),
26 : ("XI_NOT_IMPLEMENTED","Not implemented"),
27 : ("XI_SHADING_TOOBRIGHT","Shading too bright"),
28 : ("XI_SHADING_TOODARK","Shading too dark"),
29 : ("XI_TOO_LOW_GAIN","Gain is too low"),
30 : ("XI_INVALID_BPL","Invalid bad pixel list"),
31 : ("XI_BPL_REALLOC","Bad pixel list realloc error"),
32 : ("XI_INVALID_PIXEL_LIST","Invalid pixel list"),
33 : ("XI_INVALID_FFS","Invalid Flash File System"),
34 : ("XI_INVALID_PROFILE","Invalid profile"),
35 : ("XI_INVALID_CALIBRATION","Invalid calibration"),
36 : ("XI_INVALID_BUFFER","Invalid buffer"),
38 : ("XI_INVALID_DATA","Invalid data"),
39 : ("XI_TGBUSY","Timing generator is busy"),
40 : ("XI_IO_WRONG","Wrong operation open/write/read/close"),
41 : ("XI_ACQUISITION_ALREADY_UP","Acquisition already started"),
42 : ("XI_OLD_DRIVER_VERSION","Old version of device driver installed to the system."),
43 : ("XI_GET_LAST_ERROR","To get error code please call GetLastError function."),
44 : ("XI_CANT_PROCESS","Data can't be processed"),
45 : ("XI_ACQUISITION_STOPED","Acquisition has been stopped. It should be started before GetImage."),
46 : ("XI_ACQUISITION_STOPED_WERR","Acquisition has been stoped with error."),
47 : ("XI_INVALID_INPUT_ICC_PROFILE","Input ICC profile missed or corrupted"),
48 : ("XI_INVALID_OUTPUT_ICC_PROFILE","Output ICC profile missed or corrupted"),
49 : ("XI_DEVICE_NOT_READY","Device not ready to operate"),
50 : ("XI_SHADING_TOOCONTRAST","Shading too contrast"),
51 : ("XI_ALREADY_INITIALIZED","Modile already initialized"),
52 : ("XI_NOT_ENOUGH_PRIVILEGES","Application doesn't enough privileges(one or more app"),
53 : ("XI_NOT_COMPATIBLE_DRIVER","Installed driver not compatible with current software"),
54 : ("XI_TM_INVALID_RESOURCE","TM file was not loaded successfully from resources"),
55 : ("XI_DEVICE_HAS_BEEN_RESETED","Device has been reseted, abnormal initial state"),
56 : ("XI_NO_DEVICES_FOUND","No Devices Found"),
57 : ("XI_RESOURCE_OR_FUNCTION_LOCKED","Resource(device) or function locked by mutex"),
58 : ("XI_BUFFER_SIZE_TOO_SMALL","Buffer provided by user is too small"),
100 :("XI_UNKNOWN_PARAM","Unknown parameter"),
101 :("XI_WRONG_PARAM_VALUE","Wrong parameter value"),
103 :("XI_WRONG_PARAM_TYPE","Wrong parameter type"),
104 :("XI_WRONG_PARAM_SIZE","Wrong parameter size"),
105 :("XI_BUFFER_TOO_SMALL","Input buffer too small"),
106 :("XI_NOT_SUPPORTED_PARAM","Parameter info not supported"),
107 :("XI_NOT_SUPPORTED_PARAM_INFO","Parameter info not supported"),
108 :("XI_NOT_SUPPORTED_DATA_FORMAT","Data format not supported"),
109 :("XI_READ_ONLY_PARAM","Read only parameter"),
111 :("XI_BANDWIDTH_NOT_SUPPORTED","This camera does not support currently available bandwidth"),
112 :("XI_INVALID_FFS_FILE_NAME","FFS file selector is invalid or NULL"),
113 :("XI_FFS_FILE_NOT_FOUND","FFS file not found"),
201 :("XI_PROC_OTHER_ERROR","Processing error - other"),
202 :("XI_PROC_PROCESSING_ERROR","Error while image processing."),
203 :("XI_PROC_INPUT_FORMAT_UNSUPPORTED","Input format is not supported for processing."),
204 :("XI_PROC_OUTPUT_FORMAT_UNSUPPORTED","Output format is not supported for processing.")
}
