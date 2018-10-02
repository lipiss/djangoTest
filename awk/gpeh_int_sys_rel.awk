#!/bin/nawk -f
func cpich_ecno(t) {
    if (t=="EVENT_VALUE_INVALID"){
	var=""
	}
	else { 
	var= (t/2) - 24
	}
    return var;  
}
func cpich_rscp(t) {
  if (t=="EVENT_VALUE_INVALID"){
	var=""
	}
	else { 
   var= t - 115
   }
   return var;  
  }
func rssi(t) {
    if (t=="EVENT_VALUE_INVALID"){
	var=""
	}
	else { 
   var=(t/10) -112
   }
   return var;  
  }  
func rabcomb(t) {
   gsub(/^[ \t]+/, "", t) 
   gsub(/^[ \t]+/, "", t)
   var=""
   switch (t){
     case    "1"    :         var=       "SRB (13.6/13.6)"                          ;    break
     case    "2"    :         var=       "Conv. CS speech 12.2 | type: Speech"           ;    break
     case    "3"    :         var=       "Conv. CS unkn (64/64) | type: VideoCall"       ;    break
     case    "4"    :         var=       "Interact. PS (RACH/FACH) | type: FACH"         ;    break
     case    "5"    :         var=       "Interact. PS (64/64) | type: PS-R99"           ;    break
     case    "6"    :         var=       "Interact. PS (64/128) | type: PS-R99"          ;    break
     case    "7"    :         var=       "Interact. PS (64/384) | type: PS-R99"          ;    break
     case    "8"    :         var=       "Stream. CS unkn. (57.6/57.6) | type: Stream"   ;    break
     case    "9"    :         var=       "Conv. CS speech 12.2 + Interact. PS (0/0) | type: Speech - Multirab"   ;    break
     case    "10"   :         var=       "Conv. CS speech 12.2 + Interact. PS (64/64) | type: Speech - Multirab" ;    break
     case    "11"   :         var=       "SRB (13.6/13.6), preconfigured "          ;    break
     case    "12"   :         var=       "Conv. CS speech 12.2 , preconfigured | type: Speech"    ;    break
     case    "13"   :         var=       "Stream. PS (16/64) + Interact. PS (8/8) | type: Stream" ;    break
     case    "14"   :         var=       "Conv. CS unkn (64/64) + Interact. PS (8/8) | type: VideoCall" ;    break
     case    "15"   :         var=       "Interact. PS (64/HS) | type: HS"               ;    break
     case    "16"   :         var=       "Interact. PS (384/HS) | type: HS" 				;    break
     case    "17"   :         var=       "Stream. PS (16/128) + Interact. PS (8/8) | type: Stream" ;    break
     case    "18"   :         var=       "Interact. PS (128/128) | type: PS-R99"			;    break
     case    "19"   :         var=       "Conv. CS speech 12.2 + Interact. PS (64/HS) | type: Speech - Multirab" ;    break
     case    "20"   :         var=       "Conv. CS speech 12.2 + Interact. PS (384/HS) | type: Speech - Multirab" ;    break
     case    "21"   :         var=       "Interact. PS (URA/URA) | type: URA"			 ;    break
     case    "22"   :         var=       "Stream. PS (128/16) + Interact. PS (8/8) | type: Stream" ;    break
     case    "23"   :         var=       "Conv. CS speech 12.2 + Stream. PS (128/16) + Interact. PS (8/8) | type: Speech - Multirab" ;    break
     case    "24"   :         var=       "Conv. CS speech 12.2 + Stream. PS (16/128) + Interact. PS (8/8) | type: Speech - Multirab" ;    break
     case    "25"   :         var=       "Interact. PS (EUL/HS) | type: HS" 				;    break
     case    "26"   :         var=       "2* Interact. PS (64/64) | type: R99" 			;    break
     case    "27"   :         var=       "Conv. CS speech 12.2 + 2* Interact. PS (64/64) | type: Speech - Multirab" ;    break
     case    "28"   :         var=       "Interact. PS (128/64) | type: PS-R99"			;    break
     case    "29"   :         var=       "Interact. PS (384/64) | type: PS-R99" 			;    break
     case    "30"   :         var=       "Interact. PS (384/128) | type: PS-R99" 		;    break
     case    "31"   :         var=       "Interact. PS (128/384) | type: PS-R99" 		;    break
     case    "32"   :         var=       "Interact. PS (384/384) | type: PS-R99" 		;    break
     case    "33"   :         var=       "Conv. CS speech (7.95/7.95) | type: Speech"    ;    break
     case    "34"   :         var=       "Conv. CS speech (5.9/5.9) | type: Speech"      ;    break
     case    "35"   :         var=       "Conv. CS speech (4.75/4.75) | type: Speech"    ;    break
     case    "36"   :         var=       "Conv. CS speech 12.2 + Interact. PS (64/128) | type: Speech - Multirab" ;    break
     case    "37"   :         var=       "Conv. CS speech 12.2 + Interact. PS (128/64) | type: Speech - Multirab" ;    break
     case    "38"   :         var=       "Conv. CS speech 12.2 + Interact. PS (64/384) | type: Speech - Multirab" ;    break
     case    "39"   :         var=       "2* Interact. PS (64/128) | type: R99"          ;    break
     case    "40"   :         var=       "Conv. CS Speech (12.65, 8.85, 6.60) | type: Speech" ;    break
     case    "41"   :         var=       "Conv. CS Speech (12.65, 8.85, 6.60), preconfigured | type: Speech"      ;    break
     case    "42"   :         var=       "Conv. CS Speech (12.65, 8.85, 6.60) + Interact. PS (0/0) | type: Speech - Multirab"     ;    break
     case    "43"   :         var=       "Conv. CS Speech (12.65, 8.85, 6.60) + Interact. PS (64/64) | type: Speech - Multirab"   ;    break
     case    "44"   :         var=       "Conv. CS Speech (12.65, 8.85, 6.60) + Interact. PS (64/128) | type: Speech - Multirab"  ;    break
     case    "45"   :         var=       "Conv. CS Speech (12.65, 8.85, 6.60) + Interact. PS (128/64) | type: Speech - Multirab"  ;    break
     case    "46"   :         var=       "Stream. PS (128/HS) + Interact. PS (8/HS) | type: Stream"   ;    break
     case    "47"   :         var=       "Conv. CS Speech (12.65, 8.85, 6.60) + Interact. PS (64/HS) | type: Speech - Multirab"   ;    break
     case    "48"   :         var=       "Conv. CS Speech (12.65, 8.85, 6.60) + Interact. PS (384/HS) | type: Speech - Multirab"   ;    break
     case    "49"   :         var=       "Conv. CS Speech 12.2 + Stream. PS (128/HS) + Interact. PS (8/HS) | type: Speech - Multirab" ;    break
     case    "50"   :         var=       "Conv. CS Speech (12.65, 8.85, 6.60) + Stream. PS (16/128) + Interact. PS (8/8) | type: Speech - Multirab" ;    break
     case    "51"   :         var=       "Conv. CS Speech (12.65, 8.85, 6.60) + 2*Interact. PS (64/64) | type: Speech - Multirab" ;    break
     case    "52"   :         var=       "Interact. PS (128/HS) | type: HS"    ;    break
     case    "53"   :         var=       "Interact. PS (16/HS) | type: HS"     ;    break
     case    "54"   :         var=       "2* Interact. PS (64/HS) | type: HS"  ;    break
     case    "55"   :         var=       "2* Interact. PS (128/HS) | type: HS" ;    break
     case    "56"   :         var=       "2* Interact. PS (384/HS) | type: HS" ;    break
     case    "57"   :         var=       "Conv. CS Speech 12.2 + 2* Interact. PS (64/HS) | type: Speech - Multirab"  ;    break
     case    "58"   :         var=       "Conv. CS Speech 12.2 + 2* Interact. PS (128/HS) | type: Speech - Multirab" ;    break
     case    "59"   :         var=       "Conv. CS Speech 12.2 + 2* Interact. PS (384/HS) | type: Speech - Multirab" ;    break
     case    "60"   :         var=       "Conv. CS Speech 12.2 + Interact. PS (128/HS) | type: Speech - Multirab"    ;    break
     case    "61"   :         var=       "Conv. CS Speech 12.2 + 3* Interact. PS (64/HS) | type: Speech - Multirab"  ;    break
     case    "62"   :         var=       "2* Interact. PS (EUL/HS) | type: HS" ;    break
     case    "63"   :         var=       "Stream. PS (16/HS) + 2* Interact. PS (64/HS) | type: Stream" ;    break
     case    "64"   :         var=       "Conv. CS Speech 12.2 + Stream. PS (16/HS) + 2*Interact. PS (64/HS) | type: Speech - Multirab"  ;    break
     case    "65"   :         var=       "Conv. CS Speech 12.2 + Stream. PS (128/HS) + 2*Interact. PS (64/HS) | type: Speech - Multirab" ;    break
     case    "66"   :         var=       "3* Interact. PS (64/HS) | type: HS"  ;    break
     case    "67"   :         var=       "Interact. PS (16/16) | type: PS-R99" ;    break
     case    "68"   :         var=       "Interact. PS (16/64) | type: PS-R99" ;    break
     case    "69"   :         var=       "Interact. PS (64/16) | type: PS-R99" ;    break
     case    "70"   :         var=       "Dummy | type: " ;    break
     case    "71"   :         var=       "Conv. CS Speech 12.2 + 3* Interact. PS (64/64) | type: Speech - Multirab" ;    break
     case    "72"   :         var=       "Stream. PS (16/HS) + Interact. PS (8/HS) | type: Stream" ;    break
     case    "73"   :         var=       "Stream. PS (32/HS) + Interact. PS (8/HS) | type: Stream" ;    break
     case    "74"   :         var=       "3* Interact. PS (64/64) | type: R99" ;    break
     case    "75"   :         var=       "Stream. PS (128/HS) + 2*Interact. PS (64/HS) | type: Stream" ;    break
     case    "76"   :         var=       "Conv. CS Speech 12.2 + 2* Interact. PS (128/128) | type: Speech - Multirab" ;    break
     case    "77"   :         var=       "Conv. CS Speech 12.2 + Stream. PS (16/HS) + Interact. PS (8/HS) | type: Speech - Multirab" ;    break
     case    "78"   :         var=       "Conv. CS Speech 12.2 + Stream. PS (32/HS) + Interact. PS (8/HS) | type: Speech - Multirab" ;    break
     case    "79"   :         var=       "Conv. CS speech (5.9, 4.75/5.9, 4.75) + SRB (3.4/3.4) | type: Speech" ;    break
     case    "80"   :         var=       "Conv. CS speech (5.9, 4.75/5.9, 4.75) + Interact. PS (0/0) + SRB (3.4/3.4) | type: Speech - Multirab" ;    break
     case    "94"   :         var=       "SRB (3.4/3.4) | type: " ;    break
     case    "95"   :         var=       "SRB (3.4/3.4), preconfigured | type: " ;    break
     case    "113"   :         var=      "Conv. CS Speech (12.2, 7.95, 5.9, 4.75) + Interact. PS (16/HS) | type: Speech - Multirab" ;    break
     case    "123"   :         var=      "Conv. CS Speech 12.2  + Interact. PS (EUL/HS) + SRB (3.4/3.4) | type: Speech - Multirab" ;    break
     case    "124"   :         var=      "Conv. CS Speech 12.2  + 2 * Interact. PS (EUL/HS) + SRB (3.4/3.4) | type: Speech - Multirab" ;    break
     case    "125"   :         var=      "Conv. CS Speech 12.2  + 3 *  Interact. PS (EUL/HS) + SRB (3.4/3.4) | type: Speech - Multirab" ;    break
     case    "126"   :         var=      "Conv. CS Speech (12.65, 8.85, 6.60) + Interact. PS (EUL/HS) + SRB (3.4/3.4) | type: Speech - Multirab" ;    break
     case    "127"   :         var=      "Conv. CS Speech (12.65, 8.85, 6.60) + 2* Interact. PS (EUL/HS) + SRB (3.4/3.4) | type: Speech - Multirab" ;    break
     case    "128"   :         var=      "3 *  Interact. PS (EUL/HS) | type: HS" ;    break
     case    "129"   :         var=      "Conv. CS Speech (12.65, 8.85, 6.60) + 3* Interact. PS (EUL/HS) + SRB (3.4/3.4) | type: Speech - Multirab" ;    break
     case    "144"   :         var=      "Conv. CS Speech (12.65, 8.85, 6.60) + Interact. PS (16/HS) | type: Speech - Multirab" ;    break
     case    "176"   :         var=      "Conv. CS Speech (5.9, 4.75/5.9,4.75)  +  Interact. PS (EUL/HS) + SRB (3.4/3.4) | type: Speech - Multirab" ;    break
     default: var = t   
   }
   return var;    
	
}
func checkidentity(t){

 if (t ~ /151515151515151515151515/)
 { 
 var= "(...)"
 }
 else
 { 
 var=t
 }
 return var

 }
