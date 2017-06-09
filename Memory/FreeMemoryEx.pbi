﻿;   Description: Extends PB-FreeMemory so that it also nulls the address variable
;        Author: Sicro
;          Date: 2017-06-09
;            OS: Windows, Linux, Mac
; English-Forum: Not in the forum
;  French-Forum: Not in the forum
;  German-Forum: Not in the forum
; -----------------------------------------------------------------------------

Procedure _FreeMemory(*Memory)

  FreeMemory(PeekI(*Memory))
  PokeI(*Memory, 0)

EndProcedure

Macro FreeMemory(Memory)
  _FreeMemory(@Memory)
EndMacro

;-Example
CompilerIf #PB_Compiler_IsMainFile

  Define *Memory = AllocateMemory(1024)
  If *Memory = 0
    Debug "Error: AllocateMemory()"
    End
  EndIf
  
  Debug "Memory: " + *Memory
  Debug "---------------------"
  Debug "Free Memory"
  FreeMemory(*Memory)
  Debug "---------------------"
  Debug "Memory: " + *Memory

CompilerEndIf