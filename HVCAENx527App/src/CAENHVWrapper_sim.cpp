#include <string>
#include <map>

#define CAENHVLIB /* so we get dllexport rather than dllimport on windows in CAENHVWrapper.h */
#include "CAENHVWrapper.h"

#include "epicsExport.h"

#ifdef CAENHVLIB_API
#undef CAENHVLIB_API
#endif
#define CAENHVLIB_API epicsShareFunc /* so we work as a static build too - CAENHVWrapper.h only does dllexport */

#define NUM_SLOTS 2
#define NUM_CH 2

// note: must use malloc() not new[] to allocate memory as client will use free()

struct chan_t
{
    std::string name;
};

typedef std::map<int,chan_t> slot_t;
typedef std::map<int,slot_t> crate_t;
static std::map<std::string, crate_t> crate_info;

CAENHVLIB_API char *CAENHVGetError(const char *SystemName)
{
    return "CAENHVWrapper_sim error";
}

CAENHVLIB_API CAENHVRESULT  CAENHVInitSystem(const char *SystemName, int LinkType, void *Arg, const char *UserName, const char *Passwd)
{
     return CAENHV_OK;
}

CAENHVLIB_API CAENHVRESULT  CAENHVDeinitSystem(const char *SystemName)
{
    return CAENHV_OK;
}

CAENHVLIB_API CAENHVRESULT  CAENHVGetChName(const char *SystemName, ushort slot, 
 ushort ChNum, const ushort *ChList, char (*ChNameList)[MAX_CH_NAME])
{
    // ChNum should be 1
	*(reinterpret_cast<void**>(ChNameList)) = malloc(MAX_CH_NAME * ChNum);
	for(int i=0; i<ChNum; ++i)
	{
		std::string& name = crate_info[SystemName][slot][*ChList].name;
		if (name.size() == 0)
		{
			sprintf(ChNameList[i], "s1535");			
		}
		else
		{
			strncpy(ChNameList[i], name.c_str(), MAX_CH_NAME); 
		}
    }		
    return CAENHV_OK;
}

CAENHVLIB_API CAENHVRESULT  CAENHVSetChName(const char *SystemName, ushort slot, 
 ushort ChNum, const ushort *ChList, const char *ChName)
{
	for(int i=0; i< ChNum; ++i)
	{
		crate_info[SystemName][slot][ChList[i]].name = ChName;
	}		
    return CAENHV_OK;
}

#define MAX_PARAM 100
CAENHVLIB_API CAENHVRESULT  CAENHVGetChParamInfo(const char *SystemName, 
 ushort slot, ushort Ch, char **ParNameList)
{
    *ParNameList = static_cast<char*>(malloc(MAX_PARAM * MAX_PARAM_NAME));
	char (*par)[MAX_PARAM_NAME] = reinterpret_cast<char (*)[MAX_PARAM_NAME]>(*ParNameList);
	strcpy(par[0], "V0Set");
	strcpy(par[1], "I0Set");
	strcpy(par[2], ""); // must end list with this
    return CAENHV_OK;
}

CAENHVLIB_API CAENHVRESULT  CAENHVGetChParamProp(const char *SystemName, 
 ushort slot, ushort Ch, const char *ParName, const char *PropName, void *retval)
{
    if (!strcmp(ParName, "Mode"))
	{
	    *(static_cast<unsigned long*>(retval)) = PARAM_MODE_RDWR;
	}
    else if (!strcmp(ParName, "Type"))
	{
	    *(static_cast<unsigned long*>(retval)) = PARAM_TYPE_NUMERIC;
	    return PARAM_TYPE_NUMERIC;
	}
	else
	{
	    *(static_cast<unsigned long*>(retval)) = 0;
	}
    return CAENHV_OK;
}

CAENHVLIB_API CAENHVRESULT  CAENHVGetChParam(const char *SystemName, ushort slot, 
 const char *ParName, ushort ChNum, const ushort *ChList, void *ParValList)
{
	 *(static_cast<unsigned long*>(ParValList)) = 0;
     return CAENHV_OK;
}


CAENHVLIB_API CAENHVRESULT  CAENHVSetChParam(const char *SystemName, ushort slot, 
 const char *ParName, ushort ChNum, const ushort *ChList, void *ParValue)
{
    return CAENHV_OK;
}


CAENHVLIB_API CAENHVRESULT  CAENHVGetSysProp(const char *SystemName, 
 const char *PropName, void *Result)
{
	if ( !strcmp(PropName, "HvPwSM") )
	{
		strcpy(static_cast<char*>(Result), "HvPwSM value");
	}
	else
	{
		*(static_cast<unsigned long*>(Result)) = 0;
	}
    return CAENHV_OK;
}
 
CAENHVLIB_API CAENHVRESULT  CAENHVGetCrateMap(const char *SystemName,	
 ushort *NrOfSlot, ushort **NrofChList, char **ModelList, char **DescriptionList,
 ushort **SerNumList, uchar **FmwRelMinList, uchar **FmwRelMaxList)
{
    *NrOfSlot = NUM_SLOTS;
	*NrofChList = static_cast<ushort*>(malloc(NUM_SLOTS * sizeof(ushort)));
	*SerNumList = static_cast<ushort*>(malloc(NUM_SLOTS * sizeof(ushort)));
	*FmwRelMinList = static_cast<uchar*>(malloc(NUM_SLOTS * sizeof(uchar)));
	*FmwRelMaxList = static_cast<uchar*>(malloc(NUM_SLOTS * sizeof(uchar)));
	*DescriptionList = static_cast<char*>(malloc(NUM_SLOTS*(1+strlen("description"))));
	*ModelList = static_cast<char*>(malloc(NUM_SLOTS*(1+strlen("model"))));
	for(int i=0; i<NUM_SLOTS; ++i)
	{
		(*NrofChList)[i] = NUM_CH;
		(*SerNumList)[i] = 1;
		(*FmwRelMinList)[i] = 0;
		(*FmwRelMaxList)[i] = 0;
		strcpy(*DescriptionList + i * (1 + strlen("description")), "description");
		strcpy(*ModelList  + i * (1 + strlen("model")), "model");
	}
    return CAENHV_OK;
}