func cause_code(t) {
   gsub(/^[ \t]+/, "", t) 
   gsub(/^[ \t]+/, "", t)
   var=""
   switch (t){
     case "0" : var="Unspecified" ; break
     case "1" : var="Radio Connection Supervision (RCS)" ; break
     case "2" : var="Congestion" ; break
     case "3" : var="Transport" ; break
     case "4" : var="O&M" ; break
     case "5" : var="Measurement control failure" ; break
     case "6" : var="Soft Handover" ; break
     case "7" : var="Inter Radio Access Technology (IRAT)" ; break
     case "8" : var="Inter-Frequency Handover (IFHO)" ; break
     case "9" : var="Channel Switching" ; break
     case "10": var="High Speed Hard Hand over" ; break
     case "11": var="CN Hard Handover" ; break
	 case "12": var="Iu User Plane Control" ; break
	 default: var = t   
   }
   return var;    
}  
func subcause_code(t, s){
   gsub(/^[ \t]+/, "", t) 
   gsub(/^[ \t]+/, "", t)
   gsub(/^[ \t]+/, "", s) 
   gsub(/^[ \t]+/, "", s)
   var=""
   aux= t "-" s
   switch (aux){
      case "0-0" : var= "Unspecified" ; break
      case "1-0" : var= "Other Radio Link Control (RLC) unrecoverable error" ; break
      case "1-1" : var= "Radio Link Control (RLC) unrecoverable error in UTRAN (maximum number of RLC retransmissions is reached)" ; break
      case "1-2" : var= "Radio Connection Supervision - expiry of timer (rcsAllRlLostTimer or rcsCchWaitCuTimer or hsDschRcLostT)" ; break
      case "1-3" : var= "Radio link failure indication leading to a release with Cause= transport" ; break
      case "1-4" : var= "Radio link failure indication leading to a release with cause other than transport" ; break
      case "2-1" : var= "Congestion action - release triggered by congestion" ; break
      case "3-0" : var= "Transport network failure – All other CELLO_AAL2NCIFAILURE" ; break
      case "3-1" : var= "Transport network failure - CELLO_AAL2NCI_TEMP_FAILURE" ; break
      case "3-2" : var= "Transport network failure - CELLO_AAL2NCI_MANAGEMENT_INDUCED" ; break
      case "3-3" : var= "Transport network failure - CELLO_AAL2NCI_OTHER_DC_IND_CAU" ; break
      case "4-1" : var= "Cell lock indication" ; break
      case "5-1" : var= "MEASUREMENT CONTROL FAILURE that triggers a connection release - intra-frequency" ; break
      case "5-2" : var= "MEASUREMENT CONTROL FAILURE that triggers a connection release - inter-radio access technology" ; break
      case "5-3" : var= "MEASUREMENT CONTROL FAILURE that triggers a connection release - inter-frequency" ; break
      case "5-4" : var= "MEASUREMENT CONTROL FAILURE that triggers a connection release -traffic volume measurement setup" ; break
      case "6-0" : var= "Other Handover Evaluation failure reasons: (_UNSPECIFIED_RELEASE_CAUSE, _BUFFER_TIME_EXCEEDED,_CELL_SYNC_INFO_NOTAVAILABLE)" ; break
      case "6-1" : var= "Active SetUpdate complete message not received -addition" ; break
      case "6-2" : var= "Active SetUpdate complete message not received -deletion" ; break
      case "6-3" : var= "Active SetUpdate complete message not received -replacement" ; break
      case "6-4" : var= "Handover Evaluation release events - _EVENT_BUFFER_EXCEEDED" ; break
      case "6-5" : var= "Due to Release ConnOffset (for a cell not in the neighbor set)" ; break
      case "6-6" : var= "High Speed-Downlink Shared Channel (HSDSCH) Cell Change failure after A-DCH removal" ; break
      case "7-1" : var= "IRAT outgoing failure - TimerT_reloc_overall expires" ; break
      case "7-2" : var= "Cell change outgoing failure TimerT_cellchange expires" ; break
      case "8-1" : var= "IFHO failure - reception of PHYSICAL CHANNEL RECONFIGURATION FAILURE with cause other than physical channel failure received from the UE on the source frequency" ; break
      case "8-2" : var= "IFHO failure- at expiry of timer Timer RRC T-PCR" ; break
      case "8-3" : var= "IFHO failure - if ciphering is ongoing, and if RBs mapped on TM-RLC entities have been established, and if a PHYSICAL CHANNEL RECONFIGURATION COMPLETE message is received that does not include one or both of the IEs COUNT-C activation time and Uplink counter synchronization info" ; break
      case "9-1" : var= "Transition to a DCH connection has been initiated but can not be completed" ; break
      case "10-1": var= "selection of HS-DSCH connection, including a Hard HO has been initiated, but can not be completed" ; break
      case "11-1": var= "TimeRelocoverall (MO: Handover) expires." ; break
      case "11-2": var= "Relocation preparation procedure fails in source RNC due to either of the following: RELOCATION PREPARATION FAILURE received, timeRelocPrep (MO:Handover) expires, ERROR INDICATION with procedure code (Relocation Preparation)" ; break
      case "12-1": var= "CN Triggered Initialisation Failure" ; break
      default: var = t 
   }
   return var;    
}    
func exclass(t){
   gsub(/^[ \t]+/, "", t) 
   gsub(/^[ \t]+/, "", t)
   var=""
   #print t
   switch (t){
	case "0" :  var= "PROCEDURE_EXECUTION_SUCCESSFUL" ; break
    case "1" :  var= "RN_DL_RESOURCE_AVAILABILITY" ; break
    case "2" :  var= "RN_UL_RESOURCE_AVAILABILITY" ; break
    case "3" :  var= "RN_DL_CAPABILITY" ; break
    case "4" :  var= "RN_UL_CAPABILITY" ; break
    case "5" :  var= "TN_NODE_RESOURCE_AVAILABILITY" ; break
    case "6" :  var= "TN_FAILURE" ; break
    case "7" :  var= "IUB_INTERFACE_NBAP_PROTOCOL_AREA" ; break
    case "8" :  var= "IUR_INTERFACE_RNSAP_PROTOCOL_AREA" ; break
    case "9" :  var= "UU_INTERFACE_RRC_PROTOCOL_AREA" ; break
    case "10":  var= "NODE_INTERNAL_FAILURE" ; break
    case "11":  var= "REDIRECTION_FEATURES" ; break
    case "12":  var= "PROCEDURE_EXECUTION_INTERRUPT" ; break
    case "13":  var= "IU_INTERFACE_RANAP_PROTOCOL_AREA" ; break
    case "14":  var= "IU_INTERFACE_USER_PLANE_PROTOCOL_AREA" ; break
    case "15":  var= "UU_INTERFACE_USER_PLANE_PROTOCOL_AREA" ; break
    case "16":  var= "SYSTEM_CONNECTION_TERMINATION" ; break
    default: var = t 
   }
   #print var
   return var;    
}
func causevalue(t){
   gsub(/^[ \t]+/, "", t) 
   gsub(/^[ \t]+/, "", t)
   var=""
   #print t
   switch (t){
      case "0"	: var= "CAUSE_VALUE_NOT_APPLICABLE" ; break
      case "1"	: var= "REQUESTED_REQUEST_TYPE_NOT_SUPPORTED" ; break
      case "2"	: var= "NODE_RESOURCE_NOT_AVAILABLE_1" ; break
      case "3"	: var= "ASYNCHRONOUS_FORCED_CONNECTION_RELEASE" ; break
      case "4"	: var= "NODE_INTERNAL_FAILURE_1" ; break
      case "5"	: var= "CELL_UPDATE_FAILURE" ; break
      case "6"	: var= "IP_TRANSPORT_BEARER_FAILURE" ; break
      case "7"	: var= "NODE_INTERNAL_FAILURE_2" ; break
      case "8"	: var= "NO_OF_SIMULTANEOUS_RL_IN_COMPRESSED_MODE_ADMISSION_LIMIT_EXCEEDED" ; break
      case "9"	: var= "PILOT_CONFIGURATION_NOT_SUPPORTED" ; break
      case "10"	: var= "EDCH_NOT_SUPPORTED" ; break
      case "11"	: var= "CONFIGURATION_NOT_SUPPORTED" ; break
      case "12"	: var= "NODE_RESOURCE_NOT_AVAILABLE_2" ; break
      case "13"	: var= "ADMISSION_LIMIT_FOR_ASE_EXCEEDED" ; break
      case "14"	: var= "CELL_CONGESTION" ; break
      case "15"	: var= "CHANNELIZATION_CODE_ALLOCATION_FAILURE" ; break
      case "16"	: var= "ADMISSION_LIMIT_FOR_CHANNELIZATION_CODE_EXCEEDED" ; break
      case "17"	: var= "NO_OF_SIMULTANEOUS_RL_ON_HS_ADMISSION_LIMIT_EXCEEDED" ; break
      case "18"	: var= "ADMISSION_LIMIT_FOR_DL_CARRIER_POWER_EXCEEDED" ; break
      case "19"	: var= "ADMISSION_LIMIT_FOR_RBS_HW_EXCEEDED" ; break
      case "20"	: var= "RADIO_RESOURCES_NOT_AVAILABLE_ON_EXTERNAL_NODE" ; break
      case "21"	: var= "NO_OF_SIMULTANEOUS_RL_ON_SF16_EXCEEDED_1" ; break
      case "22"	: var= "NO_OF_SIMULTANEOUS_RL_ON_SF16_EXCEEDED_2" ; break
      case "23"	: var= "NO_OF_SIMULTANEOUS_RL_ON_SF32_EXCEEDED" ; break
      case "24"	: var= "NO_OF_SIMULTANEOUS_RL_ON_SF8_EXCEEDED" ; break
      case "25"	: var= "DIRECTED_RETRY_CAUSE" ; break
      case "26"	: var= "EXTERNAL_PROTOCOL_ENCODING_FAILURE" ; break
      case "27"	: var= "ADM_LIMIT_FOR_IUB_GBR_BANDWIDTH_EXCEEDED" ; break
      case "28"	: var= "HRNTI_ALLOCATION_REJECTED_IN_SECONDARY_SERV_HS_DSCH_CELL" ; break
      case "29"	: var= "MULTI_CELL_OPERATION_NOT_AVAILABLE" ; break
      case "30"	: var= "MULTI_CELL_OPERATION_NOT_SUPPORTED" ; break
      case "31"	: var= "CAPABILITY_RELATED_HARDHANDOVER_FAILED" ; break
      case "32"	: var= "FDPCH_NOT_SUPPORTED" ; break
      case "33"	: var= "FDPCH_SLOT_FORMAT_OPERATION_NOT_SUPPORTED" ; break
      case "34"	: var= "NOT_USED" ; break
      case "35"	: var= "NOT_USED" ; break
      case "36"	: var= "IU_AAL2_SETUP_FAILURE" ; break
      case "37"	: var= "NODE_RESOURCE_NOT_AVAILABLE_3" ; break
      case "38"	: var= "IUB_AAL2_SETUP_FAILURE_LOCAL" ; break
      case "39"	: var= "IUB_AAL2_SETUP_FAILURE_REMOTE" ; break
      case "40"	: var= "NODE_RESOURCE_NOT_AVAILABLE_4" ; break
      case "41"	: var= "IUC_INITIALIZATION_FAILURE" ; break
      case "42"	: var= "NODE_RESOURCE_NOT_AVAILABLE_5" ; break
      case "43"	: var= "RN_LOAD_SHARING_CAUSE" ; break
      case "44"	: var= "OTHER_FAILURE" ; break
      case "45"	: var= "INFORMATION_PROVISIONING_NOT_SUPPORTED_FOR_THE_OBJECT" ; break
      case "46"	: var= "ADMISSION_LIMIT_FOR_DL_CODE_POWER_EXCEEDED" ; break
      case "47"	: var= "GENERAL_FAILURE_IN_PROCEDURE" ; break
      case "48"	: var= "LOGICAL_ERROR_IN_MESSAGE" ; break
      case "49"	: var= "PROCEDURE_TIMEOUT" ; break
      case "50"	: var= "NODE_RESOURCE_NOT_AVAILABLE_6" ; break
      case "51"	: var= "NODE_RESOURCE_NOT_AVAILABLE_7" ; break
      case "52"	: var= "NODE_INTERNAL_FAILURE_2" ; break
      case "53"	: var= "NODE_INTERNAL_FAILURE_3" ; break
      case "54"	: var= "IUB_AAL2_SETUP_FAILURE" ; break
      case "55"	: var= "AAL2_FAILURE" ; break
      case "56"	: var= "REQUESTED_CONFIGURATION_NOT_SUPPORTED" ; break
      case "57"	: var= "NODE_INTERNAL_FAILURE_4" ; break
      case "58"	: var= "NOT_USED" ; break
      case "59"	: var= "NOT_USED" ; break
      case "60"	: var= "NOT_USED" ; break
      case "61"	: var= "NO_OF_SIMULTANEOUS_RL_ON_EUL_2MS_TTI_SERVING_ADMISSION_LIMIT_EXCEEDED" ; break
      case "62"	: var= "NO_OF_SIMULTANEOUS_RL_ON_EUL_SERVING_ADMISSION_LIMIT_EXCEEDED" ; break
      case "63"	: var= "NODE_INTERNAL_FAILURE_5" ; break
      case "64"	: var= "NOT_USED" ; break
      case "65"	: var= "NOT_USED" ; break
      case "66"	: var= "NOT_USED" ; break
      case "67"	: var= "NO_OF_SIMULTANEOUS_RL_ON_SF8_EXCEEDED_FOR_GUARANTEED_SERVICE_CLASS" ; break
      case "68"	: var= "NODE_RESOURCE_NOT_AVAILABLE_8" ; break
      case "69"	: var= "NODE_INTERNAL_FAILURE_6" ; break
      case "70"	: var= "NOT_USED" ; break
      case "71"	: var= "NOT_USED" ; break
      case "72"	: var= "MIMO_NOT_AVAILABLE" ; break
      case "73"	: var= "HSDSCH_PDU_SIZE_FORMAT_NOT_SUPPORTED" ; break
      case "74"	: var= "NOT_USED" ; break
      case "75"	: var= "CONT_PACKET_CONN_DTX_DRX_OPERATION_NOT_AVAILABLE" ; break
      case "76"	: var= "CONT_PACKET_CONN_UE_DTX_CYCLE_NOT_AVAILABLE" ; break
      case "77"	: var= "CONT_PACKET_CONN_DTX_DRX_OPERATION_NOT_SUPPORTED" ; break
      case "78"	: var= "NO_OF_SIMULTANEOUS_RL_ON_SF4_EXCEEDED" ; break
      case "79"	: var= "NOT_USED" ; break
      case "80"	: var= "NO_OF_SIMULTANEOUS_RL_ON_EUL_NON_SERVING_ADMISSION_LIMIT_EXCEEDED" ; break
      case "81"	: var= "UNISAAL_CONGESTION" ; break
      case "82"	: var= "CELL_DEACTIVATED" ; break
      case "83"	: var= "NODE_RESOURCES_NOT_AVAILABLE_ON_EXTERNAL_NODE" ; break
      case "84"	: var= "NODE_RESOURCE_NOT_AVAILABLE_9" ; break
      case "85"	: var= "URA_UPDATE_FAILURE" ; break
      case "86"	: var= "REQUIRED_RBS_ACTION_NOT_SUPPORTED" ; break
      case "87"	: var= "NOT_USED" ; break
      case "88"	: var= "RAB_MAPPING_FAILURE" ; break
      case "89"	: var= "PHYSICAL_CHANNEL_FAILURE" ; break
      case "90"	: var= "CONFIGURATION_UNACCEPTABLE" ; break
      case "91"	: var= "SF_NOT_SUPPORTED_ON_EXTERNAL_NODE" ; break
      case "92"	: var= "SCTP_CONGESTION" ; break
      case "93"	: var= "NODE_RESOURCE_NOT_AVAILABLE_10" ; break
      case "94"	: var= "NODE_RESOURCE_NOT_AVAILABLE_11" ; break
      case "95"	: var= "NODE_INTERNAL_FAILURE_7" ; break
      case "96"	: var= "NODE_RESOURCE_NOT_AVAILABLE_12" ; break
      case "97"	: var= "IUR_AAL2_SETUP_FAILURE_REMOTE" ; break
      case "98"	: var= "IUR_AAL2_SETUP_FAILURE_LOCAL" ; break
      case "99"	: var= "NODE_RESOURCE_NOT_AVAILABLE_13" ; break
      case "100": var= "NOT_USED" ; break
      case "101": var= "NODE_INTERNAL_FAILURE_8" ; break
      case "102": var= "NOT_USED" ; break
      case "103": var= "NODE_RESOURCE_NOT_AVAILABLE_14" ; break
      case "104": var= "NODE_INTERNAL_FAILURE_9" ; break
      case "105": var= "NODE_INTERNAL_FAILURE_10" ; break
      case "106": var= "NODE_INTERNAL_FAILURE_11" ; break
      case "107": var= "NODE_INTERNAL_FAILURE_12" ; break
      case "108": var= "NOT_USED" ; break
      case "109": var= "NODE_INTERNAL_FAILURE_13" ; break
      case "110": var= "NODE_INTERNAL_FAILURE_14" ; break
      case "111": var= "NODE_INTERNAL_FAILURE_15" ; break
      case "112": var= "PROCEDURE_EXECUTION_TERMINATED_EXTERNAL" ; break
      case "113": var= "NOT_USED" ; break
      case "114": var= "NODE_INTERNAL_FAILURE_16" ; break
      case "115": var= "NODE_INTERNAL_FAILURE_17" ; break
      case "116": var= "CELL_UPDATE_IN_DRNC" ; break
      case "117": var= "CN_DOMAIN_NOT_AVAILABLE" ; break
      case "118": var= "FAILURE_WITH_TRANSPORT_LAYER_CAUSE" ; break
      case "119": var= "FAILURE_WITH_CAUSE_OTHER_THAN_TANSPORT_LAYER_CAUSE" ; break
      case "120": var= "EXPIRY_OF_RCS_TIMER" ; break
      case "121": var= "CELL_LOCK_INDICATION" ; break
      case "122": var= "MEASUREMENT_CONTROL_RELEATED_FAILURE" ; break
      case "123": var= "HANDOVER_EVALUATION_FAILURE" ; break
    default: var = t 
   }
   #print var
   return var;    
}
func extcausevalue(t){
   gsub(/^[ \t]+/, "", t) 
   gsub(/^[ \t]+/, "", t)
   var=""
   #print t
   switch (t){
       case "0"  : var= "EXTENDED_CAUSE_VALUE_NOT_APPLICABLE" ; break
       case "1"  : var= "ERROR_INDICATION" ; break
       case "2"  : var= "RL_SETUP_PROCEDURE" ; break
       case "3"  : var= "RL_RECONFIGURATION_PROCEDURE" ; break
       case "4"  : var= "RADIO_LINK_RECONFIGURATION_PREPARE_FAILURE" ; break
       case "5"  : var= "RADIO_LINK_RECONFIGURATION_PREPARE" ; break
       case "6"  : var= "RADIO_LINK_SETUP_FAILURE" ; break
       case "7"  : var= "RADIO_LINK_SETUP" ; break
       case "8"  : var= "COMMON_CHANNEL_TRANSPORT_RESOURCE_FAILURE" ; break
       case "9"  : var= "COMMON_CHANNEL_TRANSPORT_RESOURCE" ; break
       case "10" : var= "IP_TERMINATION_POINT_SETUP_FAILURE" ; break
       case "11" : var= "IP_TERMINATION_POINT_MODIFICATION_FAILURE" ; break
       case "12" : var= "NOT_USED" ; break
       case "13" : var= "NOT_USED" ; break
       case "14" : var= "NOT_USED" ; break
       case "15" : var= "NOT_USED" ; break
       case "16" : var= "NO_FACH_DCH_HS_USERS_LICENSE_LIMIT_EXCEEDED" ; break
       case "17" : var= "RADIO_BEARER_RECONFIGURATION_FAILURE" ; break
       case "18" : var= "RADIO_BEARER_RELEASE_FAILURE" ; break
       case "19" : var= "RADIO_BEARER_SETUP_FAILURE" ; break
       case "20" : var= "TRANSPORT_CHANNEL_RECONFIGURATION_FAILURE" ; break
       case "21" : var= "NODE_RESOURCE_NOT_AVAILABLE_1" ; break
       case "22" : var= "MISCELLANEOUS_INTERNAL_1" ; break
       case "23" : var= "MESSAGE_NOT_RECOGNIZED" ; break
       case "24" : var= "NODE_RESOURCE_NOT_AVAILABLE_2" ; break
       case "25" : var= "NODE_INTERNAL_FAILURE_1" ; break
       case "26" : var= "NODE_RESOURCE_NOT_AVAILABLE_3" ; break
       case "27" : var= "RADIO_BEARER_RECONFIGURATION_RESPONSE" ; break
       case "28" : var= "RADIO_BEARER_SETUP_RESPONSE" ; break
       case "29" : var= "RADIO_BEARER_RELEASE_RESPONSE" ; break
       case "30" : var= "TRANSPORT_CHANNEL_CONFIGURATION_FAILURE" ; break
       case "31" : var= "RAB_ESTABLISHMENT_SEQUENCE_1" ; break
       case "32" : var= "RAB_ESTABLISHMENT_SEQUENCE_2" ; break
       case "33" : var= "CHANNEL_SWITCH_SEQUENCE_1" ; break
       case "34" : var= "RAB_RELEASE_SEQUENCE_1" ; break
       case "35" : var= "RAB_RELEASE_SEQUENCE_2" ; break
       case "36" : var= "NODE_RESOURCE_NOT_AVAILABLE_4" ; break
       case "37" : var= "NODE_RESOURCE_NOT_AVAILABLE_5" ; break
       case "38" : var= "NODE_INTERNAL_FAILURE_2" ; break
       case "39" : var= "CHANNEL_SWITCH_SEQUENCE_2" ; break
       case "40" : var= "NODE_RESOURCE_NOT_AVAILABLE_6" ; break
       case "41" : var= "NODE_RESOURCE_NOT_AVAILABLE_7" ; break
       case "42" : var= "MISCELLANEOUS_INTERNAL_2" ; break
       case "43" : var= "RLC_FAILURE" ; break
       case "44" : var= "NODE_INTERNAL_FAILURE_3" ; break
       case "45" : var= "RADIO_LINK_RESTORE_INDICATION_TIMEOUT" ; break
       case "46" : var= "URA_NOT_DEFINED" ; break
       case "47" : var= "PHYSICAL_CHANNEL_RECONFIGURATION_SEQUENCE" ; break
       case "48" : var= "CONDITION_VIOLATION_FOR_SDU_PARAMETERS" ; break
       case "49" : var= "NODE_INTERNAL_FAILURE_4" ; break
       case "50" : var= "NODE_INTERNAL_FAILURE_5" ; break
       case "51" : var= "NODE_INTERNAL_FAILURE_6" ; break
       case "52" : var= "NODE_INTERNAL_FAILURE_7" ; break
       case "53" : var= "NODE_INTERNAL_FAILURE_8" ; break
       case "54" : var= "USER_PLANE_VERSION_NOT_SUPPORTED" ; break
       case "55" : var= "PHYSICAL_CHANNEL_RECONFIGURATION" ; break
       case "56" : var= "NODE_INTERNAL_FAILURE_9" ; break
       case "57" : var= "UL_GUARANTEED_BIT_RATE_NOT_AVAILABLE" ; break
       case "58" : var= "DL_MAXIMUM_BIT_RATE_NOT_AVAILABLE" ; break
       case "59" : var= "UL_MAXIMUM_BIT_RATE_NOT_AVAILABLE" ; break
       case "60" : var= "DL_GUARANTEED_BIT_RATE_NOT_AVAILABLE" ; break
       case "61" : var= "RAB_ASSIGNMENT_REQUEST" ; break
       case "62" : var= "RELOCATION_SEQUENCE_T_RELOC_PREP" ; break
       case "63" : var= "RELOCATION_PREPARATION_FAILURE" ; break
       case "64" : var= "PHYSICAL_CHANNEL_RECONFIGURATION_FAILURE" ; break
       case "65" : var= "HANDOVER_FROM_UTRAN_FAILURE" ; break
       case "66" : var= "INTER_FREQUENCY_HANDOVER_SEQUENCE" ; break
       case "67" : var= "RNC_UNABLE_TO_ESTABLISH_ALL_RFCS" ; break
       case "68" : var= "ACTIVE_SET_UPDATE_SEQUENCE" ; break
       case "69" : var= "RL_ADDITION_FAILURE" ; break
       case "70" : var= "CELL_CHANGE_ORDER_FROM_UTRAN_FAILURE" ; break
       case "71" : var= "CELL_CHANGE_ORDER_FROM_UTRAN_TIME_OUT" ; break
       case "72" : var= "REQUESTED_TRANSFER_DELAY_NOT_ACHIEVEABLE" ; break
       case "73" : var= "GUARANTEED_BIT_RATE_NOT_AVAILABLE" ; break
       case "74" : var= "UE_CAPABILITY_NOT_SUFFICIENT" ; break
       case "75" : var= "NODE_INTERNAL_FAILURE_10" ; break
       case "76" : var= "RAB_COMBINATION_MATCHING" ; break
       case "77" : var= "TARGET_CONFIGURATION_SELECTION_FAILURE_2" ; break
       case "78" : var= "FEATURE_NOT_AVAILABLE" ; break
       case "79" : var= "NODE_BLOCKING" ; break
       case "80" : var= "TN_BLOCKING" ; break
       case "81" : var= "RADIO_LINK_ADDITION_RESPONSE" ; break
       case "82" : var= "RADIO_LINK_ADDITION_PROCEDURE" ; break
       case "83" : var= "RADIO_LINK_RESTORE_INDICATION" ; break
       case "84" : var= "NODE_INTERNAL_FAILURE_11" ; break
       case "85" : var= "NODE_RESOURCE_NOT_AVAILABLE_8" ; break
       case "86" : var= "ACTIVE_SET_UPDATE_FAILURE" ; break
       case "87" : var= "NODE_RESOURCE_NOT_AVAILABLE_9" ; break
       case "88" : var= "RELOCATION_REQUIRED_PROCEDURE" ; break
       case "89" : var= "RELOCATION_COMMAND" ; break
       case "90" : var= "RELOCATION_SEQUENCE_T_RELOC_OVERALL" ; break
       case "91" : var= "IU_RELEASE_COMMAND" ; break
       case "92" : var= "SERVICE_RESTRICTED" ; break
       case "93" : var= "CNHHO_IU_PS_RELEASE_TIME_OUT" ; break
       case "94" : var= "HS_CELL_CHANGE_SEQUENCE" ; break
       case "95" : var= "RADIO_LINK_FAILURE_INDICATION" ; break
       case "96" : var= "RELOCATION_SEQUENCE_T_RELOC_SUP" ; break
       case "97" : var= "UTRAN_MOBILITY_INFORMATION_SEQUENCE_TIME_OUT" ; break
       case "98" : var= "UTRAN_MOBILITY_INFORMATION_FAILURE" ; break
       case "99" : var= "DISCONNECT_INDICATION" ; break
       case "100": var= "RRC_CONNECTION_REQUEST" ; break
       case "101": var= "NODE_RESOURCE_NOT_AVAILABLE_10" ; break
       case "102": var= "NODE_INTERNAL_FAILURE_12" ; break
       case "103": var= "NODE_INTERNAL_FAILURE_13" ; break
       case "104": var= "INITIAL_UE_MESSAGE" ; break
       case "105": var= "INITIAL_DIRECT_TRANSFER" ; break
       case "106": var= "TEMPORARY_FAILURE" ; break
       case "107": var= "OM_INITIATED" ; break
       case "108": var= "OTHER_DISCONNECT_INDICATION_CAUSE" ; break
       case "109": var= "CM_ACTIVATION_DEACTIVATION_INTERFREQUENCY" ; break
       case "110": var= "CM_ACTIVATION_DEACTIVATION_INTER_RAT" ; break
       case "111": var= "EVENT1X_ACTIVATION_DEACTIVATION" ; break
       case "112": var= "EVENT_BUFFER_EXCEED" ; break
       case "113": var= "RELEASECONNOFFSET_EXCEEDED_FOR_NON_NEIGHBOUR_CELL" ; break
       case "114": var= "HSDSCH_CELL_CHANGE_FAILURE_AFTER_ADCH_REMOVAL" ; break
      default: var = t 
   }
   #print var
   return var;    
}
func cnranapcause(t) {
   gsub(/^[ \t]+/, "", t) 
   gsub(/^[ \t]+/, "", t)
   var=""
   switch (t){
     case "1" :  var= "rab-pre-empted "  ; break
     case "2" :  var= "trelocoverall-expiry "  ; break
     case "3" :  var= "trelocprep-expiry "  ; break
     case "4" :  var= "treloccomplete-expiry "  ; break
     case "5" :  var= "tqueing-expiry "  ; break
     case "6" :  var= "relocation-triggered "  ; break
     case "7" :  var= "trellocalloc-expiry"  ; break
     case "8" :  var= "unable-to-establish-during-relocation "  ; break
     case "9" :  var= "unknown-target-rnc "  ; break
     case "10" :  var= "relocation-cancelled "  ; break
     case "11" :  var= "successful-relocation "  ; break
     case "12" :  var= "requested-ciphering-and-or-integrity-protection-algorithms-not-supported "  ; break
     case "13" :  var= "conflict-with-already-existing-integrity-protection-and-or-ciphering-information "  ; break
     case "14" :  var= "failure-in-the-radio-interface-procedure "  ; break
     case "15" :  var= "release-due-to-utran-generated-reason "  ; break
     case "16" :  var= "user-inactivity "  ; break
     case "17" :  var= "time-critical-relocation "  ; break
     case "18" :  var= "requested-traffic-class-not-available "  ; break
     case "19" :  var= "invalid-rab-parameters-value "  ; break
     case "20" :  var= "requested-maximum-bit-rate-not-available "  ; break
     case "21" :  var= "requested-guaranteed-bit-rate-not-available "  ; break
     case "22" :  var= "requested-transfer-delay-not-achievable "  ; break
     case "23" :  var= "invalid-rab-parameters-combination "  ; break
     case "24" :  var= "condition-violation-for-sdu-parameters "  ; break
     case "25" :  var= "condition-violation-for-traffic-handling-priority "  ; break
     case "26" :  var= "condition-violation-for-guaranteed-bit-rate "  ; break
     case "27" :  var= "user-plane-versions-not-supported "  ; break
     case "28" :  var= "iu-up-failure "  ; break
     case "29" :  var= "relocation-failure-in-target-CN-RNC-or-target-system"  ; break
     case "30" :  var= "invalid-RAB-ID "  ; break
     case "31" :  var= "no-remaining-rab "  ; break
     case "32" :  var= "interaction-with-other-procedure "  ; break
     case "33" :  var= "requested-maximum-bit-rate-for-dl-not-available "  ; break
     case "34" :  var= "requested-maximum-bit-rate-for-ul-not-available "  ; break
     case "35" :  var= "requested-guaranteed-bit-rate-for-dl-not-available "  ; break
     case "36" :  var= "requested-guaranteed-bit-rate-for-ul-not-available "  ; break
     case "37" :  var= "repeated-integrity-checking-failure "  ; break
     case "38" :  var= "requested-request-type-not-supported "  ; break
     case "39" :  var= "request-superseded "  ; break
     case "40" :  var= "release-due-to-UE-generated-signalling-connection-release "  ; break
     case "41" :  var= "resource-optimisation-relocation "  ; break
     case "42" :  var= "requested-information-not-available "  ; break
     case "43" :  var= "relocation-desirable-for-radio-reasons "  ; break
     case "44" :  var= "relocation-not-supported-in-target-RNC-or-target-system "  ; break
     case "45" :  var= "directed-retry "  ; break
     case "46" :  var= "radio-connection-with-UE-Lost "  ; break
     case "47" :  var= "rNC-unable-to-establish-all-RFCs "  ; break
     case "48" :  var= "deciphering-keys-not-available"  ; break
     case "49" :  var= "dedicated-assistance-data-not-available"  ; break
     case "50" :  var= "relocation-target-not-allowed "  ; break
     case "51" :  var= "location-reporting-congestion "  ; break
     case "52" :  var= "reduce-load-in-serving-cell "  ; break
     case "53" :  var= "no-radio-resources-available-in-target-cell "  ; break
     case "54" :  var= "gERAN-Iumode-failure "  ; break
     case "55" :  var= "access-restricted-due-to-shared-networks "  ; break
     case "56" :  var= "incoming-relocation-not-supported-due-to-PUESBINE-feature "  ; break
     case "57" :  var= "traffic-load-in-the-target-cell-higher-than-in-the-source-cell "  ; break
     case "58" :  var= "mBMS-no-multicast-service-for-this-UE"  ; break
     case "59" :  var= "mBMS-unknown-UE-ID"  ; break
     case "60" :  var= "successful-MBMS-session-start-no-data-bearer-necessary"  ; break
     case "61" :  var= "mBMS-superseded-due-to-NNSF"  ; break
     case "62" :  var= "mBMS-UE-linking-already-done"  ; break
     case "63" :  var= "mBMS-UE-de-linking-failure-no-existing-UE-linking"  ; break
     case "64" :  var= "tMGI-unknown"  ; break
     case "113" :  var= "O&M Intervention"  ; break
     case "114" :  var= "No Resource Available"  ; break
     case "115" :  var= "Unspecified Failure"  ; break
	 default: var = t   
   }
   return var;    
}   

 
BEGIN {FS="\t"; OFS=";"
 
print "hour ; min ; sec ; mils ; EVENT ;  UE_CONTEXT ; RNC_MODULE ; CELL ; RNC ; IMSI/nas ; IMEI ; C_ID_2 ; RNC_ID_2 ; SOURCE_CONF ; TARGET_CONF ; RAN_DISCONNECTION_CODE ; CAUSECODE ; RAN_DISCONNECTION_SUBCODE ; SUBCAUSECODE ; SCRAMBLING_CODE_CELL_1 ; SCRAMBLING_CODE_CELL_2 ; CPICH_EC_NO_CELL_1 ; RSCP_CELL_1 ; UL_INT_CELL1 ; UL_INT_CELL2 ; WANTED_CONF ; EXCEPTION_CLASS ; EXCEPTION_CLASS_DESC ; CAUSE_VALUE ;  CAUSE_VALUE_DESC ; EXTENDED_CAUSE_VALUE ; EXTENDED_CAUSE_VALUE_DESC ; CN_RANAP_CAUSE ; CN_RANAP_CAUSE_DESC " 

} 

