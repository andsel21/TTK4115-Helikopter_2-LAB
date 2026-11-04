/*
 * IMU_heli_1_2.c
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

#include "IMU_heli_1_2.h"
#include "IMU_heli_1_2_private.h"
#include "IMU_heli_1_2_dt.h"

t_stream IMU_heli_1_2_rtZt_stream = NULL;

/* Block signals (default storage) */
B_IMU_heli_1_2_T IMU_heli_1_2_B;

/* Block states (default storage) */
DW_IMU_heli_1_2_T IMU_heli_1_2_DW;

/* Real-time model */
static RT_MODEL_IMU_heli_1_2_T IMU_heli_1_2_M_;
RT_MODEL_IMU_heli_1_2_T *const IMU_heli_1_2_M = &IMU_heli_1_2_M_;

/* Model output function */
void IMU_heli_1_2_output(void)
{
  /* local block i/o variables */
  t_stream_ptr rtb_StreamCall2_o1;
  int32_T rtb_StreamFormattedRead1_o8;
  int32_T rtb_StreamFormattedRead_o2;
  int32_T rtb_StreamCall2_o3;
  real_T tmp[9];
  real_T euler_rates_tmp;
  real_T euler_rates_tmp_0;
  real_T euler_rates_tmp_1;
  real_T euler_rates_tmp_2;
  int32_T i;

  /* Reset subsysRan breadcrumbs */
  srClearBC(IMU_heli_1_2_DW.Skiptonextline_SubsysRanBC);

  /* S-Function (stream_call_block): '<S2>/Stream Call2' incorporates:
   *  Constant: '<S2>/Constant4'
   *  S-Function (string_constant_block): '<S2>/String Constant1'
   */

  /* S-Function Block: IMU_heli_1_2/IMU_BT/Stream Call2 (stream_call_block) */
  {
    t_error result = 0;
    t_boolean close_flag = (IMU_heli_1_2_P.Constant4_Value != 0);
    rtb_StreamCall2_o1 = NULL;
    switch (IMU_heli_1_2_DW.StreamCall2_State) {
     case STREAM_CALL_STATE_NOT_CONNECTED:
      {
        if (!close_flag) {
          /* Make sure URI is null-terminated */
          if (string_length((char *) IMU_heli_1_2_P.StringConstant1_Value, 255) ==
              255) {
            rtmSetErrorStatus(IMU_heli_1_2_M,
                              "URI passed to Stream Call block is not null-terminated!");
            result = -QERR_STRING_NOT_TERMINATED;
          } else {
            result = stream_connect((char *)
              IMU_heli_1_2_P.StringConstant1_Value,
              IMU_heli_1_2_P.StreamCall2_NonBlocking != 0,
              IMU_heli_1_2_P.StreamCall2_SendBufferSize,
              IMU_heli_1_2_P.StreamCall2_ReceiveBufferSize,
              &IMU_heli_1_2_DW.StreamCall2_Stream);
            if (result == 0) {
              IMU_heli_1_2_DW.StreamCall2_State = STREAM_CALL_STATE_CONNECTED;
              stream_set_byte_order(IMU_heli_1_2_DW.StreamCall2_Stream,
                                    (t_stream_byte_order)
                                    IMU_heli_1_2_P.StreamCall2_Endian);
              rtb_StreamCall2_o1 = &IMU_heli_1_2_DW.StreamCall2_Stream;
            } else if (result == -QERR_WOULD_BLOCK) {
              IMU_heli_1_2_DW.StreamCall2_State = STREAM_CALL_STATE_CONNECTING;
              result = 0;
            }
          }
        }
        break;
      }

     case STREAM_CALL_STATE_CONNECTING:
      {
        if (!close_flag) {
          const t_timeout timeout = { 0, 0, false };/* zero seconds */

          result = stream_poll(IMU_heli_1_2_DW.StreamCall2_Stream, &timeout,
                               STREAM_POLL_CONNECT);
          if (result > 0) {
            IMU_heli_1_2_DW.StreamCall2_State = STREAM_CALL_STATE_CONNECTED;
            stream_set_byte_order(IMU_heli_1_2_DW.StreamCall2_Stream,
                                  (t_stream_byte_order)
                                  IMU_heli_1_2_P.StreamCall2_Endian);
            rtb_StreamCall2_o1 = &IMU_heli_1_2_DW.StreamCall2_Stream;
            result = 0;
            break;
          } else if (result == 0) {
            break;
          }
        }

        /* Fall through deliberately */
      }

     case STREAM_CALL_STATE_CONNECTED:
      {
        rtb_StreamCall2_o1 = &IMU_heli_1_2_DW.StreamCall2_Stream;
        if (!close_flag) {
          break;
        }

        /* Fall through deliberately */
      }

     default:
      {
        t_error close_result = stream_close(IMU_heli_1_2_DW.StreamCall2_Stream);
        if (close_result == 0) {
          IMU_heli_1_2_DW.StreamCall2_State = STREAM_CALL_STATE_NOT_CONNECTED;
          IMU_heli_1_2_DW.StreamCall2_Stream = NULL;
          rtb_StreamCall2_o1 = NULL;
        } else if (result == 0) {
          result = close_result;
        }
        break;
      }
    }

    IMU_heli_1_2_B.StreamCall2_o2 = IMU_heli_1_2_DW.StreamCall2_State;
    rtb_StreamCall2_o3 = (int32_T) result;
  }

  /* S-Function (stream_formatted_read_block): '<S2>/Stream Formatted Read1' */
  {
    t_error result;
    IMU_heli_1_2_B.StreamFormattedRead1_o11 = false;
    if (rtb_StreamCall2_o1 != NULL) {
      result = stream_scan_utf8_char_array(*rtb_StreamCall2_o1,
        IMU_heli_1_2_P.StreamFormattedRead1_MaxUnits,
        &rtb_StreamFormattedRead1_o8, " :%f,%f,%f,%f,%f,%f\r"
        , &IMU_heli_1_2_B.StreamFormattedRead1_o2
        , &IMU_heli_1_2_B.StreamFormattedRead1_o3
        , &IMU_heli_1_2_B.StreamFormattedRead1_o4
        , &IMU_heli_1_2_B.StreamFormattedRead1_o5
        , &IMU_heli_1_2_B.StreamFormattedRead1_o6
        , &IMU_heli_1_2_B.StreamFormattedRead1_o7
        );
      IMU_heli_1_2_B.StreamFormattedRead1_o11 = (result == 0);
      if (result > 0) {
        result = 0;
      }
    } else {
      rtb_StreamFormattedRead1_o8 = 0;
      result = 0;
      IMU_heli_1_2_B.StreamFormattedRead1_o2 = 0;
      IMU_heli_1_2_B.StreamFormattedRead1_o3 = 0;
      IMU_heli_1_2_B.StreamFormattedRead1_o4 = 0;
      IMU_heli_1_2_B.StreamFormattedRead1_o5 = 0;
      IMU_heli_1_2_B.StreamFormattedRead1_o6 = 0;
      IMU_heli_1_2_B.StreamFormattedRead1_o7 = 0;
    }

    IMU_heli_1_2_B.StreamFormattedRead1_o10 = (result ==
      -QERR_MISMATCHED_CHARACTER);
  }

  /* DataTypeConversion: '<S2>/Data Type Conversion1' */
  IMU_heli_1_2_B.DataTypeConversion1[0] = IMU_heli_1_2_B.StreamFormattedRead1_o2;
  IMU_heli_1_2_B.DataTypeConversion1[1] = IMU_heli_1_2_B.StreamFormattedRead1_o3;
  IMU_heli_1_2_B.DataTypeConversion1[2] = IMU_heli_1_2_B.StreamFormattedRead1_o4;
  for (i = 0; i < 3; i++) {
    /* Gain: '<S2>/Gain2' */
    IMU_heli_1_2_B.Gain2[i] = 0.0;
    IMU_heli_1_2_B.Gain2[i] += IMU_heli_1_2_P.Gain2_Gain[i] *
      IMU_heli_1_2_B.DataTypeConversion1[0];
    IMU_heli_1_2_B.Gain2[i] += IMU_heli_1_2_P.Gain2_Gain[i + 3] *
      IMU_heli_1_2_B.DataTypeConversion1[1];
    IMU_heli_1_2_B.Gain2[i] += IMU_heli_1_2_P.Gain2_Gain[i + 6] *
      IMU_heli_1_2_B.DataTypeConversion1[2];
  }

  /* UnitDelay: '<S3>/Unit Delay' */
  IMU_heli_1_2_B.UnitDelay = IMU_heli_1_2_DW.UnitDelay_DSTATE;

  /* RelationalOperator: '<S3>/Relational Operator' */
  IMU_heli_1_2_B.RelationalOperator = (IMU_heli_1_2_B.StreamFormattedRead1_o2 ==
    IMU_heli_1_2_B.UnitDelay);

  /* UnitDelay: '<S4>/Unit Delay' */
  IMU_heli_1_2_B.UnitDelay_c = IMU_heli_1_2_DW.UnitDelay_DSTATE_p;

  /* RelationalOperator: '<S4>/Relational Operator' */
  IMU_heli_1_2_B.RelationalOperator_a = (IMU_heli_1_2_B.StreamFormattedRead1_o3 ==
    IMU_heli_1_2_B.UnitDelay_c);

  /* UnitDelay: '<S5>/Unit Delay' */
  IMU_heli_1_2_B.UnitDelay_a = IMU_heli_1_2_DW.UnitDelay_DSTATE_m;

  /* RelationalOperator: '<S5>/Relational Operator' */
  IMU_heli_1_2_B.RelationalOperator_aj = (IMU_heli_1_2_B.StreamFormattedRead1_o4
    == IMU_heli_1_2_B.UnitDelay_a);

  /* UnitDelay: '<S6>/Unit Delay' */
  IMU_heli_1_2_B.UnitDelay_p = IMU_heli_1_2_DW.UnitDelay_DSTATE_n;

  /* RelationalOperator: '<S6>/Relational Operator' */
  IMU_heli_1_2_B.RelationalOperator_n = (IMU_heli_1_2_B.StreamFormattedRead1_o5 ==
    IMU_heli_1_2_B.UnitDelay_p);

  /* UnitDelay: '<S7>/Unit Delay' */
  IMU_heli_1_2_B.UnitDelay_b = IMU_heli_1_2_DW.UnitDelay_DSTATE_g;

  /* RelationalOperator: '<S7>/Relational Operator' */
  IMU_heli_1_2_B.RelationalOperator_g = (IMU_heli_1_2_B.StreamFormattedRead1_o6 ==
    IMU_heli_1_2_B.UnitDelay_b);

  /* UnitDelay: '<S8>/Unit Delay' */
  IMU_heli_1_2_B.UnitDelay_g = IMU_heli_1_2_DW.UnitDelay_DSTATE_ph;

  /* RelationalOperator: '<S8>/Relational Operator' */
  IMU_heli_1_2_B.RelationalOperator_gg = (IMU_heli_1_2_B.StreamFormattedRead1_o7
    == IMU_heli_1_2_B.UnitDelay_g);

  /* Logic: '<S2>/Logical Operator1' incorporates:
   *  Logic: '<S2>/Logical Operator'
   */
  IMU_heli_1_2_B.LogicalOperator1 = ((!IMU_heli_1_2_B.RelationalOperator) ||
    (!IMU_heli_1_2_B.RelationalOperator_a) ||
    (!IMU_heli_1_2_B.RelationalOperator_aj) ||
    (!IMU_heli_1_2_B.RelationalOperator_n) ||
    (!IMU_heli_1_2_B.RelationalOperator_g) ||
    (!IMU_heli_1_2_B.RelationalOperator_gg));

  /* DataTypeConversion: '<S2>/Data Type Conversion2' */
  IMU_heli_1_2_B.DataTypeConversion2[0] = IMU_heli_1_2_B.StreamFormattedRead1_o5;
  IMU_heli_1_2_B.DataTypeConversion2[1] = IMU_heli_1_2_B.StreamFormattedRead1_o6;
  IMU_heli_1_2_B.DataTypeConversion2[2] = IMU_heli_1_2_B.StreamFormattedRead1_o7;
  for (i = 0; i < 3; i++) {
    /* Gain: '<S2>/Gain1' */
    IMU_heli_1_2_B.Gain1[i] = 0.0;
    IMU_heli_1_2_B.Gain1[i] += IMU_heli_1_2_P.Gain1_Gain[i] *
      IMU_heli_1_2_B.DataTypeConversion2[0];
    IMU_heli_1_2_B.Gain1[i] += IMU_heli_1_2_P.Gain1_Gain[i + 3] *
      IMU_heli_1_2_B.DataTypeConversion2[1];
    IMU_heli_1_2_B.Gain1[i] += IMU_heli_1_2_P.Gain1_Gain[i + 6] *
      IMU_heli_1_2_B.DataTypeConversion2[2];
  }

  /* MATLAB Function: '<Root>/Gyro vector to [pitch rate, elevation rate, travle rate]' */
  /* MATLAB Function 'Gyro vector to [pitch rate, elevation rate, travle rate]': '<S1>:1' */
  /* '<S1>:1:3' */
  /* '<S1>:1:4' */
  /* '<S1>:1:6' */
  /* '<S1>:1:9' */
  euler_rates_tmp = tan(IMU_heli_1_2_B.Gain2[1]);
  euler_rates_tmp_0 = sin(IMU_heli_1_2_B.Gain2[0]);
  euler_rates_tmp_1 = cos(IMU_heli_1_2_B.Gain2[0]);
  euler_rates_tmp_2 = cos(IMU_heli_1_2_B.Gain2[1]);
  tmp[0] = 1.0;
  tmp[3] = euler_rates_tmp_0 * euler_rates_tmp;
  tmp[6] = euler_rates_tmp_1 * euler_rates_tmp;
  tmp[1] = 0.0;
  tmp[4] = euler_rates_tmp_1;
  tmp[7] = -euler_rates_tmp_0;
  tmp[2] = 0.0;
  tmp[5] = euler_rates_tmp_0 / euler_rates_tmp_2;
  tmp[8] = euler_rates_tmp_1 / euler_rates_tmp_2;
  for (i = 0; i < 3; i++) {
    IMU_heli_1_2_B.euler_rates[i] = 0.0;
    IMU_heli_1_2_B.euler_rates[i] += tmp[i] * IMU_heli_1_2_B.Gain1[0];
    IMU_heli_1_2_B.euler_rates[i] += tmp[i + 3] * IMU_heli_1_2_B.Gain1[1];
    IMU_heli_1_2_B.euler_rates[i] += tmp[i + 6] * IMU_heli_1_2_B.Gain1[2];
  }

  /* End of MATLAB Function: '<Root>/Gyro vector to [pitch rate, elevation rate, travle rate]' */
  /* Outputs for Enabled SubSystem: '<S2>/Skip to next line' incorporates:
   *  EnablePort: '<S9>/Enable'
   */
  if (IMU_heli_1_2_B.StreamFormattedRead1_o10) {
    /* S-Function (stream_formatted_read_block): '<S9>/Stream Formatted Read' incorporates:
     *  S-Function (stream_call_block): '<S2>/Stream Call2'
     *  S-Function (stream_formatted_read_block): '<S2>/Stream Formatted Read1'
     */
    {
      if (((t_stream_ptr)rtb_StreamCall2_o1) != NULL) {
        stream_scan_utf8_char_array(*((t_stream_ptr)rtb_StreamCall2_o1),
          IMU_heli_1_2_P.StreamFormattedRead_MaxUnits,
          &rtb_StreamFormattedRead_o2, " %*[^\r]"
          );
      } else {
        rtb_StreamFormattedRead_o2 = 0;
      }
    }

    srUpdateBC(IMU_heli_1_2_DW.Skiptonextline_SubsysRanBC);
  }

  /* End of Outputs for SubSystem: '<S2>/Skip to next line' */

  /* S-Function (stop_with_error_block): '<S2>/Stop with Error' */

  /* S-Function Block: IMU_heli_1_2/IMU_BT/Stop with Error (stop_with_error_block) */
  {
    if (rtb_StreamCall2_o3 < 0) {
      msg_get_error_messageA(NULL, rtb_StreamCall2_o3, _rt_error_message, sizeof
        (_rt_error_message));
      rtmSetErrorStatus(IMU_heli_1_2_M, _rt_error_message);
      return;
    }
  }
}

