# 使用指南

## 快速开始

### 1. 添加这个镜像仓库
```powershell
scoop bucket add official-mirror https://github.com/cmontage/scoopbucket-official
```

### 2. 搜索应用程序
```powershell
# 在所有存储库中搜索
scoop search <app-name>

# 在特定存储库中搜索
scoop search official-mirror/<bucket-name>/<app-name>
```

### 3. 安装应用程序
```powershell
# 从任意存储库安装
scoop install <app-name>

# 从特定存储库安装
scoop install official-mirror/<bucket-name>/<app-name>
```

## 存储库说明

### main
包含最常用的命令行工具和实用程序，如：
- git, curl, wget
- 7zip, notepad++
- python, nodejs, go

### extras
包含图形界面应用程序和一些特殊工具，如：
- chrome, firefox
- vscode, sublime-text
- vlc, obs-studio

### versions
包含应用程序的特定版本，适用于需要固定版本的场景，如：
- python27, python38
- nodejs12, nodejs14
- openjdk8, openjdk11

### java
专门的Java开发工具，如：
- openjdk, oraclejdk
- maven, gradle
- eclipse, intellij-idea

### games
游戏和游戏相关工具，如：
- steam, gog-galaxy
- retroarch, dolphin
- minecraft, terraria

### nerd-fonts
各种编程字体，如：
- firacode, cascadia-code
- source-code-pro
- jetbrains-mono

### php
PHP开发相关工具，如：
- php, composer
- xdebug, phpunit
- laravel-installer

### nirsoft
NirSoft公司的系统工具，如：
- nirCmd, nircmd
- passwordfox, mailpassview
- procexp, regscanner

### nonportable
需要安装到系统的非便携式应用，如：
- office365, adobe-reader
- teamviewer, anydesk
- virtualbox, vmware

### sysinternals
微软Sysinternals工具套件，如：
- procmon, procexp
- autoruns, tcpview
- psexec, bginfo

## 高级用法

### 查看存储库信息
```powershell
scoop bucket list
```

### 更新存储库
```powershell
scoop update
```

### 移除存储库
```powershell
scoop bucket rm official-mirror
```

### 查看已安装应用
```powershell
scoop list
```

### 更新已安装应用
```powershell
scoop update *
```

## 故障排除

### 问题：无法添加存储库
**解决方案：**
1. 检查网络连接
2. 确保Git已安装：`scoop install git`
3. 尝试手动克隆：`git clone https://github.com/cmontage/scoopbucket-official`

### 问题：应用程序下载失败
**解决方案：**
1. 检查网络连接
2. 尝试使用代理：`scoop config proxy http://proxy:port`
3. 重试安装：`scoop install <app-name>`

### 问题：应用程序版本过旧
**解决方案：**
1. 更新存储库：`scoop update`
2. 检查是否有新版本：`scoop status`
3. 手动更新：`scoop update <app-name>`

## 贡献

如果你发现问题或有改进建议，请在GitHub上提交Issue或Pull Request。

## 相关链接

- [Scoop官方网站](https://scoop.sh/)
- [Scoop官方文档](https://github.com/ScoopInstaller/Scoop/wiki)
- [Scoop存储库列表](https://github.com/ScoopInstaller/Scoop/blob/master/buckets.json)
