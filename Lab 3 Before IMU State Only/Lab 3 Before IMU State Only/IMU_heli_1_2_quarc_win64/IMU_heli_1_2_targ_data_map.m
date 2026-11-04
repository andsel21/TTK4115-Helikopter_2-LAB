  function targMap = targDataMap(),

  ;%***********************
  ;% Create Parameter Map *
  ;%***********************
      
    nTotData      = 0; %add to this count as we go
    nTotSects     = 6;
    sectIdxOffset = 0;
    
    ;%
    ;% Define dummy sections & preallocate arrays
    ;%
    dumSection.nData = -1;  
    dumSection.data  = [];
    
    dumData.logicalSrcIdx = -1;
    dumData.dtTransOffset = -1;
    
    ;%
    ;% Init/prealloc paramMap
    ;%
    paramMap.nSections           = nTotSects;
    paramMap.sectIdxOffset       = sectIdxOffset;
      paramMap.sections(nTotSects) = dumSection; %prealloc
    paramMap.nTotData            = -1;
    
    ;%
    ;% Auto data (IMU_heli_1_2_P)
    ;%
      section.nData     = 3;
      section.data(3)  = dumData; %prealloc
      
	  ;% IMU_heli_1_2_P.Constant4_Value
	  section.data(1).logicalSrcIdx = 0;
	  section.data(1).dtTransOffset = 0;
	
	  ;% IMU_heli_1_2_P.Gain2_Gain
	  section.data(2).logicalSrcIdx = 1;
	  section.data(2).dtTransOffset = 1;
	
	  ;% IMU_heli_1_2_P.Gain1_Gain
	  section.data(3).logicalSrcIdx = 2;
	  section.data(3).dtTransOffset = 10;
	
      nTotData = nTotData + section.nData;
      paramMap.sections(1) = section;
      clear section
      
      section.nData     = 2;
      section.data(2)  = dumData; %prealloc
      
	  ;% IMU_heli_1_2_P.StreamCall2_SendBufferSize
	  section.data(1).logicalSrcIdx = 3;
	  section.data(1).dtTransOffset = 0;
	
	  ;% IMU_heli_1_2_P.StreamCall2_ReceiveBufferSize
	  section.data(2).logicalSrcIdx = 4;
	  section.data(2).dtTransOffset = 1;
	
      nTotData = nTotData + section.nData;
      paramMap.sections(2) = section;
      clear section
      
      section.nData     = 6;
      section.data(6)  = dumData; %prealloc
      
	  ;% IMU_heli_1_2_P.UnitDelay_InitialCondition
	  section.data(1).logicalSrcIdx = 5;
	  section.data(1).dtTransOffset = 0;
	
	  ;% IMU_heli_1_2_P.UnitDelay_InitialCondition_g
	  section.data(2).logicalSrcIdx = 6;
	  section.data(2).dtTransOffset = 1;
	
	  ;% IMU_heli_1_2_P.UnitDelay_InitialCondition_n
	  section.data(3).logicalSrcIdx = 7;
	  section.data(3).dtTransOffset = 2;
	
	  ;% IMU_heli_1_2_P.UnitDelay_InitialCondition_l
	  section.data(4).logicalSrcIdx = 8;
	  section.data(4).dtTransOffset = 3;
	
	  ;% IMU_heli_1_2_P.UnitDelay_InitialCondition_f
	  section.data(5).logicalSrcIdx = 9;
	  section.data(5).dtTransOffset = 4;
	
	  ;% IMU_heli_1_2_P.UnitDelay_InitialCondition_d
	  section.data(6).logicalSrcIdx = 10;
	  section.data(6).dtTransOffset = 5;
	
      nTotData = nTotData + section.nData;
      paramMap.sections(3) = section;
      clear section
      
      section.nData     = 2;
      section.data(2)  = dumData; %prealloc
      
	  ;% IMU_heli_1_2_P.StreamFormattedRead_MaxUnits
	  section.data(1).logicalSrcIdx = 11;
	  section.data(1).dtTransOffset = 0;
	
	  ;% IMU_heli_1_2_P.StreamFormattedRead1_MaxUnits
	  section.data(2).logicalSrcIdx = 12;
	  section.data(2).dtTransOffset = 1;
	
      nTotData = nTotData + section.nData;
      paramMap.sections(4) = section;
      clear section
      
      section.nData     = 2;
      section.data(2)  = dumData; %prealloc
      
	  ;% IMU_heli_1_2_P.StreamCall2_NonBlocking
	  section.data(1).logicalSrcIdx = 13;
	  section.data(1).dtTransOffset = 0;
	
	  ;% IMU_heli_1_2_P.StreamCall2_Active
	  section.data(2).logicalSrcIdx = 14;
	  section.data(2).dtTransOffset = 1;
	
      nTotData = nTotData + section.nData;
      paramMap.sections(5) = section;
      clear section
      
      section.nData     = 3;
      section.data(3)  = dumData; %prealloc
      
	  ;% IMU_heli_1_2_P.StringConstant1_Value
	  section.data(1).logicalSrcIdx = 15;
	  section.data(1).dtTransOffset = 0;
	
	  ;% IMU_heli_1_2_P.StreamCall2_URI
	  section.data(2).logicalSrcIdx = 16;
	  section.data(2).dtTransOffset = 255;
	
	  ;% IMU_heli_1_2_P.StreamCall2_Endian
	  section.data(3).logicalSrcIdx = 17;
	  section.data(3).dtTransOffset = 256;
	
      nTotData = nTotData + section.nData;
      paramMap.sections(6) = section;
      clear section
      
    
      ;%
      ;% Non-auto Data (parameter)
      ;%
    

    ;%
    ;% Add final counts to struct.
    ;%
    paramMap.nTotData = nTotData;
    


  ;%**************************
  ;% Create Block Output Map *
  ;%**************************
      
    nTotData      = 0; %add to this count as we go
    nTotSects     = 4;
    sectIdxOffset = 0;
    
    ;%
    ;% Define dummy sections & preallocate arrays
    ;%
    dumSection.nData = -1;  
    dumSection.data  = [];
    
    dumData.logicalSrcIdx = -1;
    dumData.dtTransOffset = -1;
    
    ;%
    ;% Init/prealloc sigMap
    ;%
    sigMap.nSections           = nTotSects;
    sigMap.sectIdxOffset       = sectIdxOffset;
      sigMap.sections(nTotSects) = dumSection; %prealloc
    sigMap.nTotData            = -1;
    
    ;%
    ;% Auto data (IMU_heli_1_2_B)
    ;%
      section.nData     = 5;
      section.data(5)  = dumData; %prealloc
      
	  ;% IMU_heli_1_2_B.DataTypeConversion1
	  section.data(1).logicalSrcIdx = 0;
	  section.data(1).dtTransOffset = 0;
	
	  ;% IMU_heli_1_2_B.Gain2
	  section.data(2).logicalSrcIdx = 1;
	  section.data(2).dtTransOffset = 3;
	
	  ;% IMU_heli_1_2_B.DataTypeConversion2
	  section.data(3).logicalSrcIdx = 2;
	  section.data(3).dtTransOffset = 6;
	
	  ;% IMU_heli_1_2_B.Gain1
	  section.data(4).logicalSrcIdx = 3;
	  section.data(4).dtTransOffset = 9;
	
	  ;% IMU_heli_1_2_B.euler_rates
	  section.data(5).logicalSrcIdx = 4;
	  section.data(5).dtTransOffset = 12;
	
      nTotData = nTotData + section.nData;
      sigMap.sections(1) = section;
      clear section
      
      section.nData     = 12;
      section.data(12)  = dumData; %prealloc
      
	  ;% IMU_heli_1_2_B.StreamFormattedRead1_o2
	  section.data(1).logicalSrcIdx = 5;
	  section.data(1).dtTransOffset = 0;
	
	  ;% IMU_heli_1_2_B.StreamFormattedRead1_o3
	  section.data(2).logicalSrcIdx = 6;
	  section.data(2).dtTransOffset = 1;
	
	  ;% IMU_heli_1_2_B.StreamFormattedRead1_o4
	  section.data(3).logicalSrcIdx = 7;
	  section.data(3).dtTransOffset = 2;
	
	  ;% IMU_heli_1_2_B.StreamFormattedRead1_o5
	  section.data(4).logicalSrcIdx = 8;
	  section.data(4).dtTransOffset = 3;
	
	  ;% IMU_heli_1_2_B.StreamFormattedRead1_o6
	  section.data(5).logicalSrcIdx = 9;
	  section.data(5).dtTransOffset = 4;
	
	  ;% IMU_heli_1_2_B.StreamFormattedRead1_o7
	  section.data(6).logicalSrcIdx = 10;
	  section.data(6).dtTransOffset = 5;
	
	  ;% IMU_heli_1_2_B.UnitDelay
	  section.data(7).logicalSrcIdx = 11;
	  section.data(7).dtTransOffset = 6;
	
	  ;% IMU_heli_1_2_B.UnitDelay_c
	  section.data(8).logicalSrcIdx = 12;
	  section.data(8).dtTransOffset = 7;
	
	  ;% IMU_heli_1_2_B.UnitDelay_a
	  section.data(9).logicalSrcIdx = 13;
	  section.data(9).dtTransOffset = 8;
	
	  ;% IMU_heli_1_2_B.UnitDelay_p
	  section.data(10).logicalSrcIdx = 14;
	  section.data(10).dtTransOffset = 9;
	
	  ;% IMU_heli_1_2_B.UnitDelay_b
	  section.data(11).logicalSrcIdx = 15;
	  section.data(11).dtTransOffset = 10;
	
	  ;% IMU_heli_1_2_B.UnitDelay_g
	  section.data(12).logicalSrcIdx = 16;
	  section.data(12).dtTransOffset = 11;
	
      nTotData = nTotData + section.nData;
      sigMap.sections(2) = section;
      clear section
      
      section.nData     = 1;
      section.data(1)  = dumData; %prealloc
      
	  ;% IMU_heli_1_2_B.StreamCall2_o2
	  section.data(1).logicalSrcIdx = 17;
	  section.data(1).dtTransOffset = 0;
	
      nTotData = nTotData + section.nData;
      sigMap.sections(3) = section;
      clear section
      
      section.nData     = 9;
      section.data(9)  = dumData; %prealloc
      
	  ;% IMU_heli_1_2_B.StreamFormattedRead1_o10
	  section.data(1).logicalSrcIdx = 18;
	  section.data(1).dtTransOffset = 0;
	
	  ;% IMU_heli_1_2_B.StreamFormattedRead1_o11
	  section.data(2).logicalSrcIdx = 19;
	  section.data(2).dtTransOffset = 1;
	
	  ;% IMU_heli_1_2_B.RelationalOperator
	  section.data(3).logicalSrcIdx = 20;
	  section.data(3).dtTransOffset = 2;
	
	  ;% IMU_heli_1_2_B.RelationalOperator_a
	  section.data(4).logicalSrcIdx = 21;
	  section.data(4).dtTransOffset = 3;
	
	  ;% IMU_heli_1_2_B.RelationalOperator_aj
	  section.data(5).logicalSrcIdx = 22;
	  section.data(5).dtTransOffset = 4;
	
	  ;% IMU_heli_1_2_B.RelationalOperator_n
	  section.data(6).logicalSrcIdx = 23;
	  section.data(6).dtTransOffset = 5;
	
	  ;% IMU_heli_1_2_B.RelationalOperator_g
	  section.data(7).logicalSrcIdx = 24;
	  section.data(7).dtTransOffset = 6;
	
	  ;% IMU_heli_1_2_B.RelationalOperator_gg
	  section.data(8).logicalSrcIdx = 25;
	  section.data(8).dtTransOffset = 7;
	
	  ;% IMU_heli_1_2_B.LogicalOperator1
	  section.data(9).logicalSrcIdx = 26;
	  section.data(9).dtTransOffset = 8;
	
      nTotData = nTotData + section.nData;
      sigMap.sections(4) = section;
      clear section
      
    
      ;%
      ;% Non-auto Data (signal)
      ;%
    

    ;%
    ;% Add final counts to struct.
    ;%
    sigMap.nTotData = nTotData;
    


  ;%*******************
  ;% Create DWork Map *
  ;%*******************
      
    nTotData      = 0; %add to this count as we go
    nTotSects     = 5;
    sectIdxOffset = 4;
    
    ;%
    ;% Define dummy sections & preallocate arrays
    ;%
    dumSection.nData = -1;  
    dumSection.data  = [];
    
    dumData.logicalSrcIdx = -1;
    dumData.dtTransOffset = -1;
    
    ;%
    ;% Init/prealloc dworkMap
    ;%
    dworkMap.nSections           = nTotSects;
    dworkMap.sectIdxOffset       = sectIdxOffset;
      dworkMap.sections(nTotSects) = dumSection; %prealloc
    dworkMap.nTotData            = -1;
    
    ;%
    ;% Auto data (IMU_heli_1_2_DW)
    ;%
      section.nData     = 1;
      section.data(1)  = dumData; %prealloc
      
	  ;% IMU_heli_1_2_DW.StreamCall2_Stream
	  section.data(1).logicalSrcIdx = 0;
	  section.data(1).dtTransOffset = 0;
	
      nTotData = nTotData + section.nData;
      dworkMap.sections(1) = section;
      clear section
      
      section.nData     = 20;
      section.data(20)  = dumData; %prealloc
      
	  ;% IMU_heli_1_2_DW.GYROS_PWORK.LoggedData
	  section.data(1).logicalSrcIdx = 1;
	  section.data(1).dtTransOffset = 0;
	
	  ;% IMU_heli_1_2_DW.NewData_PWORK.LoggedData
	  section.data(2).logicalSrcIdx = 2;
	  section.data(2).dtTransOffset = 3;
	
	  ;% IMU_heli_1_2_DW.wxPitchrate_PWORK.LoggedData
	  section.data(3).logicalSrcIdx = 3;
	  section.data(3).dtTransOffset = 4;
	
	  ;% IMU_heli_1_2_DW.wyelevationrate_PWORK.LoggedData
	  section.data(4).logicalSrcIdx = 4;
	  section.data(4).dtTransOffset = 6;
	
	  ;% IMU_heli_1_2_DW.wzTravelrate_PWORK.LoggedData
	  section.data(5).logicalSrcIdx = 5;
	  section.data(5).dtTransOffset = 8;
	
	  ;% IMU_heli_1_2_DW.Closed_PWORK.LoggedData
	  section.data(6).logicalSrcIdx = 6;
	  section.data(6).dtTransOffset = 10;
	
	  ;% IMU_heli_1_2_DW.Connected2_PWORK.LoggedData
	  section.data(7).logicalSrcIdx = 7;
	  section.data(7).dtTransOffset = 11;
	
	  ;% IMU_heli_1_2_DW.Scope_PWORK.LoggedData
	  section.data(8).logicalSrcIdx = 8;
	  section.data(8).dtTransOffset = 12;
	
	  ;% IMU_heli_1_2_DW.ax_PWORK.LoggedData
	  section.data(9).logicalSrcIdx = 9;
	  section.data(9).dtTransOffset = 18;
	
	  ;% IMU_heli_1_2_DW.ay_PWORK.LoggedData
	  section.data(10).logicalSrcIdx = 10;
	  section.data(10).dtTransOffset = 19;
	
	  ;% IMU_heli_1_2_DW.az_PWORK.LoggedData
	  section.data(11).logicalSrcIdx = 11;
	  section.data(11).dtTransOffset = 20;
	
	  ;% IMU_heli_1_2_DW.wx_PWORK.LoggedData
	  section.data(12).logicalSrcIdx = 12;
	  section.data(12).dtTransOffset = 21;
	
	  ;% IMU_heli_1_2_DW.wy_PWORK.LoggedData
	  section.data(13).logicalSrcIdx = 13;
	  section.data(13).dtTransOffset = 22;
	
	  ;% IMU_heli_1_2_DW.wz_PWORK.LoggedData
	  section.data(14).logicalSrcIdx = 14;
	  section.data(14).dtTransOffset = 23;
	
	  ;% IMU_heli_1_2_DW.Scope_PWORK_m.LoggedData
	  section.data(15).logicalSrcIdx = 15;
	  section.data(15).dtTransOffset = 24;
	
	  ;% IMU_heli_1_2_DW.Scope_PWORK_k.LoggedData
	  section.data(16).logicalSrcIdx = 16;
	  section.data(16).dtTransOffset = 26;
	
	  ;% IMU_heli_1_2_DW.Scope_PWORK_c.LoggedData
	  section.data(17).logicalSrcIdx = 17;
	  section.data(17).dtTransOffset = 28;
	
	  ;% IMU_heli_1_2_DW.Scope_PWORK_f.LoggedData
	  section.data(18).logicalSrcIdx = 18;
	  section.data(18).dtTransOffset = 30;
	
	  ;% IMU_heli_1_2_DW.Scope_PWORK_p.LoggedData
	  section.data(19).logicalSrcIdx = 19;
	  section.data(19).dtTransOffset = 32;
	
	  ;% IMU_heli_1_2_DW.Scope_PWORK_b.LoggedData
	  section.data(20).logicalSrcIdx = 20;
	  section.data(20).dtTransOffset = 34;
	
      nTotData = nTotData + section.nData;
      dworkMap.sections(2) = section;
      clear section
      
      section.nData     = 6;
      section.data(6)  = dumData; %prealloc
      
	  ;% IMU_heli_1_2_DW.UnitDelay_DSTATE
	  section.data(1).logicalSrcIdx = 21;
	  section.data(1).dtTransOffset = 0;
	
	  ;% IMU_heli_1_2_DW.UnitDelay_DSTATE_p
	  section.data(2).logicalSrcIdx = 22;
	  section.data(2).dtTransOffset = 1;
	
	  ;% IMU_heli_1_2_DW.UnitDelay_DSTATE_m
	  section.data(3).logicalSrcIdx = 23;
	  section.data(3).dtTransOffset = 2;
	
	  ;% IMU_heli_1_2_DW.UnitDelay_DSTATE_n
	  section.data(4).logicalSrcIdx = 24;
	  section.data(4).dtTransOffset = 3;
	
	  ;% IMU_heli_1_2_DW.UnitDelay_DSTATE_g
	  section.data(5).logicalSrcIdx = 25;
	  section.data(5).dtTransOffset = 4;
	
	  ;% IMU_heli_1_2_DW.UnitDelay_DSTATE_ph
	  section.data(6).logicalSrcIdx = 26;
	  section.data(6).dtTransOffset = 5;
	
      nTotData = nTotData + section.nData;
      dworkMap.sections(3) = section;
      clear section
      
      section.nData     = 1;
      section.data(1)  = dumData; %prealloc
      
	  ;% IMU_heli_1_2_DW.Skiptonextline_SubsysRanBC
	  section.data(1).logicalSrcIdx = 27;
	  section.data(1).dtTransOffset = 0;
	
      nTotData = nTotData + section.nData;
      dworkMap.sections(4) = section;
      clear section
      
      section.nData     = 1;
      section.data(1)  = dumData; %prealloc
      
	  ;% IMU_heli_1_2_DW.StreamCall2_State
	  section.data(1).logicalSrcIdx = 28;
	  section.data(1).dtTransOffset = 0;
	
      nTotData = nTotData + section.nData;
      dworkMap.sections(5) = section;
      clear section
      
    
      ;%
      ;% Non-auto Data (dwork)
      ;%
    

    ;%
    ;% Add final counts to struct.
    ;%
    dworkMap.nTotData = nTotData;
    


  ;%
  ;% Add individual maps to base struct.
  ;%

  targMap.paramMap  = paramMap;    
  targMap.signalMap = sigMap;
  targMap.dworkMap  = dworkMap;
  
  ;%
  ;% Add checksums to base struct.
  ;%


  targMap.checksum0 = 2259396693;
  targMap.checksum1 = 1382415996;
  targMap.checksum2 = 1253414461;
  targMap.checksum3 = 1758035319;