/* Model update function */
void IMU_heli_1_2_update(void)
{
  /* Update for UnitDelay: '<S3>/Unit Delay' */
  IMU_heli_1_2_DW.UnitDelay_DSTATE = IMU_heli_1_2_B.StreamFormattedRead1_o2;

  /* Update for UnitDelay: '<S4>/Unit Delay' */
  IMU_heli_1_2_DW.UnitDelay_DSTATE_p = IMU_heli_1_2_B.StreamFormattedRead1_o3;

  /* Update for UnitDelay: '<S5>/Unit Delay' */
  IMU_heli_1_2_DW.UnitDelay_DSTATE_m = IMU_heli_1_2_B.StreamFormattedRead1_o4;

  /* Update for UnitDelay: '<S6>/Unit Delay' */
  IMU_heli_1_2_DW.UnitDelay_DSTATE_n = IMU_heli_1_2_B.StreamFormattedRead1_o5;

  /* Update for UnitDelay: '<S7>/Unit Delay' */
  IMU_heli_1_2_DW.UnitDelay_DSTATE_g = IMU_heli_1_2_B.StreamFormattedRead1_o6;

  /* Update for UnitDelay: '<S8>/Unit Delay' */
  IMU_heli_1_2_DW.UnitDelay_DSTATE_ph = IMU_heli_1_2_B.StreamFormattedRead1_o7;

  /* Update absolute time for base rate */
  /* The "clockTick0" counts the number of times the code of this task has
   * been executed. The absolute time is the multiplication of "clockTick0"
   * and "Timing.stepSize0". Size of "clockTick0" ensures timer will not
   * overflow during the application lifespan selected.
   * Timer of this task consists of two 32 bit unsigned integers.
   * The two integers represent the low bits Timing.clockTick0 and the high bits
   * Timing.clockTickH0. When the low bit overflows to 0, the high bits increment.
   */
  if (!(++IMU_heli_1_2_M->Timing.clockTick0)) {
    ++IMU_heli_1_2_M->Timing.clockTickH0;
  }

  IMU_heli_1_2_M->Timing.t[0] = IMU_heli_1_2_M->Timing.clockTick0 *
    IMU_heli_1_2_M->Timing.stepSize0 + IMU_heli_1_2_M->Timing.clockTickH0 *
    IMU_heli_1_2_M->Timing.stepSize0 * 4294967296.0;
}