/INTERNAL_SYSTEM_RELEASE/{ 
srch= "EVENT_VALUE_INVALID"
repl= "" 
TIME= $3                               ; split($3, t , " ")   ;   gsub(/^[ \t]+/, "", t[2]) ;  gsub(/^[ \t]+/, "", t[2])
hour= t[2]                                                    ;   gsub(/^[ \t]+/, "", t[4]) ;  gsub(/^[ \t]+/, "", t[4])
min= t[4]                                                     ;   gsub(/^[ \t]+/, "", t[6]) ;  gsub(/^[ \t]+/, "", t[6])
sec= t[6]                                                     ;   gsub(/^[ \t]+/, "", t[8]) ;  gsub(/^[ \t]+/, "", t[8])
mils= t[8]                             ; split($5, c , ":")   ;   gsub(/^[ \t]+/, "", c[2]) ;  gsub(/^[ \t]+/, "", c[2])
NAME1= c[2]                            ; split($6, c , ":")   ;   gsub(/^[ \t]+/, "", c[2]) ;  gsub(/^[ \t]+/, "", c[2])  ; sub(srch,repl,c[2])
UE_CONTEXT1= c[2]                      ; split($7, c , ":")   ;   gsub(/^[ \t]+/, "", c[2]) ;  gsub(/^[ \t]+/, "", c[2])  ; sub(srch,repl,c[2])
RNC_MODULE1= c[2]                      ; split($8, c , ":")   ;   gsub(/^[ \t]+/, "", c[2]) ;  gsub(/^[ \t]+/, "", c[2])  ; sub(srch,repl,c[2])
CELL1= c[2]                            ; split($9, c , ":")   ;   gsub(/^[ \t]+/, "", c[2]) ;  gsub(/^[ \t]+/, "", c[2])  ; sub(srch,repl,c[2])
RNC1= c[2]                             ; split($10, c , ":")  ;   gsub(/^[ \t]+/, "", c[2]) ;  gsub(/^[ \t]+/, "", c[2])  ; sub(srch,repl,c[2])
C_ID_2= c[2] 				           ; split($11, c , ":")  ;   gsub(/^[ \t]+/, "", c[2]) ;  gsub(/^[ \t]+/, "", c[2])  ; sub(srch,repl,c[2])
RNC_ID_2= c[2]      			       ; split($16, c , ":")  ;   gsub(/^[ \t]+/, "", c[2]) ;  gsub(/^[ \t]+/, "", c[2])  ; sub(srch,repl,c[2])
IMSI= checkidentity(c[2]) 		       ; split($17, c , ":")  ;   gsub(/^[ \t]+/, "", c[2]) ;  gsub(/^[ \t]+/, "", c[2])  ; sub(srch,repl,c[2])
SOURCE_CONF= rabcomb(c[2]) 		       ; split($18, c , ":")  ;   gsub(/^[ \t]+/, "", c[2]) ;  gsub(/^[ \t]+/, "", c[2])  ; sub(srch,repl,c[2])
TARGET_CONF= rabcomb(c[2]) 		       ; split($20, c , ":")  ;   gsub(/^[ \t]+/, "", c[2]) ;  gsub(/^[ \t]+/, "", c[2])  ; sub(srch,repl,c[2])
RAN_DISCONNECTION_CODE= c[2]           ; split($21, c , ":")  ;   gsub(/^[ \t]+/, "", c[2]) ;  gsub(/^[ \t]+/, "", c[2])  ; sub(srch,repl,c[2])
RAN_DISCONNECTION_SUBCODE= c[2]        ; split($23, c , ":")  ;   gsub(/^[ \t]+/, "", c[2]) ;  gsub(/^[ \t]+/, "", c[2])  ; sub(srch,repl,c[2])
SCRAMBLING_CODE_CELL_1= c[2] 	       ; split($24, c , ":")  ;   gsub(/^[ \t]+/, "", c[2]) ;  gsub(/^[ \t]+/, "", c[2])  ; sub(srch,repl,c[2])
SCRAMBLING_CODE_CELL_2= c[2]           ; split($27, c , ":")  ;   gsub(/^[ \t]+/, "", c[2]) ;  gsub(/^[ \t]+/, "", c[2])  
CPICH_EC_NO_CELL_1= cpich_ecno(c[2])   ; split($31, c , ":")  ;   gsub(/^[ \t]+/, "", c[2]) ;  gsub(/^[ \t]+/, "", c[2])  
RSCP_CELL_1= cpich_rscp(c[2])          ; split($38, c , ":")  ;   gsub(/^[ \t]+/, "", c[2]) ;  gsub(/^[ \t]+/, "", c[2])  
UL_INT_CELL1= rssi(c[2])   	           ; split($39, c , ":")  ;   gsub(/^[ \t]+/, "", c[2]) ;  gsub(/^[ \t]+/, "", c[2])  
UL_INT_CELL2= rssi(c[2])   	           ; split($49, c , ":")  ;   gsub(/^[ \t]+/, "", c[2]) ;  gsub(/^[ \t]+/, "", c[2])  ; sub(srch,repl,c[2])
WANTED_CONF= rabcomb(c[2]) 	           ; split($53, c , ":")  ;   gsub(/^[ \t]+/, "", c[2]) ;  gsub(/^[ \t]+/, "", c[2])  ; sub(srch,repl,c[2])
EXCEPTION_CLASS= c[2] 		           ; split($54, c , ":")  ;   gsub(/^[ \t]+/, "", c[2]) ;  gsub(/^[ \t]+/, "", c[2])  ; sub(srch,repl,c[2])
CAUSE_VALUE= c[2] 			           ; split($55, c , ":")  ;   gsub(/^[ \t]+/, "", c[2]) ;  gsub(/^[ \t]+/, "", c[2])  ; sub(srch,repl,c[2])
EXTENDED_CAUSE_VALUE= c[2] 	           ; split($57, c , ":")  ;   gsub(/^[ \t]+/, "", c[2]) ;  gsub(/^[ \t]+/, "", c[2])  ; sub(srch,repl,c[2])
CN_RANAP_CAUSE= c[2] 		           ; split($68, c , ":")  ;  gsub(/^[ \t]+/, "" , c[2]) ;  gsub(/^[ \t]+/, "", c[2])  ; sub(srch,repl,c[2])
IMEI= checkidentity(c[2])
CAUSECODE= cause_code(RAN_DISCONNECTION_CODE)
SUBCAUSECODE= subcause_code(RAN_DISCONNECTION_CODE, RAN_DISCONNECTION_SUBCODE)
EXCEPTION_CLASS_DESC= exclass(EXCEPTION_CLASS)
CAUSE_VALUE_DESC= causevalue(CAUSE_VALUE)
EXTENDED_CAUSE_VALUE_DESC= extcausevalue(EXTENDED_CAUSE_VALUE)
CN_RANAP_CAUSE_DESC= cnranapcause(CN_RANAP_CAUSE)

print hour ";" min ";" sec ";" mils ";" NAME1 ";" UE_CONTEXT1";"  RNC_MODULE1 ";" CELL1 ";" RNC1 ";"  IMSI ";" IMEI ";"C_ID_2 ";" RNC_ID_2 ";" SOURCE_CONF ";" TARGET_CONF ";"  RAN_DISCONNECTION_CODE ";" CAUSECODE ";" RAN_DISCONNECTION_SUBCODE ";" SUBCAUSECODE ";" SCRAMBLING_CODE_CELL_1 ";" SCRAMBLING_CODE_CELL_2 ";" CPICH_EC_NO_CELL_1 ";" RSCP_CELL_1 ";" UL_INT_CELL1 ";" UL_INT_CELL2 ";" WANTED_CONF ";" EXCEPTION_CLASS ";" EXCEPTION_CLASS_DESC ";" CAUSE_VALUE ";" CAUSE_VALUE_DESC ";" EXTENDED_CAUSE_VALUE ";"  EXTENDED_CAUSE_VALUE_DESC  ";" CN_RANAP_CAUSE ";" CN_RANAP_CAUSE_DESC
 
}

 	