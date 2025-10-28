::[Bat To Exe Converter]
::
::YAwzoRdxOk+EWAjk
::fBw5plQjdCqDJN98B8r/5ZOcrINK1+5g6Yk07fD0aQRAJ6XL3R/9/nIE5riBJ+9d40brFQ==
::YAwzuBVtJxjWCl3EqQJgSA==
::ZR4luwNxJguZRRnk
::Yhs/ulQjdF+5
::cxAkpRVqdFKZSDk=
::cBs/ulQjdF+5
::ZR41oxFsdFKZSDk=
::eBoioBt6dFKZSDk=
::cRo6pxp7LAbNWATEpSI=
::egkzugNsPRvcWATEpSI=
::dAsiuh18IRvcCxnZtBJQ
::cRYluBh/LU+EWAnk
::YxY4rhs+aU+IeA==
::cxY6rQJ7JhzQF1fEqQJhZksaHErSXA==
::ZQ05rAF9IBncCkqN+0xwdVsFAlTMbCXqZg==
::ZQ05rAF9IAHYFVzEqQIYLQNbyupFuYNsgm3RbTcYjw==
::eg0/rx1wNQPfEVWB+kM9LVsJDGQ=
::fBEirQZwNQPfEVWB+kM9LVsJDGQ=
::cRolqwZ3JBvQF1fEqQK2x+vQkv8H06QywVOZBB58GgYOX4+amiO4iGnz36yBpQ3pb4sm/Ff0UYGUFxfgi9W4+/5d69fsLpqKMJdosxpg0w==
::dhA7uBVwLU+EWDk=
::YQ03rBFzNR3SWATElA==
::dhAmsQZ3MwfNWATEVotieEkBDCabfEazCLIo7evz3/iIwg==
::ZQ0/vhVqMQ3MEVWAtB9wSA==
::Zg8zqx1/OA3MEVWAtB9wSA==
::dhA7pRFwIByZRRnk
::Zh4grVQjdCmDJFuF4MrU0p2ogDiAPX8y4k+aFCR9BhkCTqiYgye6nVjn+LWaFO828kDHepg702hOndlfXidwewqk6OHzLIaUMrxIshh//Qr5Tyg=
::YB416Ek+ZW8=
::
::
::978f952a14a936cc963da21a135fa983
@echo off
:: ==================================================
:: Hexo控制中心 - 批处理脚本
:: 功能：提供可视化界面管理Hexo博客项目，简化常用操作
:: 版本：1.0
:: 适用环境：Windows系统，已安装Hexo、Node.js和npm
:: 核心优势：通过可视化菜单减少命令行输入，降低使用门槛
:: ==================================================

:: ==============================================
:: 基础环境配置 - 初始化脚本运行环境
:: ==============================================
:: 关闭命令回显（不在窗口显示执行的命令本身，使输出更整洁）
@echo off
:: 设置窗口标题，方便用户识别当前程序
title Hexo控制中心
:: 固定命令行窗口大小：宽度74列，高度20行（适配菜单布局）
mode con cols=74 lines=20
:: 手动设置缓冲区高度为50行（当内容超出窗口高度时会显示滚动条，方便查看历史输出）
:: 使用PowerShell命令调整控制台缓冲区，解决内容溢出问题
powershell -command "$host.ui.RawUI.BufferSize = New-Object System.Management.Automation.Host.Size(74, 50);"

