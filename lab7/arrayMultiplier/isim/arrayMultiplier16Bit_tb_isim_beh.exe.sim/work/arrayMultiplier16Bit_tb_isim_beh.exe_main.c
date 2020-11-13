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
    work_m_04342965551166652209_4251583159_init();
    work_m_03352482263266125113_4027182604_init();
    work_m_07250135870146594767_3580015056_init();
    work_m_01142202183976973655_2679377512_init();
    work_m_07373078885347283047_3622035061_init();
    work_m_07400595285874057866_2372410633_init();
    work_m_16541823861846354283_2073120511_init();


    xsi_register_tops("work_m_07400595285874057866_2372410633");
    xsi_register_tops("work_m_16541823861846354283_2073120511");


    return xsi_run_simulation(argc, argv);

}
