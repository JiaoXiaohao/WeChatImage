@echo off
REM 检查是否在 Git 仓库中
git rev-parse --is-inside-work-tree >nul 2>&1
if %errorlevel% neq 0 (
    echo 当前目录不是一个 Git 仓库，请先初始化仓库。
    pause
    exit /b
)

REM 添加所有文件
git add .

REM 提示用户输入提交信息
set /p commit_message=Print type the Commit Message: 

REM 检查用户是否输入了提交信息
if "%commit_message%"=="" (
    set commit_message=Updata File
)

REM 提交更改
git commit -m "%commit_message%"

REM 推送到远程仓库
git push

echo Well Done!
pause