:: ==============================================
:: 环境初始化与目录切换
:: ==============================================
:: 清屏，准备显示环境检查界面
cls
:: 顶部装饰线（视觉分隔符，提升界面美观度）
echo  ======================================================================
:: 显示居中标题（调用CenterTitle函数，绿色显示）
call :CenterTitle Green "【 Hexo 控制中心 】- 环境检查"
:: 分隔线（区分标题和内容区域）
echo  ----------------------------------------------------------------------
:: 显示初始化进度信息（蓝色文本表示正在执行的操作）
call :ColorText Blue "● 初始化环境..."
call :ColorText Blue "└─ 正在定位脚本所在目录..."
:: 切换到脚本所在目录（%~dp0表示当前脚本的目录路径）
:: || 符号表示如果cd命令失败，则执行括号内的错误处理
cd /d "%~dp0" || (
    call :ColorText Red "└─ [错误] 无法切换到脚本所在目录，请检查文件权限"
    echo.
    pause
    exit
)
:: 显示成功信息（绿色文本表示操作完成）
call :ColorText Green "└─ [成功] 已切换到脚本目录：%cd%"
echo.
echo  ======================================================================
:: 倒计时进入项目检查（使用PowerShell实现带动态更新的倒计时）
:: `r 表示回车不换行，实现文本覆盖效果
PowerShell -Command "$seconds = 3; while($seconds -gt 0) { Write-Host -ForegroundColor Yellow -NoNewline "`r[准备就绪] $seconds 秒后进入项目完整性检查..."; Start-Sleep -Seconds 1; $seconds--; } Write-Host "`r                                                                 "; "
:: 跳转到项目检查流程
goto checkProject

:: ==============================================
:: Hexo项目详细检查流程
:: 作用：验证当前目录是否为有效的Hexo项目，确保后续操作能正常执行
:: ==============================================
:checkProject
:: 清屏，准备显示项目检查界面
cls
echo  ======================================================================
call :CenterTitle Green "【 Hexo 控制中心 】- 项目完整性检查"
echo  ----------------------------------------------------------------------
echo.

:: 1. 检查_config.yml文件（Hexo核心配置文件）
call :ColorText Blue "● 检查核心配置文件"
call :ColorText Blue "└─ 正在检查核心配置文件..."
if exist "_config.yml" (
    call :ColorText Green "└─ [成功] 找到 _config.yml"
) else (
    call :ColorText Red "└─ [错误] 未找到 _config.yml（Hexo核心配置文件）"
    goto notHexoProject  :: 跳转到非Hexo项目处理流程
)
echo.

:: 2. 检查package.json文件（项目依赖描述文件）
call :ColorText Blue "●  检查项目描述文件"
call :ColorText Blue "└─ 正在检查项目描述文件..."
if exist "package.json" (
    call :ColorText Green "└─ [成功] 找到 package.json"
) else (
    call :ColorText Red "└─ [错误] 未找到 package.json（项目依赖文件）"
    goto notHexoProject  :: 跳转到非Hexo项目处理流程
)
echo.

:: 3. 检查package.json中的hexo依赖（确认是Hexo项目）
call :ColorText Blue "●  验证Hexo核心依赖"
call :ColorText Blue "└─ 正在验证Hexo核心依赖..."
:: findstr命令在package.json中查找"hexo:"字符串（不区分大小写）
:: >nul 2>&1 表示隐藏命令输出
findstr /i /c:"\"hexo\":" "package.json" >nul 2>&1
if %errorlevel% equ 0 (  :: errorlevel为0表示找到匹配内容
    call :ColorText Green "└─ [成功] 确认包含Hexo核心依赖"
) else (
    call :ColorText Red "└─ [错误] 未在package.json中发现Hexo相关依赖"
    goto notHexoProject  :: 跳转到非Hexo项目处理流程
)
echo.

:: 4. 检查关键目录结构（source存放文章，themes存放主题）
call :ColorText Blue "●  检查项目目录结构"
call :ColorText Blue "└─ 正在检查项目目录结构..."
set "criticalDirs=source themes"  :: 需要检查的关键目录列表
set "dirError=0"  :: 目录错误标记，0表示无错误
:: 遍历目录列表进行检查
for %%d in (%criticalDirs%) do (
    if exist "%%d\" (
        call :ColorText Green "└─ [成功] 找到必要目录：%%d"
    ) else (
        call :ColorText Yellow "└─ [警告] 未找到可选目录 %%d（可能影响部分功能）"
        set "dirError=1"  :: 标记有警告
    )
)

:: 所有检查通过，准备进入主菜单
echo.
call :ColorText Green "[检查结果] 当前目录是有效的Hexo项目 √"
echo  ======================================================================
:: 倒计时进入主菜单
PowerShell -Command "$seconds = 3; while($seconds -gt 0) { Write-Host -ForegroundColor Yellow -NoNewline "`r[即将进入] $seconds 秒后打开主菜单..."; Start-Sleep -Seconds 1; $seconds--; } Write-Host "`r                                                                 "; "
goto menu  :: 跳转到主菜单

:: ==============================================
:: 非Hexo项目处理
:: 作用：当检测到当前目录不是有效的Hexo项目时，显示错误信息并提供解决方案
:: ==============================================
:notHexoProject
echo.
echo  ----------------------------------------------------------------------
call :ColorText Red "[检查结果] 当前目录不是有效的Hexo项目"
echo.
call :ColorText Yellow "  可能的解决方法："
call :ColorText Yellow "  1. 确保脚本与Hexo项目文件在同一目录"
call :ColorText Yellow "  2. 检查是否缺少以下关键文件："
call :ColorText Yellow "     - _config.yml（Hexo核心配置）"
call :ColorText Yellow "     - package.json（需包含hexo依赖）"
echo.
echo  ======================================================================
pause  :: 暂停等待用户确认
exit  :: 退出脚本

:: ==============================================
:: 通用函数定义 - 可被脚本其他部分调用，实现代码复用
:: ==============================================

:: 1. 标题居中显示函数
:: 参数说明：
::   %1 - 文本颜色（如Green、Yellow等）
::   %2 - 要显示的标题文本（支持中文和特殊字符）
:CenterTitle
    :: 功能：将标题在70字符宽度的范围内居中显示，并应用指定颜色
    :: 实现逻辑：
    :: 1. 遍历标题中的每个字符，计算总宽度（中文/特殊字符占2个位置，英文/数字占1个）
    :: 2. 根据窗口宽度（70）计算左右需要填充的空格数
    :: 3. 输出空格+标题，实现居中效果
    powershell -command "$title='%2'; $windowWidth=70; $titleWidth=0; foreach($c in $title.ToCharArray()){$titleWidth += if([char]::GetUnicodeCategory($c) -in 'OtherLetter','OtherSymbol','MathSymbol'){2}else{1}}; $spaces=[math]::Max(0,[int](($windowWidth - $titleWidth)/2)); Write-Host -ForegroundColor '%1' (' ' * $spaces + $title);"
    :: 函数执行完毕后退出，避免继续执行后续代码
    goto :eof

:: 2. 带颜色的文本输出函数
:: 参数说明：
::   %1 - 文本颜色（如Red、Blue等）
::   %2 - 要显示的文本内容（支持空格和特殊字符）
:ColorText
    :: 功能：以指定颜色在窗口输出文本，增强信息的视觉区分度
    :: 实现方式：调用PowerShell的Write-Host命令，通过-ForegroundColor参数设置颜色
    PowerShell -Command "Write-Host -ForegroundColor '%1' '%2'"
    :: 函数执行完毕后退出
    goto :eof

:: 3. 版本信息显示子程序（用于统一处理版本信息的显示格式和颜色）
:: 参数说明：
::   %1 - 标签文本（如"Hexo CLI 版本："）
::   %2 - 实际获取到的版本值
::   %3 - 未找到信息时的提示文本
:ShowVersion
set "label=%~1"  :: 移除参数中的引号，避免干扰格式
set "actualValue=%~2"  :: 实际版本值
set "notFound=%~3"  :: 未找到信息时的提示

:: 直接比较实际值和未找到提示，决定显示颜色
if "%actualValue%"=="%notFound%" (
    call :VersionWithLabelWidth Yellow "%label%" "%actualValue%"  :: 未找到时显示黄色
) else (
    call :VersionWithLabelWidth Green "%label%" "%actualValue%"   :: 找到时显示绿色
)
goto :eof  :: 退出子程序

:: 4. 版本信息格式化显示函数（确保版本信息对齐显示）
:: 参数说明：
::   %1 - 文本颜色
::   %2 - 标签文本
::   %3 - 版本值
:VersionWithLabelWidth
:: 功能：将标签统一对齐（18个字符宽度），前面添加缩进和项目符号
:: 实现逻辑：
:: 1. 将标签用空格填充至18个字符宽度（PadRight方法）
:: 2. 添加固定缩进（20个空格）和项目符号（●）
:: 3. 组合标签和版本值，按指定颜色显示
powershell -command "$label='%2'; $value='%3'; $labelWidth=18; $spaces=' ' * 20; $formattedLabel=$label.PadRight($labelWidth); $formattedLine=$spaces+'● '+$formattedLabel+$value; Write-Host -ForegroundColor '%1' $formattedLine;"
goto :eof  :: 退出函数

:: ==============================================
:: 主菜单 - 程序入口，用户交互的起点
:: 作用：展示所有可用功能，接收用户输入并跳转到对应功能模块
:: ==============================================
:menu
:: 清屏（清除之前的显示内容，保持界面整洁）
cls
:: 初始化用户输入变量（清空之前的输入残留，避免影响判断）
set "choice="
:: 顶部装饰线（视觉分隔，提升界面美观度）
echo  ======================================================================
:: 显示居中标题（调用上面定义的CenterTitle函数，绿色显示）
call :CenterTitle Green "【 Hexo 控制中心 】 ヾ(≧▽≦*)o"
:: 分隔线（区分标题和功能选项）
echo  ----------------------------------------------------------------------
echo.
:: 功能选项列表（用户可选择的操作，使用编号①-⑩对应不同功能）
echo        ① 启动本地服务（预览博客）             ② 新建文章
echo        ③ 生成静态文件                         ④ 清除缓存
echo        ⑤ 清除缓存并生成静态文件               ⑥ 查看版本信息
echo        ⑦ 自定义端口启动                       ⑧ 退出
echo        ⑨ 部署项目（需特殊配置）               ⑩ 查看帮助
echo.
:: 底部装饰线（视觉分隔）
echo  ======================================================================
:: 提示用户输入操作编号（1-10）
set /p choice=请输入操作编号（1-10）：

:: 根据用户输入跳转到对应的功能模块
if "%choice%"=="1" goto startServer       :: 启动本地服务
if "%choice%"=="2" goto createPost        :: 新建文章
if "%choice%"=="3" goto generateStaticFiles :: 生成静态文件
if "%choice%"=="4" goto clearCache        :: 清除缓存
if "%choice%"=="5" goto clearCacheAndGenerateFiles :: 清除并生成
if "%choice%"=="6" goto versionInfo       :: 查看版本信息
if "%choice%"=="7" goto startServerWithPort :: 自定义端口启动
if "%choice%"=="8" goto exit              :: 退出确认
if "%choice%"=="9" goto deployProject     :: 部署项目
if "%choice%"=="10" goto help             :: 查看帮助
if "%choice%"=="0" goto help              :: 查看帮助（兼容0输入）

:: 若输入无效编号（不在1-10范围内），提示错误
call :ColorText Red "[错误] 请输入有效的编号（1-10）！"
echo.
:: 暂停等待用户确认（防止错误信息一闪而过，让用户有时间阅读）
pause
:: 返回主菜单，重新等待用户输入
goto menu

:: ==============================================
:: 1. 启动本地服务（预览博客）
:: 功能：启动Hexo本地服务器，实现在线预览博客效果，支持实时刷新
:: ==============================================
:startServer
:: 清屏（刷新界面，只显示当前功能的相关信息）
cls
:: 顶部装饰线
echo  ======================================================================
:: 显示当前功能标题（居中绿色显示）
call :CenterTitle Green "【 Hexo 控制中心 】- 启动本地服务"
:: 分隔线
echo  ----------------------------------------------------------------------
:: 显示操作提示（蓝色文本，突出重要信息）
call :ColorText Blue "● 正在启动本地服务..."
call :ColorText Blue "└─ 服务启动后，按 Ctrl+C 可停止服务"
echo.
:: 核心命令解析：
::   hexo server -l：启动Hexo本地服务，-l参数启用livereload实时刷新
::   cmd /k：执行命令后保持窗口不关闭，方便查看服务输出日志
::   服务停止后提示用户选择返回主菜单或关闭窗口
cmd /k "hexo server -l & echo. & PowerShell -Command "Write-Host -ForegroundColor Yellow '[服务已停止] 输入 N 返回主菜单 / Y 关闭控制台'" & exit"
:: 操作完成后返回主菜单（实际会被上面的exit覆盖，此处为冗余保险）
goto menu

:: ==============================================
:: 2. 新建文章
:: 功能：创建新的博客文章（Markdown文件），自动生成Front-matter信息
:: ==============================================
:createPost
:: 清屏
cls
:: 顶部装饰线
echo  ======================================================================
:: 显示当前功能标题
call :CenterTitle Green "【 Hexo 控制中心 】- 新建文章"
:: 分隔线
echo  ----------------------------------------------------------------------
echo.
:: 提示用户输入文章标题（将用于生成Markdown文件名和Front-matter）
set /p title=请输入文章标题：
:: 判断标题是否为空（为空则提示错误并重新输入）
if "%title%"=="" (
    call :ColorText Red "[错误] 文章标题不能为空，请重新输入！"
    echo.
    pause
    goto createPost  :: 返回重新输入
)
:: 显示操作提示（告知用户文章生成的位置）
call :ColorText Blue "● 正在新建文章《%title%》..."
call :ColorText Blue "└─ 文章文件将生成至 source/_posts/%title%.md"
echo.
:: 核心命令解析：
::   hexo new "%title%"：创建新文章，标题为用户输入的%title%
::   操作完成后显示成功提示，并自动退出子窗口返回主菜单
cmd /k "hexo new "%title%" & echo. & PowerShell -Command "Write-Host -ForegroundColor DarkCyan '[操作完成] 文章新建成功 √'" & exit"
:: 底部装饰线
echo  ======================================================================
:: 暂停等待用户确认
pause
:: 返回主菜单
goto menu

:: ==============================================
:: 3. 生成静态文件
:: 功能：将Markdown文章和主题配置转换为HTML静态文件，用于部署
:: ==============================================
:generateStaticFiles
:: 清屏
cls
:: 顶部装饰线
echo  ======================================================================
:: 显示当前功能标题
call :CenterTitle Green "【 Hexo 控制中心 】- 生成静态文件"
:: 分隔线
echo  ----------------------------------------------------------------------
:: 显示操作提示（告知用户静态文件生成的位置）
call :ColorText Blue "● 正在生成静态文件..."
call :ColorText Blue "└─ 静态文件将生成至 public 目录"
echo.
:: 核心命令解析：
::   hexo generate：生成静态文件（可简写为hexo g）
::   静态文件是博客的HTML、CSS等最终发布文件，存放在public目录
cmd /k "hexo generate & echo. & PowerShell -Command "Write-Host -ForegroundColor DarkCyan '[操作完成] 静态文件生成完毕 √'" & exit"
:: 底部装饰线
echo  ======================================================================
:: 暂停等待用户确认
pause
:: 返回主菜单
goto menu

:: ==============================================
:: 4. 清除缓存
:: 功能：删除Hexo生成的缓存文件和静态文件，解决内容更新异常问题
:: ==============================================
:clearCache
:: 清屏
cls
:: 顶部装饰线
echo  ======================================================================
:: 显示当前功能标题
call :CenterTitle Green "【 Hexo 控制中心 】- 清理缓存"
:: 分隔线
echo  ----------------------------------------------------------------------
:: 显示操作提示（说明清理的内容）
call :ColorText Blue "● 正在清理缓存..."
call :ColorText Blue "└─ 将删除 db.json 和 public 目录"
echo.
:: 核心命令解析：
::   hexo clean：清除Hexo生成的缓存文件（db.json）和已生成的静态文件（public目录）
::   用于解决因缓存导致的内容更新不及时、渲染异常等问题
cmd /k "hexo clean & echo. & PowerShell -Command "Write-Host -ForegroundColor DarkCyan '[操作完成] 缓存清理成功 √'" & exit"
:: 底部装饰线
echo  ======================================================================
:: 暂停等待用户确认
pause
:: 返回主菜单
goto menu

:: ==============================================
:: 5. 清除缓存并生成文件
:: 功能：组合执行清除缓存和生成静态文件操作，确保生成最新版本的文件
:: ==============================================
:clearCacheAndGenerateFiles
:: 清屏
cls
:: 顶部装饰线
echo  ======================================================================
:: 显示当前功能标题
call :CenterTitle Green "【 Hexo 控制中心 】- 清理缓存并生成文件"
:: 分隔线
echo  ----------------------------------------------------------------------
:: 显示操作提示（说明操作流程）
call :ColorText Blue "● 正在清理缓存并生成静态文件..."
call :ColorText Blue "└─ 先清理缓存，再生成最新静态文件"
echo.
:: 核心命令解析：
::   连续执行hexo clean（清理）和hexo generate（生成）命令
::   &符号用于在同一行执行多个命令，确保清理完成后再生成最新文件
cmd /k "hexo clean & hexo generate & echo. & PowerShell -Command "Write-Host -ForegroundColor DarkCyan '[操作完成] 清理缓存并生成静态文件成功 √'" & exit"
:: 底部装饰线
echo  ======================================================================
:: 暂停等待用户确认
pause
:: 返回主菜单
goto menu

:: ==============================================
:: 6. 查看版本信息
:: 功能：显示Hexo、Node.js和npm的版本信息，用于排查版本兼容性问题
:: ==============================================
:versionInfo
:: 清屏
cls
:: 顶部装饰线
echo  ======================================================================
:: 显示当前功能标题
call :CenterTitle Green "【 Hexo 控制中心 】- 查看版本信息"
:: 分隔线
echo  ----------------------------------------------------------------------
echo.

:: 初始化版本信息变量（默认值为未找到状态，用于判断是否获取成功）
set "hexo_cli=未找到信息"
set "hexo_core=当前非Hexo项目目录"
set "node_ver=未找到信息"
set "npm_ver=未找到信息"
set "tempFile=%temp%\hexo_version.tmp"  :: 定义临时文件路径

:: 清理旧的临时文件（避免读取上次残留的数据）
if exist "%tempFile%" del /f /q "%tempFile%" >nul 2>&1
:: 执行hexo version命令，并将输出结果保存到临时文件
:: 2>&1表示同时捕获标准输出和错误输出，确保错误信息也能被处理
cmd /k "hexo version > "%tempFile%" 2>&1 & exit"
:: 从临时文件中提取版本信息（使用findstr筛选包含关键词的行）
:: 提取Hexo CLI版本（tokens=2表示取第二个字段，delims=: 表示以冒号和空格为分隔符）
for /f "tokens=2 delims=: " %%a in ('findstr /i "hexo-cli:" "%tempFile%"') do set "hexo_cli=%%a"
:: 提取Hexo核心版本
for /f "tokens=2 delims=: " %%a in ('findstr /i "hexo:" "%tempFile%"') do set "hexo_core=%%a"
:: 提取Node.js版本
for /f "tokens=2 delims=: " %%a in ('findstr /i "node:" "%tempFile%"') do set "node_ver=%%a"
:: 提取npm版本（直接调用npm -v命令）
for /f "delims=" %%a in ('npm -v') do set "npm_ver=%%a"
:: 重置窗口标题（防止被hexo version命令修改）
title Hexo控制中心

:: 清理版本信息中的多余空格（避免比较时因空格导致不匹配）
set "hexo_cli=%hexo_cli: =%"
set "hexo_core=%hexo_core: =%"
set "node_ver=%node_ver: =%"
set "npm_ver=%npm_ver: =%"

:: 显示版本信息（调用ShowVersion子程序，传递标签、实际值和未找到提示）
call :ShowVersion "Hexo CLI 版本："    "%hexo_cli%" "未找到信息"
call :ShowVersion "Hexo Core 版本："   "%hexo_core%" "当前非Hexo项目目录"
call :ShowVersion "Node.js 版本："     "%node_ver%" "未找到信息"
call :ShowVersion "npm 版本："         "%npm_ver%" "未找到信息"

echo.
:: 底部装饰线
echo  ======================================================================
:: 清理临时文件（避免占用系统空间）
if exist "%tempFile%" del /f /q "%tempFile%" >nul 2>&1
:: 暂停等待用户确认
pause
:: 返回主菜单
goto menu

:: ==============================================
:: 7. 自定义端口启动
:: 功能：允许用户指定端口启动本地服务，解决默认端口4000被占用的问题
:: ==============================================
:startServerWithPort
:: 清屏
cls
:: 顶部装饰线
echo  ======================================================================
:: 显示当前功能标题
call :CenterTitle Green "【 Hexo 控制中心 】- 自定义端口启动"
:: 分隔线
echo  ----------------------------------------------------------------------
:: 提示用户输入端口号（默认4000，适用于默认端口被占用的情况）
set /p port=请输入端口号（默认4000）:
:: 若用户未输入，使用默认端口4000
if "%port%"=="" set port=4000
:: 验证端口合法性（必须是1-65535之间的数字）
:: findstr /r "^[0-9]*$" 用于判断输入是否为纯数字
echo %port% | findstr /r "^[0-9]*$" >nul 2>&1
if %errorlevel% neq 0 (  :: 输入是数字
    :: 若端口大于65535（最大有效端口），使用默认端口
    if %port% gtr 65535 (
        set port=4000 
        call :ColorText Yellow "[温馨提示] 端口超出范围，已自动使用默认端口4000"
    )
    :: 若端口为0（无效端口），使用默认端口
    if %port% equ 0 (
        set port=4000 
        call :ColorText Yellow "[温馨提示] 端口无效，已自动使用默认端口4000"
    )
) else (  :: 输入不是数字
    set port=4000
    call :ColorText Yellow "[温馨提示] 端口格式错误，已自动使用默认端口4000"
)

:: 显示操作提示（告知用户访问地址）
call :ColorText Blue "● 正在启动自定义端口本地服务..."
call :ColorText Blue "└─ 端口：%port%（访问 http://localhost:%port%）"
echo.
:: 核心命令解析：
::   hexo server -p%port%：指定端口启动服务，-p参数后跟端口号
cmd /k "hexo server -p%port% & echo. & PowerShell -Command "Write-Host -ForegroundColor Yellow '[服务已停止] 输入 N 返回主菜单 / Y 关闭控制台'" & exit"
:: 清空端口变量（避免影响下次使用）
set port=
:: 返回主菜单
goto menu

:: ==============================================
:: 8. 退出确认
:: 功能：处理用户退出请求，防止误操作关闭程序
:: ==============================================
:exit
:: 清屏
cls
:: 顶部装饰线
echo  ======================================================================
:: 显示当前功能标题
call :CenterTitle Green "【 Hexo 控制中心 】- 退出确认"
:: 分隔线
echo  ----------------------------------------------------------------------
echo.
:: 提示用户确认退出（防止误操作）
call :ColorText Yellow " 确定要退出 Hexo 控制中心吗？"
echo.
set /p confirm=请输入 Y 确认退出，输入其他键返回主菜单：
echo.
echo  ======================================================================
:: 判断用户输入（/i参数表示不区分大小写，Y或y都视为确认）
if /i "%confirm%"=="Y" (
    :: 倒计时退出，提升用户体验
    PowerShell -Command "$seconds = 3; while($seconds -gt 0) { Write-Host -ForegroundColor Yellow -NoNewline "`r[即将退出] $seconds 秒后关闭窗口..."; Start-Sleep -Seconds 1; $seconds--; } Write-Host "`r                                                                 "; "
    exit  :: 退出程序
) else (
    :: 倒计时返回主菜单
    PowerShell -Command "$seconds = 3; while($seconds -gt 0) { Write-Host -ForegroundColor Yellow -NoNewline "`r[即将取消] 已取消退出，$seconds 秒后返回主菜单..."; Start-Sleep -Seconds 1; $seconds--; } Write-Host "`r                                                                 "; "
    goto menu  :: 返回主菜单
)

:: ==============================================
:: 9. 部署项目
:: 功能：将生成的静态文件部署到远程仓库（如GitHub Pages）
:: ==============================================
:deployProject
:: 清屏
cls
:: 顶部装饰线
echo  ======================================================================
:: 显示当前功能标题
call :CenterTitle Green "【 Hexo 控制中心 】- 部署项目"
:: 分隔线
echo  ----------------------------------------------------------------------
:: 显示操作提示（说明部署的目标）
call :ColorText Blue "● 正在部署项目..."
call :ColorText Blue "└─ 将推送静态文件至远程仓库"
echo.
:: 核心命令解析：
::   hexo deploy -g：部署项目，-g参数表示部署前先生成静态文件
::   需提前在Hexo配置文件（_config.yml）中配置远程仓库信息
cmd /k "hexo deploy -g & echo. & PowerShell -Command "Write-Host -ForegroundColor DarkCyan '[操作完成] 项目部署成功 √'" & exit"
:: 底部装饰线
echo  ======================================================================
:: 暂停等待用户确认
pause
:: 返回主菜单
goto menu

:: ==============================================
:: 10. 查看帮助
:: 功能：显示各功能的详细说明和使用注意事项
:: ==============================================
:help
:: 清屏
cls
:: 顶部装饰线
echo  ======================================================================
:: 显示当前功能标题
call :CenterTitle Green "【 Hexo 控制中心 】- 查看帮助"
:: 分隔线
echo  ----------------------------------------------------------------------
echo.
:: 显示各功能的详细说明（绿色标题区分不同功能）
call :ColorText Green " 1. 启动本地服务："
echo     在本地启动Hexo服务，通过 http://localhost:4000 实时预览博客内容，
echo     支持文章修改后自动刷新预览。

call :ColorText Green " 2. 新建文章："
echo     自动生成带日期和 Front-matter（标题、日期、标签等）的Markdown文件，
echo     文件默认保存至 source/_posts 目录。

call :ColorText Green " 3. 生成静态文件："
echo     将Markdown文章、主题配置等转换为HTML静态文件，生成后保存至 public 
echo     目录，用于部署到服务器或静态托管平台。

call :ColorText Green " 4. 清除缓存："
echo     删除 Hexo 生成的临时缓存文件（db.json）和已生成的静态文件
echo     （public目录），解决因缓存导致的内容更新不及时、渲染异常等问题。

call :ColorText Green " 5. 清除并生成："
echo     组合执行“清除缓存”和“生成静态文件”操作，确保生成的静态文件为
echo     最新版本，推荐在部署前执行此操作。

call :ColorText Green " 6. 查看版本信息："
echo     显示当前环境中Hexo CLI、Hexo核心、Node.js及npm的版本号，
echo     用于排查版本兼容问题。

call :ColorText Green " 7. 自定义端口启动："
echo     当默认端口4000被占用时，可指定其他端口（如8080）启动本地服务，
echo     通过 http://localhost:指定端口 访问预览。

call :ColorText Green " 8. 退出："
echo     关闭当前Hexo控制中心窗口。

call :ColorText Green " 9. 部署项目："
echo     将生成的静态文件（public目录）推送至配置中指定的远程仓库
echo     （如GitHub Pages、Gitee等），需提前在 _config.yml
echo     中配置部署信息（仓库地址、分支等）。
:: 解决空格显示问题，直接使用PowerShell命令
PowerShell -Command "Write-Host -ForegroundColor Blue '    详细参考：https://hexo.io/zh-cn/docs/one-command-deployment'"
echo.
:: 显示温馨提示（黄色文本，强调注意事项）
call :ColorText Yellow "[温馨提示] 所有操作需在Hexo项目根目录执行"
:: 底部装饰线
echo  ======================================================================
:: 暂停等待用户确认
pause
:: 返回主菜单
goto menu