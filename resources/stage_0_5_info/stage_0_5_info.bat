:: Purpost:         Sub-script containing all commands for gathering information about the system prior to running any cleaning functions
:: Author:          Blake M. Sisco ( blake.sisco at gmail ) 

@echo off

::::::::::::::::::::
:: PREP AND CHECKS::
::::::::::::::::::::
set STAGE_0_5_SCRIPT_VERSION=1.0.0
set STAGE_0_5_SCRITP_DATE=2018-03-30

:: Check for standalone vs Tron execution and build the environment if running in standalone mode
if /i "%LOGFILE%"=="" (
    pushd "%~dp0"
    pushd ..
    
    :: Load the settings file
    call functions\tron_settings.bat
    
    :: Initialize the runtime environment
    call functions\initialize_environment.bat
)


:::::::::::::::::::::
:: STAGE 0.5: INFO ::
:::::::::::::::::::::

call functions\log_with_date.bat "  stage_0_5_info begin..."

:: JOB: Gather browser history
call functions\log_with_date.bat "  Gather browser history..."
title Tron v%TRON_VERSION% [stage_0_5_info] [browser_history]
stage_0_5_info\browsinghistoryview\browsinghistoryview.exe /cfg "stage_0_5_info\browsinghistory\browsinghistoryview.cfg" /stext "%INFO_LOGS%\browser_history.txt"
call functions\log_with_date.bat "  Done."

:: JOB: Get Last Activity Log
title Tron v%TRON_VERSION% [stage_0_5_info] [last_activity_view]
call functions\log_with_date.bat "  Gather last activity log..."
stage_0_5_info\lastactivityview\lastactivityview.exe /stext "%INFO_LOGS%\last_activity_view.txt"
)

:: Stage Complete
call functions\log_with_date.bat "  stage_0_5_info complete."