/* Model initialize function */
void IMU_heli_1_2_initialize(void)
{
  /* Start for S-Function (stream_call_block): '<S2>/Stream Call2' incorporates:
   *  Constant: '<S2>/Constant4'
   *  S-Function (string_constant_block): '<S2>/String Constant1'
   */

  /* S-Function Block: IMU_heli_1_2/IMU_BT/Stream Call2 (stream_call_block) */
  {
    IMU_heli_1_2_DW.StreamCall2_State = STREAM_CALL_STATE_NOT_CONNECTED;
    IMU_heli_1_2_DW.StreamCall2_Stream = NULL;
  }

  /* InitializeConditions for UnitDelay: '<S3>/Unit Delay' */
  IMU_heli_1_2_DW.UnitDelay_DSTATE = IMU_heli_1_2_P.UnitDelay_InitialCondition;

  /* InitializeConditions for UnitDelay: '<S4>/Unit Delay' */
  IMU_heli_1_2_DW.UnitDelay_DSTATE_p =
    IMU_heli_1_2_P.UnitDelay_InitialCondition_g;

  /* InitializeConditions for UnitDelay: '<S5>/Unit Delay' */
  IMU_heli_1_2_DW.UnitDelay_DSTATE_m =
    IMU_heli_1_2_P.UnitDelay_InitialCondition_n;

  /* InitializeConditions for UnitDelay: '<S6>/Unit Delay' */
  IMU_heli_1_2_DW.UnitDelay_DSTATE_n =
    IMU_heli_1_2_P.UnitDelay_InitialCondition_l;

  /* InitializeConditions for UnitDelay: '<S7>/Unit Delay' */
  IMU_heli_1_2_DW.UnitDelay_DSTATE_g =
    IMU_heli_1_2_P.UnitDelay_InitialCondition_f;

  /* InitializeConditions for UnitDelay: '<S8>/Unit Delay' */
  IMU_heli_1_2_DW.UnitDelay_DSTATE_ph =
    IMU_heli_1_2_P.UnitDelay_InitialCondition_d;
}

