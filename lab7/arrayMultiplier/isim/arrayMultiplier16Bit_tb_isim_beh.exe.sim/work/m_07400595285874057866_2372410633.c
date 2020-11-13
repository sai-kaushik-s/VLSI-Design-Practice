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

/* This file is designed for use with ISim build 0xfbc00daa */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "/home/thegamingbot/Downloads/sem-5/VLSI/lab7/arrayMultiplier/arrayMultiplier16Bit_tb.v";
static unsigned int ng1[] = {0U, 0U};
static unsigned int ng2[] = {65535U, 0U};
static unsigned int ng3[] = {13513U, 0U};
static unsigned int ng4[] = {17186U, 0U};
static unsigned int ng5[] = {19141U, 0U};
static unsigned int ng6[] = {9570U, 0U};
static unsigned int ng7[] = {35396U, 0U};
static unsigned int ng8[] = {8790U, 0U};
static unsigned int ng9[] = {9509U, 0U};
static unsigned int ng10[] = {49956U, 0U};
static unsigned int ng11[] = {22722U, 0U};
static unsigned int ng12[] = {9002U, 0U};



static void Initial_41_0(char *t0)
{
    char *t1;
    char *t2;

LAB0:    xsi_set_current_line(41, ng0);

LAB2:    xsi_set_current_line(43, ng0);
    t1 = ((char*)((ng1)));
    t2 = (t0 + 1448);
    xsi_vlogvar_assign_value(t2, t1, 0, 0, 16);
    xsi_set_current_line(44, ng0);
    t1 = ((char*)((ng1)));
    t2 = (t0 + 1608);
    xsi_vlogvar_assign_value(t2, t1, 0, 0, 16);
    xsi_set_current_line(47, ng0);
    t1 = ((char*)((ng2)));
    t2 = (t0 + 1448);
    xsi_vlogvar_assign_value(t2, t1, 0, 0, 16);
    xsi_set_current_line(48, ng0);
    t1 = ((char*)((ng2)));
    t2 = (t0 + 1608);
    xsi_vlogvar_assign_value(t2, t1, 0, 0, 16);
    xsi_set_current_line(50, ng0);
    t1 = ((char*)((ng3)));
    t2 = (t0 + 1448);
    xsi_vlogvar_assign_value(t2, t1, 0, 0, 16);
    xsi_set_current_line(51, ng0);
    t1 = ((char*)((ng4)));
    t2 = (t0 + 1608);
    xsi_vlogvar_assign_value(t2, t1, 0, 0, 16);
    xsi_set_current_line(53, ng0);
    t1 = ((char*)((ng5)));
    t2 = (t0 + 1448);
    xsi_vlogvar_assign_value(t2, t1, 0, 0, 16);
    xsi_set_current_line(54, ng0);
    t1 = ((char*)((ng6)));
    t2 = (t0 + 1608);
    xsi_vlogvar_assign_value(t2, t1, 0, 0, 16);
    xsi_set_current_line(56, ng0);
    t1 = ((char*)((ng7)));
    t2 = (t0 + 1448);
    xsi_vlogvar_assign_value(t2, t1, 0, 0, 16);
    xsi_set_current_line(57, ng0);
    t1 = ((char*)((ng8)));
    t2 = (t0 + 1608);
    xsi_vlogvar_assign_value(t2, t1, 0, 0, 16);
    xsi_set_current_line(59, ng0);
    t1 = ((char*)((ng9)));
    t2 = (t0 + 1448);
    xsi_vlogvar_assign_value(t2, t1, 0, 0, 16);
    xsi_set_current_line(60, ng0);
    t1 = ((char*)((ng10)));
    t2 = (t0 + 1608);
    xsi_vlogvar_assign_value(t2, t1, 0, 0, 16);
    xsi_set_current_line(62, ng0);
    t1 = ((char*)((ng11)));
    t2 = (t0 + 1448);
    xsi_vlogvar_assign_value(t2, t1, 0, 0, 16);
    xsi_set_current_line(63, ng0);
    t1 = ((char*)((ng12)));
    t2 = (t0 + 1608);
    xsi_vlogvar_assign_value(t2, t1, 0, 0, 16);

LAB1:    return;
}


extern void work_m_07400595285874057866_2372410633_init()
{
	static char *pe[] = {(void *)Initial_41_0};
	xsi_register_didat("work_m_07400595285874057866_2372410633", "isim/arrayMultiplier16Bit_tb_isim_beh.exe.sim/work/m_07400595285874057866_2372410633.didat");
	xsi_register_executes(pe);
}
