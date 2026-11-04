/*
 * IMU_heli_1_2_dt.h
 *
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 *
 * Code generation for model "IMU_heli_1_2".
 *
 * Model version              : 11.4
 * Simulink Coder version : 9.4 (R2020b) 29-Jul-2020
 * C source code generated on : Wed Oct 14 15:01:19 2026
 *
 * Target selection: quarc_win64.tlc
 * Note: GRT includes extra infrastructure and instrumentation for prototyping
 * Embedded hardware selection: Intel->x86-64 (Windows64)
 * Code generation objectives: Unspecified
 * Validation result: Not run
 */

#include "ext_types.h"

/* data type size table */
static uint_T rtDataTypeSizes[] = {
  sizeof(real_T),
  sizeof(real32_T),
  sizeof(int8_T),
  sizeof(uint8_T),
  sizeof(int16_T),
  sizeof(uint16_T),
  sizeof(int32_T),
  sizeof(uint32_T),
  sizeof(boolean_T),
  sizeof(fcn_call_T),
  sizeof(int_T),
  sizeof(pointer_T),
  sizeof(action_T),
  2*sizeof(uint32_T),
  sizeof(t_stream),
  sizeof(t_stream_ptr),
  sizeof(intmax_t),
  sizeof(ptrdiff_t),
  sizeof(size_t),
  sizeof(t_int64),
  sizeof(t_uint64),
  sizeof(t_wide_char)
};

/* data type name table */
static const char_T * rtDataTypeNames[] = {
  "real_T",
  "real32_T",
  "int8_T",
  "uint8_T",
  "int16_T",
  "uint16_T",
  "int32_T",
  "uint32_T",
  "boolean_T",
  "fcn_call_T",
  "int_T",
  "pointer_T",
  "action_T",
  "timer_uint32_pair_T",
  "t_stream",
  "t_stream_ptr",
  "intmax_t",
  "ptrdiff_t",
  "size_t",
  "t_int64",
  "t_uint64",
  "t_wide_char"
};

/* data type transitions for block I/O structure */
static DataTypeTransition rtBTransitions[] = {
  { (char_T *)(&IMU_heli_1_2_B.DataTypeConversion1[0]), 0, 0, 15 },

  { (char_T *)(&IMU_heli_1_2_B.StreamFormattedRead1_o2), 1, 0, 12 },

  { (char_T *)(&IMU_heli_1_2_B.StreamCall2_o2), 3, 0, 1 },

  { (char_T *)(&IMU_heli_1_2_B.StreamFormattedRead1_o10), 8, 0, 9 }
  ,

  { (char_T *)(&IMU_heli_1_2_DW.StreamCall2_Stream), 14, 0, 1 },

  { (char_T *)(&IMU_heli_1_2_DW.GYROS_PWORK.LoggedData[0]), 11, 0, 36 },

  { (char_T *)(&IMU_heli_1_2_DW.UnitDelay_DSTATE), 1, 0, 6 },

  { (char_T *)(&IMU_heli_1_2_DW.Skiptonextline_SubsysRanBC), 2, 0, 1 },

  { (char_T *)(&IMU_heli_1_2_DW.StreamCall2_State), 3, 0, 1 }
};

/* data type transition table for block I/O structure */
static DataTypeTransitionTable rtBTransTable = {
  9U,
  rtBTransitions
};

/* data type transitions for Parameters structure */
static DataTypeTransition rtPTransitions[] = {
  { (char_T *)(&IMU_heli_1_2_P.Constant4_Value), 0, 0, 19 },

  { (char_T *)(&IMU_heli_1_2_P.StreamCall2_SendBufferSize), 6, 0, 2 },

  { (char_T *)(&IMU_heli_1_2_P.UnitDelay_InitialCondition), 1, 0, 6 },

  { (char_T *)(&IMU_heli_1_2_P.StreamFormattedRead_MaxUnits), 7, 0, 2 },

  { (char_T *)(&IMU_heli_1_2_P.StreamCall2_NonBlocking), 8, 0, 2 },

  { (char_T *)(&IMU_heli_1_2_P.StringConstant1_Value[0]), 3, 0, 257 }
};

/* data type transition table for Parameters structure */
static DataTypeTransitionTable rtPTransTable = {
  6U,
  rtPTransitions
};

/* [EOF] IMU_heli_1_2_dt.h */