/* Model terminate function */
void IMU_heli_1_2_terminate(void)
{
  /* Terminate for S-Function (stream_call_block): '<S2>/Stream Call2' incorporates:
   *  Constant: '<S2>/Constant4'
   *  S-Function (string_constant_block): '<S2>/String Constant1'
   */

  /* S-Function Block: IMU_heli_1_2/IMU_BT/Stream Call2 (stream_call_block) */
  {
    if (IMU_heli_1_2_DW.StreamCall2_Stream != NULL) {
      stream_close(IMU_heli_1_2_DW.StreamCall2_Stream);
      IMU_heli_1_2_DW.StreamCall2_Stream = NULL;
    }
  }
}

/*========================================================================*
 * Start of Classic call interface                                        *
 *========================================================================*/
void MdlOutputs(int_T tid)
{
  IMU_heli_1_2_output();
  UNUSED_PARAMETER(tid);
}

void MdlUpdate(int_T tid)
{
  IMU_heli_1_2_update();
  UNUSED_PARAMETER(tid);
}

void MdlInitializeSizes(void)
{
}

void MdlInitializeSampleTimes(void)
{
}

void MdlInitialize(void)
{
}

void MdlStart(void)
{
  IMU_heli_1_2_initialize();
}

void MdlTerminate(void)
{
  IMU_heli_1_2_terminate();
}

