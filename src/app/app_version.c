/**
  ******************************************************************************
  * @file           : app_version.c
  * @brief          : Handle the software version in source code
  * @author         : <author name>
  * @date           : <yyyy/MM/dd>
  ******************************************************************************
  */

/* General interfaces --------------------------------------------------------*/

/* Used interfaces (dependencies includes) -----------------------------------*/

/* Associated interfaces -----------------------------------------------------*/
#include "app/app_version.h"

/* Private typedef -----------------------------------------------------------*/

/* Private define ------------------------------------------------------------*/

/* Private macro -------------------------------------------------------------*/

/* Private variables ---------------------------------------------------------*/

// Write the software version in a specific section of the flash memory
const sSoftwareMetadata_t gs_softwareMetadata = {
  csLIB_VERSION_PROJECT_NAME,
  csLIB_VERSION_COMPILE_DATE,
  csLIB_VERSION_COMPILE_TIME,
  cu8LIB_VERSION_MAJOR,
  cu8LIB_VERSION_MINOR,
  cu8LIB_VERSION_PATCH,
  csLIB_VERSION_GIT_HASH
};

/* Private function prototypes -----------------------------------------------*/

/* Public functions ----------------------------------------------------------*/

/* Private functions ---------------------------------------------------------*/

/* ISR and Event handlers ----------------------------------------------------*/
