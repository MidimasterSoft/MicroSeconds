' Micro-seconds in BitzMax    Version 1.1    2024-11-07
' Public domain,  Author: Midimaster-Software www.midimaster.de    https://github.com/MidimasterSoft 
'
SuperStrict 
Print MicroTimer.Now()


Type MicroTimer
	' enables micro-second access in BlitzMax
	'
	' Functions
	' ---------------------------------------------------------------------------------
	'     Now:Long()                  returns a timestamp in Microseconds
	'
	'     SleepUntil(MicroTime:Long)  sleeps until the current time MicroTime is reached
	'
	'     GetDelta:Long()             returns the MicroSeconds since last GetDelta()-Call
	'
	'     UDelay(MicroSeconds:Int)     pauses for n MicroSeconds
	'
	' -------------------------------------------------------------------------------
	Global FREQUENCE:Long=0
	Global Last:Long=0

	
	Function Now:Long()
		' PUBLIC:
		' returns a timestamp in Microseconds (1000000 equals 1sec)
		'         since the computer has started
		'
		'         example:
		'         ******************************************
		'            WhatsTheTime:Long = MicroTimer.Now()
		'            PRINT "time is : " + WhatsTheTime
		'         ******************************************
		'
		Local locNow:Long = 0
		If FREQUENCE = 0
			If Not QueryPerformanceFrequency(Varptr(FREQUENCE)) End
		EndIf
		QueryPerformanceCounter(Varptr(locNow))
		locNow = locNow*1000000/FREQUENCE
		Return locNow
	End Function



	Function SleepUntil(MicroTime:Long)
		' PUBLIC:
		' sleeps until the current time MicroTime is reached
		'
		'         example:
		'         ******************************************
		'            local Later:Long = MicroTimer.Now()+500   ' +0.5msec
		'            ' do some code....
		'            PRINT "hello"
		'            MicroTimer.SleepUntil(Later)              ' now wait
		'         ****************************************** 
		'
		While Now() < MicroTime
			If Now()< MicroTime-1000
				Delay 1
			EndIf
		Wend	
	End Function


	Function GetDelta:Long()
		' PUBLIC:
		' returns the MicroSeconds since last GetDelta()-Call
		'
		'         example:
		'         ******************************************
		'            MicroTimer.GetDelta()    ' reset
		'            ' now lets check the performace of this code lines....
		'            For i=0 to 999
		'                PRINT "hello"
		'            Next
		'            PRINT "code needed " + MicroTimer.GetDelta() + "microseconds"
		'         ******************************************
		' 
		Local locNow:Long = now()
		Local Delta:Long  = locNow-Last
		Last = locNow
		Return Delta
	End Function

	
	Function UDelay(MicroSeconds:Int)
		' PUBLIC:
		' pauses for n MicroSeconds
		'
		'         example:
		'         ******************************************
		'            For i=0 to 9
		'                PRINT "hello"
		'                MicroTimer.UDelay(50)   ' pauses for 0.05msec
		'            Next
		'         ******************************************
		' 
		Local locNow:Long = now() + MicroSeconds
		SleepUntil locNow	
	End Function
End Type 	

Extern "win32"
   		Function QueryPerformanceCounter:Int(out:Long Ptr)   = "WINBOOL QueryPerformanceCounter (LARGE_INTEGER *)"
   		Function QueryPerformanceFrequency:Int(out:Long Ptr) = "WINBOOL QueryPerformanceFrequency (LARGE_INTEGER *)"
End Extern
