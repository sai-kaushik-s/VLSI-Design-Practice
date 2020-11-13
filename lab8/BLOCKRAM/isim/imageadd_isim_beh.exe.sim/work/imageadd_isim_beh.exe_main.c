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
    xilinxcorelib_ver_m_04284627112054182733_2740722860_init();
    xilinxcorelib_ver_m_18166792875774041790_1724394411_init();
    xilinxcorelib_ver_m_17738287534884592592_3686745654_init();
    xilinxcorelib_ver_m_10066368518302646626_0659160041_init();
    work_m_14056882636803624207_2964467647_init();
    work_m_00642920358374338903_0272193382_init();
    work_m_16541823861846354283_2073120511_init();


    xsi_register_tops("work_m_00642920358374338903_0272193382");
    xsi_register_tops("work_m_16541823861846354283_2073120511");


    return xsi_run_simulation(argc, argv);

}
