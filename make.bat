@echo off
:: Options ====================================================================
:: 'pdf5' is PDF (LuaTeX)
set PDF=pdf5

:: I tried a bunch of stuff with %PATH%, but nothing seemed to work.  We need
:: to change to the Lyx directory before running the command
set LYX_FOLDER="C:\Program Files (x86)\LyX 2.2\bin"

:: These are the extention-less filename that we'll convert from lyx to pdf
set FILENAMES=absolute-beginner-py3 absolute-beginner-py3-21c
:: ============================================================================

if not exist %LYX_FOLDER% GOTO NOLYXFOLDER

set start=%time%

echo WARNING: Lyx takes multiple minutes per PDF
echo ===========================================
echo.

echo Creating absolute-beginner-py3-21c.lyx
python make_21c_windows.py quiet
echo ...done
echo.

set DELETED=
FOR %%F in (%FILENAMES%) DO (
    if exist %%F.pdf (
        echo Deleting %%F.pdf
        del %%F.pdf
        set DELETED=1
    )
)
if [%DELETED%] == [1] (
    echo ...done
    echo.
)

pushd %LYX_FOLDER%
FOR %%F in (%FILENAMES%) DO (
    echo Creating %%F.pdf
    lyx --export %PDF% "%~dp0%%F.lyx"
    echo ...done
)
popd

echo All done!

:: StackOverflow FTW! https://stackoverflow.com/a/6209392
set end=%time%
set options="tokens=1-4 delims=:.,"
for /f %options% %%a in ("%start%") do set start_h=%%a&set /a start_m=100%%b %% 100&set /a start_s=100%%c %% 100&set /a start_ms=100%%d %% 100
for /f %options% %%a in ("%end%") do set end_h=%%a&set /a end_m=100%%b %% 100&set /a end_s=100%%c %% 100&set /a end_ms=100%%d %% 100

set /a hours=%end_h%-%start_h%
set /a mins=%end_m%-%start_m%
set /a secs=%end_s%-%start_s%
set /a ms=%end_ms%-%start_ms%
if %ms% lss 0 set /a secs = %secs% - 1 & set /a ms = 100%ms%
if %secs% lss 0 set /a mins = %mins% - 1 & set /a secs = 60%secs%
if %mins% lss 0 set /a hours = %hours% - 1 & set /a mins = 60%mins%
if %hours% lss 0 set /a hours = 24%hours%
if 1%ms% lss 100 set ms=0%ms%

echo Converstion took %mins%m %secs%s
goto END

:NOLYXFOLDER
echo ERROR: I could not find the Lyx folder: %LYX_FOLDER%
echo Install Lyx, or modify this batch file with the appropriate path.
goto END

:END
