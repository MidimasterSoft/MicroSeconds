# MicroSeconds in BitzMax    Version 1.1    2024-11-07
Enables micro-seconds exactness in BlitzMax and BlitzMax NG

This is Public domain
 
Author: Midimaster-Software

Web: www.midimaster.de

GitHub: https://github.com/MidimasterSoft 


# Functions

## Now:Long()
returns a timestamp in Microseconds
 
.
## SleepUntil(MicroTime:Long)  
sleeps until the current time MicroTime is reached

.
## GetDelta:Long() 
returns the MicroSeconds since last GetDelta()-Call

.
## UDelay(MicroSeconds:Int)
pauses for n MicroSeconds

.
# Detailed Functions Description

## Now:Long()
returns a timestamp in Microseconds (1000000 equals 1sec) since the computer has started
		
Example:

    WhatsTheTime:Long = MicroTimer.Now()
    PRINT "time is : " + WhatsTheTime ```



## Function SleepUntil(MicroTime:Long)
sleeps until the current time MicroTime is reached

Example:
     
    local Later:Long = MicroTimer.Now()+500   ' +0.5msec
    ' do some code....
    PRINT "hello"
    MicroTimer.SleepUntil(Later)              ' now wait


## Function GetDelta:Long()
returns the MicroSeconds since last GetDelta()-Call

Example:

    MicroTimer.GetDelta()    ' reset
    ' now lets check the performace of this code lines....
    For i=0 to 999
       PRINT "hello"
    Next
    PRINT "code needed " + MicroTimer.GetDelta() + "microseconds"
		

	
## Function UDelay(MicroSeconds:Int)
pauses for n MicroSeconds
   
Example:
		
    For i=0 to 9
       PRINT "hello"
       MicroTimer.UDelay(50)   ' pauses for 0.05msec
    Next




	


