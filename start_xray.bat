@echo off
setlocal enabledelayedexpansion
title Xray 配置切换器

:LIST_FILES
cls
echo ==========================================
echo       请选择要加载的 JSON 配置文件
echo ==========================================
echo.

set count=0
:: 遍历 config 目录下的所有 json 文件
for %%f in (config\*.json) do (
    set /a count+=1
    set "file!count!=%%f"
    echo [!count!] %%~nxf
)

if %count%==0 (
    echo [错误] config 目录下没有找到任何 JSON 文件。
    pause
    exit /b
)

echo.
set /p choice="请输入序号并按回车 (或输入 Q 退出): "

if /i "%choice%"=="Q" exit /b

:: 验证输入是否为有效数字
if not defined file%choice% (
    echo.
    echo [错误] 无效的选择，请重新输入。
    timeout /t 2 >nul
    goto LIST_FILES
)

set "selected_config=!file%choice%!"

:: 检查并结束现有的 xray.exe 进程
tasklist | find /i "xray.exe" >nul
if %errorlevel%==0 (
    echo 正在停止运行中的 xray.exe...
    taskkill /f /im xray.exe >nul
)

:: 启动新的 xray.exe
echo 正在启动 xray.exe 并加载配置: %selected_config%
:: 使用 start 命令让 xray 在新窗口运行，这样脚本退出后 xray 不会关闭
start "" /realtime xray.exe run -c "%selected_config%"

echo 启动成功，正在退出...
timeout /t 2 >nul
exit