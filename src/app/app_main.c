/**
 ******************************************************************************
 * @file           : app_main.c
 * @brief          : Main application source file
 * @author         : <author name>
 * @date           : <yyyy/MM/dd>
 ******************************************************************************
 */

/* General interfaces --------------------------------------------------------*/
#include <stdbool.h>
#include <stdint.h>

/* Used interfaces (dependencies includes) -----------------------------------*/
#include "stm32l5xx-hal-driver/stm32l5xx_ll_utils.h"

/* Associated interfaces -----------------------------------------------------*/
#include "app/app_main.h"

/* Private typedef -----------------------------------------------------------*/

/* Private define ------------------------------------------------------------*/

/* Private macro -------------------------------------------------------------*/

/* Private variables ---------------------------------------------------------*/

/* Private function prototypes -----------------------------------------------*/

/* Public functions ----------------------------------------------------------*/
int main(void)
{
    while (true)
    {
        LL_mDelay(1000);
    }
}

/* Private functions ---------------------------------------------------------*/

/* ISR and Event handlers ----------------------------------------------------*/
