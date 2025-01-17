/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                       */
/*  \   \        Copyright (c) 2003-2009 Xilinx, Inc.                */
/*  /   /          All Right Reserved.                                 */
/* /---/   /\                                                         */
/* \   \  /  \                                                      */
/*  \___\/\___\                                                    */
/***********************************************************************/

#include "xsi.h"

struct XSI_INFO xsi_info;



int main(int argc, char **argv)
{
    xsi_init_design(argc, argv);
    xsi_register_info(&xsi_info);

    xsi_register_min_prec_unit(-12);
    work_m_00686953576372046596_1938225339_init();
    work_m_16463840249946276159_0143808791_init();
    work_m_09348608911828725516_0037996398_init();
    work_m_02812855856860270651_0886308060_init();
    work_m_06695251826669240850_2531829270_init();
    work_m_16463840249946276159_3870328309_init();
    work_m_18125270874429363823_1733832700_init();
    work_m_13739115553568138991_2908011151_init();
    work_m_07528573068520486864_0317860448_init();
    work_m_10930701079503040782_1292031434_init();
    work_m_05680669131915488825_2331534020_init();
    work_m_07830131660392113312_0595424919_init();
    work_m_16541823861846354283_2073120511_init();


    xsi_register_tops("work_m_07830131660392113312_0595424919");
    xsi_register_tops("work_m_16541823861846354283_2073120511");


    return xsi_run_simulation(argc, argv);

}
