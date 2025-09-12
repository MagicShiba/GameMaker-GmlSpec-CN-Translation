@echo off
title 使用汉化文件
setlocal enabledelayedexpansion
set t_bb1=0 月度版 
set t_bb2=1 beta版
set t_bb3=2 恢复英文

set t_bbe=输入错误  请重新输入
set t_bbc=你选择了:
set filep=target\GmlSpec.xml
if not exist %filep% (
	echo ！不要乱动文件！
	echo ！将要退出！
	ping 127.0.0.1 /n 3 >nul
	exit
)

echo .    
echo .    羽毛函数提示汉化
echo .
echo .    注意:只会应用到最新版
echo .    你也可以手动复制到其它版本
echo .
echo .    选择应用到:
echo .    %t_bb1% %t_bb2%
: xz
set bb=""
set /p bb= .    
if %bb% == 0 (
	set rtmp=C:\ProgramData\GameMakerStudio2\Cache\runtimes\
) else if %bb% == 1 (
	set rtmp=C:\ProgramData\GameMakerStudio2-Beta\Cache\runtimes\
) else (
	echo .    %t_bbe%
	goto :xz
)
::else if %bb% == 2 (
::	echo .    %t_bb3%
::	set thyp=%~dp0target
::)
echo . 
echo .    %t_bbc% %bb%
echo .    

set thyp=%~dp0target\
echo 汉化文件路径: %thyp%GmlSpec.xml
cd /d %rtmp%
FOR /D %%i IN (*) DO (
	set b=!var:%%i!
	set b=!b:~11,15!
	set b=!b:.=!
	if !b! GTR !new! (
		set new=!b!
		set rnt=%%i
	)
)
cd /d %thyp%
set thmb=%rtmp%%rnt%\%GmlSpec.xml
echo 替换目标路径: %thmb%
echo .    

copy GmlSpec.xml %thmb%

echo .
echo .
echo .   自动退出
ping 127.0.0.1 /n 4 >nul
