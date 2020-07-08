#define ERR(TAG, MSG) [1, TAG, MSG] call dnct_c_sdlog;
#define ERR1(TAG, MSG, ARG1) [1, TAG, format[MSG, ARG1]] call dnct_c_sdlog;
#define ERR2(TAG, MSG, ARG1, ARG2) [1, TAG, format[MSG, ARG1, ARG2]] call dnct_c_sdlog;

#define WAR(TAG, MSG) [2, TAG, MSG] call dnct_c_sdlog;
#define WAR1(TAG, MSG, ARG1) [2, TAG, format[MSG, ARG1]] call dnct_c_sdlog;
#define WAR2(TAG, MSG, ARG1, ARG2) [3, TAG, format[MSG, ARG1, ARG2]] call dnct_c_sdlog;

#define INF(TAG, MSG) [3, TAG, MSG] call dnct_c_sdlog;
#define INF1(TAG, MSG, ARG1) [3, TAG, format[MSG, ARG1]] call dnct_c_sdlog;
#define INF2(TAG, MSG, ARG1, ARG2) [3, TAG, format[MSG, ARG1, ARG2]] call dnct_c_sdlog;

#define DBG(TAG, MSG) [4, TAG, MSG] call dnct_c_sdlog;
#define DBG1(TAG, MSG, ARG1) [4, TAG, format[MSG, ARG1]] call dnct_c_sdlog;
#define DBG2(TAG, MSG, ARG1, ARG2) [4, TAG, format[MSG, ARG1, ARG2]] call dnct_c_sdlog;

#define VRB(TAG, MSG) [5, TAG, MSG] call dnct_c_sdlog;
#define VRB1(TAG, MSG, ARG1) [5, TAG, format[MSG, ARG1]] call dnct_c_sdlog;
#define VRB2(TAG, MSG, ARG1, ARG2) [5, TAG, format[MSG, ARG1, ARG2]] call dnct_c_sdlog;