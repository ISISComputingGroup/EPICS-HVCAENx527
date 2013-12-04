
#define CAENHVLIB /* so we get dllexport rather than dllimport on widnows in CAENHVWrapper.h */
#include "CAENHVWrapper.h"

#include "epicsExport.h"

#ifdef CAENHVLIB_API
#undef CAENHVLIB_API
#endif
#define CAENHVLIB_API epicsShareFunc /* so we work as a static build too - CAENHVWrapper.h only does dllexport */

CAENHVLIB_API char *CAENHVGetError(const char *SystemName)
{
    return NULL;
}

CAENHVLIB_API CAENHVRESULT  CAENHVInitSystem(const char *SystemName, int LinkType, void *Arg, const char *UserName, const char *Passwd)
{
     return CAENHV_OK;
}

CAENHVLIB_API CAENHVRESULT  CAENHVDeinitSystem(const char *SystemName)
{
    return CAENHV_OK;
}

CAENHVLIB_API CAENHVRESULT  CAENHVGetChParam(const char *SystemName, ushort slot, 
 const char *ParName, ushort ChNum, const ushort *ChList, void *ParValList)
{
     return CAENHV_OK;
}

CAENHVLIB_API CAENHVRESULT CAENHV_GetChParamInfo(int handle, ushort slot, ushort Ch, char **ParNameList, int *ParNumber)
{
    return CAENHV_OK;
}

CAENHVLIB_API CAENHVRESULT  CAENHVGetChParamInfo(const char *SystemName, 
 ushort slot, ushort Ch, char **ParNameList)
{
    return CAENHV_OK;
}
 

CAENHVLIB_API CAENHVRESULT  CAENHVGetChName(const char *SystemName, ushort slot, 
 ushort ChNum, const ushort *ChList, char (*ChNameList)[MAX_CH_NAME])
{
    return CAENHV_OK;
}

CAENHVLIB_API CAENHVRESULT  CAENHVGetSysProp(const char *SystemName, 
 const char *PropName, void *Result)
{
    return CAENHV_OK;
}

CAENHVLIB_API CAENHVRESULT  CAENHVSetChName(const char *SystemName, ushort slot, 
 ushort ChNum, const ushort *ChList, const char *ChName)
{
    return CAENHV_OK;
}
 
CAENHVLIB_API CAENHVRESULT  CAENHVGetCrateMap(const char *SystemName,	
 ushort *NrOfSlot, ushort **NrofChList, char **ModelList, char **DescriptionList,
 ushort **SerNumList, uchar **FmwRelMinList, uchar **FmwRelMaxList)
{
    return CAENHV_OK;
}

CAENHVLIB_API CAENHVRESULT  CAENHVGetChParamProp(const char *SystemName, 
 ushort slot, ushort Ch, const char *ParName, const char *PropName, void *retval)
{
    return CAENHV_OK;
}

CAENHVLIB_API CAENHVRESULT  CAENHVSetChParam(const char *SystemName, ushort slot, 
 const char *ParName, ushort ChNum, const ushort *ChList, void *ParValue)
{
    return CAENHV_OK;
}

