

;This is for finding all windows of a certain program

SetTitleMatchMode 2

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;                            ;
; Start Function Definitions ;
;                            ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

SpecsPlace() ; DEFINE Used in !+b
	{
		WinActivate Google Chrome
		Send ^4
		Sleep 100
		Send ^l
		Sleep 10
		Send ^f
		Sleep 1500
		Send User Defined Data
		Sleep 100
		Send {esc}
		Sleep 10
		Send {enter}
		Sleep 100
		Send User Defined Data
		Sleep 100
		Send {esc}
		Sleep 10
		Loop 7
			{
				Send {tab}
			}
		Sleep 100
		Send ^a
	}

ImageIterator(func_SKU, func_folder, func_title, func_year) ; DEFINE Used in !+e (Image add script)
	{
		Loop, read, \\DELLSERVER\mzoo\Web Pics\%func_folder%\%func_SKU%_pix
			{
				Loop, parse, A_LoopReadLine, %A_Tab%
				{        
					ImageCursorPlace()
					If func_year != 15
						{
							StringSplit, folder_output, func_folder, `\
							new_folder = %folder_output2%
							Send /images/%new_folder%/%A_LoopField%
							
						}
					If func_year = 15
						{
							Send /images/%func_folder%/%A_LoopField%
						}
					Send {tab}{tab}
					Sleep 10
					Send % func_title
					Send {tab}{enter}
					Sleep 1000
				}
			}
	}
	
MetaDescPlace() ; DEFINE Used in !+d (Description script)
	{
		WinActivate Google Chrome
		Send ^4
		Sleep 100
		Send ^l
		Sleep 10
		Send ^f
		Sleep 1500
		Send User Defined Data
		Sleep 100
		Send {esc}
		Sleep 10
		Send {enter}
		Sleep 100
		Send User Defined Data
		Sleep 100
		Send {esc}
		Sleep 10
		Loop 5
			{
				Send {tab}
			}
		Sleep 100
		Send ^a
	}


DescriptionBoxPlace() ; DEFINE Used in !+d (Description script)
	{
		WinActivate Google Chrome
		Send ^4
		Sleep 100
		Send ^l
		Sleep 10
		Send ^f
		Sleep 1500
		Send User Defined Data
		Sleep 100
		Send {esc}
		Sleep 10
		Loop 21
			{
				Send {tab}
			}
		Sleep 100
		Send ^a
	}

TitleMove() ; DEFINE Used multiple times
	{
		Send ^l
		Sleep 100
		Send ^f
		Sleep 100
		Send General
		Sleep 100
		Send {esc}
		Sleep 10
		Send {enter}
		Sleep 100
		Send ^l
		Sleep 10
		Send ^f
		Sleep 1000
		Send User Defined Data
		Sleep 100
		Send {esc}
		Sleep 10
		Loop 4
			{
				Send {tab}
			}
		Sleep 100
	}

FolderCopyNew(func_SKU) ; DEFINE Used in !+e
	{
		clipboard =
		WinActivate, ahk_class mintty
		Send export SKU_input=%func_SKU%{enter}
		Send /cygdrive/c/Users/JSanders/Documents/bash_scripts/folder_locator.sh{enter}
		ClipWait
	}

PathCopy(func_SKU, func_folder) ; DEFINE Used in !+e
	{
		clipboard =
		WinActivate, ahk_class mintty
		Send export SKU_input=%func_SKU%{enter}
		Send export folder=%func_folder%{enter}
		Send /cygdrive/c/Users/JSanders/Documents/bash_scripts/path_getter.sh{enter}
		ClipWait
	}
	
PathCopyArchive(func_SKU, func_folder) ; DEFINE Used in !+e
	{
		clipboard =
		WinActivate, ahk_class mintty
		Send export SKU_input=%func_SKU%{enter}
		Send export folder=%func_folder%{enter}
		Send /cygdrive/c/Users/JSanders/Documents/bash_scripts/path_getter_archive.sh{enter}
		ClipWait
	}

PathCopyAmp(func_SKU, func_folder) ; DEFINE Used in !+e
	{
		clipboard =
		WinActivate, ahk_class mintty
		Send export SKU_input=%func_SKU%{enter}
		Send export folder=%func_folder%{enter}
		Send /cygdrive/c/Users/JSanders/Documents/bash_scripts/path_getter_amp.sh{enter}
		ClipWait
	}
	
PathCopyArchiveAmp(func_SKU, func_folder) ; DEFINE Used in !+e
	{
		clipboard =
		WinActivate, ahk_class mintty
		Send export SKU_input=%func_SKU%{enter}
		Send export folder=%func_folder%{enter}
		Send /cygdrive/c/Users/JSanders/Documents/bash_scripts/path_getter_archive_amp.sh{enter}
		ClipWait
	}

ImageCursorPlace() ; DEFINE Used in multiple, ImageIterator function
	{
		Sleep 100
		Send ^f
		Sleep 1500
		Send Images
		Sleep 100
		Send {esc}{enter}
		Sleep 100
		Send ^l
		Sleep 100
		Loop 4
			{
				Send +{Tab}
			}
	}	

pix_paste(pic, title) ; DEFINE Not Used 7-27
	{
		Send % pic
		Send {tab}{tab}
		Sleep 10
		Send % title
		Sleep 10
		Send {tab}{enter}
		Sleep 1000
	}

SearchBoxPlace() ; DEFINE Not Used 7-27
	{
		WinActivate Google Chrome
		Send ^4
		Sleep 100
		Send ^f
		Sleep 100
		Send Product Definition
		Sleep 100
		Send {esc}
		Sleep 100
		Loop 2 ;triple check this number - 12/6 This should be good
			{
				Send +{tab}
			}
		Send %SKU_input%
		Send {Enter}
	}
	
SearchBoxPlace_1(func_SKU) ; DEFINE Used in multiple
	{
		WinActivate Google Chrome
		Send ^4
		Sleep 100
		Send ^l
		Sleep 10
		Send ^f
		Sleep 100
		Send Product Definition
		Sleep 100
		Send {esc}
		Sleep 100
		Loop 2 ;triple check this number - 12/6 This should be good
			{
				Send +{tab}
			}
		Send ^a
		Send %func_SKU%	
		Send {Enter}
	}

	
TemplateMove() ; DEFINE Used in !+f
	{
		Sleep 100
		Send ^f
		Sleep 1500
		Send User Defined Data
		Sleep 100
		Send {esc}
		Sleep 10
		Loop 20
			{
				Send {tab}
			}
		Sleep 100
	}

WeightAndDimensions() ; DEFINE Used in !+i (only part of both)
	{
		Sleep 100
		Send ^f
		Sleep 1500
		Send User Defined Data
		Sleep 100
		Send {esc}
		Sleep 10
		Loop 12
			{
				Send {tab}
			}
		Sleep 100
		Send 22
		Loop 4
			{
				Send {tab}
			}
		Sleep 100
		Send 44{tab}16{tab}6
		Sleep 100
		Loop 4
			{
				Send {tab}
			}
		Sleep 250
		Send {enter}
	}
	
WeightAndDimensionsStrap() ; DEFINE Used in !+w
	{
		Sleep 100
		Send ^f
		Sleep 1500
		Send User Defined Data
		Sleep 100
		Send {esc}
		Sleep 10
		Loop 12
			{
				Send {tab}
			}
		Sleep 100
		Send 0.80
		Loop 4
			{
				Send {tab}
			}
		Sleep 100
		Send 6{tab}4{tab}6{tab}{tab}
		Sleep 100
		Send PDGCommTemplates/Sample-Item-nothumbs.html
		Loop 2
			{
				Send {tab}
			}
		Sleep 250
		Send {enter}
	}	

WeightAndDimensionsStool() ; DEFINE Not used 7-27
	{
		Sleep 100
		Send ^f
		Sleep 1500
		Send User Defined Data
		Sleep 100
		Send {esc}
		Sleep 10
		Loop 12
			{
				Send {tab}
			}
		Sleep 100
		Send 15
		Loop 4
			{
				Send {tab}
			}
		Sleep 100
		Send 4{tab}14{tab}6{tab}{tab}
		Sleep 100
		Send PDGCommTemplates/Sample-Item-nothumbs.html
		Loop 2
			{
				Send {tab}
			}
		Sleep 250
		Send {enter}
	}
	
VendorUpdate(func_sku) ; DEFINE Not used 7-27
	{
		Send ^f
		Sleep 10
		Send ^a
		Sleep 10
		Send %func_sku%
		Sleep 3500
		Loop 5
			{
				Send {tab}
			}
		Send {enter}
		Sleep 4000
		Loop 13
			{
				Send {tab}
			}
		Sleep 10
		Send Consignment GTR Store		
		Sleep 10
		Loop 27
			{
				Send {tab}
			}
		Sleep 100
		MsgBox, 1, Abort?, Last Chance to Abort
			IfMsgBox Cancel
				return
		Send {enter}
	}


;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;                          ;
; End Function Definitions ;
;                          ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	

; Alt Shift D
; Description/List Paster

!+d::
InputBox SKU_input, SKU, SKU
InputBox date, Date, Date
clipboard =
;
WinActivate, ahk_class mintty
Send export SKU_input=%SKU_input%{enter}
Send export date=%date%{enter}
Send source /cygdrive/c/Users/JSanders/Documents/bash_scripts/description_getter.sh{enter}
Send source /cygdrive/c/Users/JSanders/Documents/bash_scripts/list_getter.sh{enter}
Send echo $SKU_title | tr -d '\n' > /dev/clipboard{enter}
ClipWait
SKU_title = %clipboard%
clipboard =
Send echo $SKU_desc | tr -d '\n' > /dev/clipboard{enter}
ClipWait
SKU_desc = %clipboard%
clipboard =
Send echo $SKU_keyword | tr -d '\n' > /dev/clipboard{enter}
ClipWait
SKU_keyword = %clipboard%
;
clipboard =
Send echo "$SKU_list" > /dev/clipboard{enter}
ClipWait
SKU_list = %clipboard%
;

SearchBoxPlace_1(SKU_input)
Sleep 3000
TitleMove()
Sleep 1000
;
Send %SKU_title%
Sleep 10
Send {tab}
Send %SKU_keyword%
;
DescriptionBoxPlace()
clipboard = %SKU_desc%
ClipWait
Send ^v
Sleep 10
Send {tab}
Sleep 250
Send {enter}
Sleep 1500
MetaDescPlace()
clipboard = %SKU_desc%
ClipWait
Send ^v
Sleep 10
;
;
Send {tab}{tab}
Sleep 10
clipboard = %SKU_list%
ClipWait
Send ^v
;
;
Loop 4
	{
		Send {tab}
	}
Sleep 250
Send {enter}
return

; Alt Shift E
; Image Paster

!+e::

;================PLEASE READ BEFORE STARTING==================

;Your Tabs in Chrome need to be the following:
;Posting Doc = Tab Number 3
;PDG = Tab Number 4
;Make sure you have Cygwin installed, along with the necessary packages



MsgBox, 1, WARNING, MAKE SURE YOU HAVE YOUR TABS IN CHROME SET UP PROPERLY. IF YOU ARE NOT ME THIS COULD BE A PROBLEM FOR YOU
	IfMsgBox Cancel
		return

InputBox SKU_type, Type, Enter 1 for Guitar - 2 for Amp ;This sets a variable for pasting the appropriate extensions into the pix boxes
InputBox SKU_input, SKU, Enter SKU

FolderCopyNew(SKU_input)
folder = %clipboard%
StringSplit, SKU_dates, folder, `-
SKU_year =  %SKU_dates3%

;This opens Cygwin and gets the file path through bash commands

clipboard =
WinActivate, ahk_class mintty

;This sets separate variables for UNIX and Windows file system structures

If SKU_year != 15
	{
		winfolder= 20%SKU_year% Archive\%folder%
		folder = 20%SKU_year%\ Archive/%folder%
	}

Sleep 100

If SKU_type = 1
	{
		PathCopy(SKU_input, folder)
		Send /cygdrive/c/Users/JSanders/Documents/bash_scripts/pic_list_getter.sh{enter}
	}
If SKU_type = 2
	{
		PathCopyAmp(SKU_input, folder)
		Send /cygdrive/c/Users/JSanders/Documents/bash_scripts/pic_list_getter_amp.sh{enter}
	}

ClipWait

pix_path = %clipboard%

MsgBox, 1, Check, %pix_path% Correct? ;Check the path to ensure things don't explode
	IfMsgBox Cancel
		Return

;DONE This selects Chrome, moves to the PDG Tab, moves to the location box and puts the SKU in the Product search box and hits enter

WinActivate Google Chrome

SearchBoxPlace_1(SKU_input)

;DONE - cursor in first image box
;
;
;This is a remarkable amount of absolute garbage code, fix this you dolt.
;


;Sets the file names


pix_1 = %pix_path%_1.jpg
pixfull = %pix_path%full.jpg
pix_800 = %pix_path%_800.jpg
pix_250 = %pix_path%_250.jpg

TitleMove()
Send ^a^c
SKU_title = %clipboard%
ClipWait
clipboard = 



Sleep 10

if SKU_type = 1
	{
		ImageCursorPlace()

		Send %pix_1%
		Send {tab}
		Sleep 10
		Send %pixfull%
		Sleep 100
		Send {tab}
		Sleep 100
		Send {tab}{enter}
		Sleep 1000
		
	
		If SKU_year != 15
			{
				folder = %winfolder%
			}
		
		ImageIterator(SKU_input, folder, SKU_title, SKU_year)
	}

if SKU_type = 2
	{
		ImageCursorPlace()

		Send %pix_800%
		Send {tab}
		Sleep 10
		Send %pix_250%
		Send {tab}
		Sleep 100
		Send {tab}{enter}
		Sleep 1000
		
		If SKU_year != 15
			{
				folder = %winfolder%
			}
		

		ImageIterator(SKU_input, folder, SKU_title, SKU_year)
		
	}


return

; Alt Shift P
; POS Live

;Pastes "Live" in the website field of POS

!+p::
InputBox SKU_input, SKU
WinActivate QuickBooks
Send ^f
Sleep 10
Send ^a
Sleep 10

Send %SKU_input%
Sleep 3500
Loop 5
	{
		Send {tab}
	}
Send {enter}
Sleep 4000
Loop 21
	{
		Send {tab}
	}
Sleep 10
Send Live
MsgBox, 1, Abort?, Last Chance to Abort
	IfMsgBox Cancel
		return
Sleep 10
Loop 19
	{
		Send {tab}
	}
Sleep 10
Send {enter}
return

; Alt Shift S
; Puts S at end of words

!+s::
Send ^{right}^{right}{left}s
return

; Alt Shift K
; Checks if SKU in list is on site

!+k::
WinActivate Google Chrome

Loop, read, C:\Users\JSanders\Documents\sku_check.txt
{
    Loop, parse, A_LoopReadLine, %A_Tab%
    {        
		Send ^l
		Send mz{space}
		Send %A_LoopField%{enter}
		Sleep 300
		MsgBox, 1, Abort?, On the site?
			IfMsgBox Cancel
				return
		Sleep 250
	}
}
return

;;;;;;;;;;;;;;;;;
;
; Non-Regular scripts with possible uses are below
;
;;;;;;;;;;;;;;;;;

; Alt Shift F
; Updates PDG template from list

!+f::
Loop, read, C:\Users\JSanders\Documents\fender_custom_template_update.txt
{
    Loop, parse, A_LoopReadLine, %A_Tab%
    {
        SearchBoxPlace_1(A_LoopField)
		MsgBox %A_LoopField%
		TemplateMove()
		Send PDGCommTemplates/type6.html
		Send {tab}{tab}
		Sleep 10
		MsgBox, 1, Abort?, Is the template correct?
			IfMsgBox Cancel
				return
		Sleep 250
		Send {enter}
		Sleep 1000
	}
}
return

; Alt Shift R
; Adds "2014" and "2014s specs" to SKUs title and keywords from list


!+r::
Loop, read, C:\Users\JSanders\Documents\taylor_400_series.txt
{
    Loop, parse, A_LoopReadLine, %A_Tab%
    {
        SearchBoxPlace_1(A_LoopField)
		MsgBox %A_LoopField%
		TitleMove()
		Send {home}
		Sleep 10
		Send 2014{space}
		Send {tab}
		Sleep 10
		Send {home}
		Sleep 10
		Send 2014s{space}spec{space}
		Sleep 10
		Loop 17
			{
				Send {tab}
			}
		MsgBox, 1, Abort?, Is the year correct?
			IfMsgBox Cancel
				return
		Sleep 250
		Send {enter}
		Sleep 1000
	}
}
return

; Alt Shift M
; Updates SKU pictures from list of SKUs, preset folder

!+m::
WinActivate Google Chrome

Loop, read, C:\Users\JSanders\Documents\Curt_Mangan\Upload\SKU_list
{
    Loop, parse, A_LoopReadLine, %A_Tab%
    {        
		StringSplit, output, A_LoopField, `_
		SKU_input := output1
		MsgBox, 1, Abort?, %SKU_input% is the current SKU
			IfMsgBox Cancel
				return
		SearchBoxPlace_1(SKU_input)
		Sleep 1000
		ImageCursorPlace()
		Loop 3
			{
				Send +{tab}
			}
		Send {enter}
		Sleep 1000
		;MsgBox, 1, Abort?, Pic should be gone
		;	IfMsgBox Cancel
		;		return
		ImageCursorPlace()
		Send /images/2-12-15/%A_LoopField%
		Send {tab}
		Sleep 10
		Send /images/2-12-15/%A_LoopField%
		Send {end}
		Loop 4
			{
				Send {left}
			}
		Send {backspace}
		Send full
		Send {tab}{tab}{enter}
		Sleep 250	
	}
}

return

; Alt Shift I
; Puts the weight and dimensions in guitar/bass listings

!+i::
WeightAndDimensions()
return

; Note: From now on whenever you run AutoHotkey directly, this script
; will be loaded.  So feel free to customize it to suit your needs.

; Please read the QUICK-START TUTORIAL near the top of the help file.
; It explains how to perform common automation tasks such as sending
; keystrokes and mouse clicks.  It also explains more about hotkeys.