/* Registration function */
RT_MODEL_IMU_heli_1_2_T *IMU_heli_1_2(void)
{
  /* Registration code */

  /* initialize non-finites */
  rt_InitInfAndNaN(sizeof(real_T));

  /* non-finite (run-time) assignments */
  IMU_heli_1_2_P.UnitDelay_InitialCondition = rtNaNF;
  IMU_heli_1_2_P.UnitDelay_InitialCondition_g = rtNaNF;
  IMU_heli_1_2_P.UnitDelay_InitialCondition_n = rtNaNF;
  IMU_heli_1_2_P.UnitDelay_InitialCondition_l = rtNaNF;
  IMU_heli_1_2_P.UnitDelay_InitialCondition_f = rtNaNF;
  IMU_heli_1_2_P.UnitDelay_InitialCondition_d = rtNaNF;

  /* initialize real-time model */
  (void) memset((void *)IMU_heli_1_2_M, 0,
                sizeof(RT_MODEL_IMU_heli_1_2_T));

  /* Initialize timing info */
  {
    int_T *mdlTsMap = IMU_heli_1_2_M->Timing.sampleTimeTaskIDArray;
    mdlTsMap[0] = 0;
    IMU_heli_1_2_M->Timing.sampleTimeTaskIDPtr = (&mdlTsMap[0]);
    IMU_heli_1_2_M->Timing.sampleTimes =
      (&IMU_heli_1_2_M->Timing.sampleTimesArray[0]);
    IMU_heli_1_2_M->Timing.offsetTimes =
      (&IMU_heli_1_2_M->Timing.offsetTimesArray[0]);

    /* task periods */
    IMU_heli_1_2_M->Timing.sampleTimes[0] = (0.002);

    /* task offsets */
    IMU_heli_1_2_M->Timing.offsetTimes[0] = (0.0);
  }

  rtmSetTPtr(IMU_heli_1_2_M, &IMU_heli_1_2_M->Timing.tArray[0]);

  {
    int_T *mdlSampleHits = IMU_heli_1_2_M->Timing.sampleHitArray;
    mdlSampleHits[0] = 1;
    IMU_heli_1_2_M->Timing.sampleHits = (&mdlSampleHits[0]);
  }

  rtmSetTFinal(IMU_heli_1_2_M, -1);
  IMU_heli_1_2_M->Timing.stepSize0 = 0.002;

  /* External mode info */
  IMU_heli_1_2_M->Sizes.checksums[0] = (2259396693U);
  IMU_heli_1_2_M->Sizes.checksums[1] = (1382415996U);
  IMU_heli_1_2_M->Sizes.checksums[2] = (1253414461U);
  IMU_heli_1_2_M->Sizes.checksums[3] = (1758035319U);

  {
    static const sysRanDType rtAlwaysEnabled = SUBSYS_RAN_BC_ENABLE;
    static RTWExtModeInfo rt_ExtModeInfo;
    static const sysRanDType *systemRan[3];
    IMU_heli_1_2_M->extModeInfo = (&rt_ExtModeInfo);
    rteiSetSubSystemActiveVectorAddresses(&rt_ExtModeInfo, systemRan);
    systemRan[0] = &rtAlwaysEnabled;
    systemRan[1] = &rtAlwaysEnabled;
    systemRan[2] = (sysRanDType *)&IMU_heli_1_2_DW.Skiptonextline_SubsysRanBC;
    rteiSetModelMappingInfoPtr(IMU_heli_1_2_M->extModeInfo,
      &IMU_heli_1_2_M->SpecialInfo.mappingInfo);
    rteiSetChecksumsPtr(IMU_heli_1_2_M->extModeInfo,
                        IMU_heli_1_2_M->Sizes.checksums);
    rteiSetTPtr(IMU_heli_1_2_M->extModeInfo, rtmGetTPtr(IMU_heli_1_2_M));
  }

  IMU_heli_1_2_M->solverInfoPtr = (&IMU_heli_1_2_M->solverInfo);
  IMU_heli_1_2_M->Timing.stepSize = (0.002);
  rtsiSetFixedStepSize(&IMU_heli_1_2_M->solverInfo, 0.002);
  rtsiSetSolverMode(&IMU_heli_1_2_M->solverInfo, SOLVER_MODE_SINGLETASKING);

  /* block I/O */
  IMU_heli_1_2_M->blockIO = ((void *) &IMU_heli_1_2_B);
  (void) memset(((void *) &IMU_heli_1_2_B), 0,
                sizeof(B_IMU_heli_1_2_T));

  /* parameters */
  IMU_heli_1_2_M->defaultParam = ((real_T *)&IMU_heli_1_2_P);

  /* states (dwork) */
  IMU_heli_1_2_M->dwork = ((void *) &IMU_heli_1_2_DW);
  (void) memset((void *)&IMU_heli_1_2_DW, 0,
                sizeof(DW_IMU_heli_1_2_T));

  /* data type transition information */
  {
    static DataTypeTransInfo dtInfo;
    (void) memset((char_T *) &dtInfo, 0,
                  sizeof(dtInfo));
    IMU_heli_1_2_M->SpecialInfo.mappingInfo = (&dtInfo);
    dtInfo.numDataTypes = 22;
    dtInfo.dataTypeSizes = &rtDataTypeSizes[0];
    dtInfo.dataTypeNames = &rtDataTypeNames[0];

    /* Block I/O transition table */
    dtInfo.BTransTable = &rtBTransTable;

    /* Parameters transition table */
    dtInfo.PTransTable = &rtPTransTable;
  }

  /* Initialize Sizes */
  IMU_heli_1_2_M->Sizes.numContStates = (0);/* Number of continuous states */
  IMU_heli_1_2_M->Sizes.numY = (0);    /* Number of model outputs */
  IMU_heli_1_2_M->Sizes.numU = (0);    /* Number of model inputs */
  IMU_heli_1_2_M->Sizes.sysDirFeedThru = (0);/* The model is not direct feedthrough */
  IMU_heli_1_2_M->Sizes.numSampTimes = (1);/* Number of sample times */
  IMU_heli_1_2_M->Sizes.numBlocks = (47);/* Number of blocks */
  IMU_heli_1_2_M->Sizes.numBlockIO = (27);/* Number of block outputs */
  IMU_heli_1_2_M->Sizes.numBlockPrms = (288);/* Sum of parameter "widths" */
  return IMU_heli_1_2_M;
}

/*========================================================================*
 * End of Classic call interface                                          *
 *========================================================================*/
