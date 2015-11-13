; POC NSIS installer for a fake product.

;--------------------------------
;Include Modern UI

	!include "MUI2.nsh"
	!include nsDialogs.nsh
	!include LogicLib.nsh
	!include FileFunc.nsh

	;!define MUI_ICON "SetupIcon.ico"
	!define MUI_PRODUCT "Test Product"
	!define PRODUCT_NAME "Test Product Installer"
	!define PRODUCT_PUBLISHER "Cristian Poll"
	!define PRODUCT_WEB_SITE "http://www.cristianpoll.com"	

	!define PRODUCT_VERSION "1.0.0.0"
	
	VIProductVersion "${PRODUCT_VERSION}"
	VIAddVersionKey "ProductName" "${PRODUCT_NAME}"
	VIAddVersionKey "CompanyName" "${PRODUCT_PUBLISHER}"
	VIAddVersionKey "FileVersion" "${PRODUCT_VERSION}"
	VIAddVersionKey "FileDescription" "Installs test product."
	VIAddVersionKey "ProductVersion" "${PRODUCT_VERSION}"
	
;--------------------------------
;General

  ;Name and file
  Name "Test Product Installer"
  OutFile "TestProductInstaller.exe"

  ;Auto close the installer once finished.
  AutoCloseWindow false

  ;Default installation folder
  InstallDir "$PROGRAMFILES64\${MUI_PRODUCT}"
  

  ;Request application privileges for Windows Vista
  RequestExecutionLevel user
  

  SetCompressor lzma
  
;--------------------------------
;Interface Settings

  !define MUI_ABORTWARNING

;--------------------------------
;Pages

  !insertmacro MUI_PAGE_LICENSE "${NSISDIR}\Docs\Modern UI\License.txt"
  !insertmacro MUI_PAGE_COMPONENTS
  !insertmacro MUI_PAGE_DIRECTORY
  !insertmacro MUI_PAGE_INSTFILES
  
  !insertmacro MUI_UNPAGE_CONFIRM
  !insertmacro MUI_UNPAGE_INSTFILES
  
;--------------------------------
;Languages
 
  !insertmacro MUI_LANGUAGE "English"

;--------------------------------
;Installer Sections

Section "Install Section" SecInstall

	SetOutPath $INSTDIR\Web	
	File TestProduct\file.txt
	
SectionEnd