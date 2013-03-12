/*****************************************************************************/
/*                                                                           */
/*                  --- CAEN SpA - Computing Division ---                    */
/*                                                                           */
/*   CAEN HV Wrapper Library Rel. 3.10 Installation and Use Instructions     */
/*									  									     */
/*   July    2010	                 				     					 */
/*                                                                           */
/*****************************************************************************/
  
 This archive contains the last release of the CAEN HV Wrapper Library and the
 corresponding Release Notes.

 The complete documentation can be found in the CAEN HV Wrapper Library Manual
 available once installed the Library or on CAEN's Web Site 
 at www.caen.it.


 Content of the archive
 ----------------------

 CAENUVWrapperReadme.txt        :  This file
 CAENHVWrapperReleaseNotes.txt  :  Release Notes of the last software release
 Makefile 	         		    :  makefile for library installation and demo 
                                   program
 
 Lib/
  libcaenhvwrapper.so.3.10    :  executable of the library
  hscaenetlib.so.1.7          :  executable of the HSCAENETLib library to 
                                 control A303A and A1303 simultaneously
  
 Doc/
  CAENHVWrapper.pdf 	      :  user's manual of the library
 
 include/
  CAENHVWrapper.h             :  include file for use of the library
  caenhvoslib.h		    	  :  accessory include file
 
 HVWrapperDemo/               :  directory with sources/executable of the demo 
                                 program 
 


 System Requirements
 -------------------
 
 - Network Interface Card + TCP/IP protocol (to control SY 1527/ SY 2527)
 - A303A/A1303 H.S. CAENET Controller Card (to control  N 470, N 570 and N568)
 - Linux kernel 2.4 or 2.6 with gnu C/C++ compiler


 Installation notes
 ------------------

 1. It's necessary to login as root
 
 2. execute: make install
 
 The installation copies and installs the library in /usr/lib, compiles the demo 
 program and installs it in the work directory.
 To use the demo program, change to the demo program directory and launch the
 application typing ./HVWrappdemo.
   

 Note:
 -----
 Control of CAEN Power Supplies via CaeNet link requires the correct
 installation of the A303 and/or A1303 device driver. 
 Control of CAEN VME Power Supplies via USB/OpticalLink requires the correct
 installation of the USB/A2818 device driver. 

