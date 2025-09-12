@echo off
title 复制原始文件
setlocal enabledelayedexpansion

set filep=source\GmlSpec.xml
set rtmp=C:\ProgramData\GameMakerStudio2-Beta\Cache\runtimes\

set thyp=%~dp0source\
echo 路径: %thyp%GmlSpec.xml
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
echo 原始路径: %thmb%
echo .    

copy %thmb% GmlSpec.xml

echo .
echo .
echo .   自动退出
ping 127.0.0.1 /n 4 >nul
