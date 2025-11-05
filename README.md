<p align="center"><img src="https://gcore.jsdelivr.net/gh/cmontage/scoopbucket@main/scoop.png" width="100" alt="Scoop Logo" ></p>

<h1 align="center">Scoop Official Bucket  All In One</h1>

每天自动同步所有Scoop官方存储库，确保提供最新的应用程序清单。

## 自动更新

本仓库使用GitHub Actions每天北京时间早上8点自动同步所有官方存储库的最新内容。

## 包含的官方存储库

| 存储库 | 描述 | 源地址 |
|--------|------|---------|
| main | 主要应用程序 | https://github.com/ScoopInstaller/Main |
| extras | 额外应用程序 | https://github.com/ScoopInstaller/Extras |
| versions | 不同版本的应用程序 | https://github.com/ScoopInstaller/Versions |
| nirsoft | NirSoft工具 | https://github.com/ScoopInstaller/Nirsoft |
| php | PHP相关 | https://github.com/ScoopInstaller/PHP |
| nonportable | 非便携式应用 | https://github.com/ScoopInstaller/Nonportable |
| java | Java应用 | https://github.com/ScoopInstaller/Java |
| games | 游戏 | https://github.com/Calinou/scoop-games |
| nerd-fonts | 字体 | https://github.com/matthewjberger/scoop-nerd-fonts |
| sysinternals | Windows Sysinternals工具 | https://github.com/niheaven/scoop-sysinternals |

## 使用方法

### 第一次使用 Scoop（已安装请忽略）

1. [PowerShell](https://learn.microsoft.com/zh-cn/powershell/) 版本在 5.1 或以上这条不用看了，如果没有 PowerShell 大于 5.1 版本，可以下载安装 [PowerShell Core](https://github.com/PowerShell/PowerShell)。运行以下命令查看：

```powershell
$PSVersionTable.PSVersion.Major # should be >= 5.1
```

2. 之后请根据 [官方教程](https://github.com/ScoopInstaller/Install#readme) 安装 Scoop，建议自定义安装目录，以下为我建议的安装操作 **（使用我自建的 Scoop 源，可与自动代理无法访问的资源以及默认内置本仓库的 official bucket。详情可以看[这里](https://github.com/cmontage/scoop)，当然你也可以使用官方  Scoop 源）**

```powershell
# 设置 PowerShell 执行策略（非管理员启动）
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```
```powershell
# 二选一

# 下载安装脚本到本地（自建脚本，Scoop 安装完默认内置本仓库的 official bucket 并且自动代理无法访问的资源以及移除 main bucket 限制）
irm https://gitee.com/cmontage/scoop/raw/master/install.ps1 -outfile 'install.ps1'

# 下载安装脚本到本地（官方脚本）
irm get.scoop.sh -outfile 'install.ps1'
```
```powershell
# 自定义 Scoop 安装目录，以下是我的路径例子，你可以自己根据情况修改
# 可以不设全局文件夹ScoopGlobalDir，全局文件夹里的应用需要管理员权限
.\install.ps1 -ScoopDir 'D:\Apps\Scoop\ScoopApps' -ScoopGlobalDir 'D:\Apps\Scoop\ScoopApps-G' -NoProxy
```
```powershell
# 下载 7zip git，因为我们之后如果要添加别的 Bucket，必须有 git、7zip
scoop install 7zip git
```
### 已安装 Scoop

> [!CAUTION]
> 确保你已经安装了 Scoop ！
>
> 输入 scoop -V 命令查看 Scoop 版本

1. 添加本仓库 bucket，运行命令

    ```powershell
    scoop bucket add official https://gitee.com/cmontage/scoopbucket

    # 如果需要移除本仓库
    scoop bucket rm official
    ```

2. 下载几个基本的应用 **（注意使用系统代理最好不要用aria2）**

    ```powershell
    # 下载 7zip git sudo dark innounp ...
    scoop install official/7zip official/git official/aria2 official/sudo official/dark official/innounp 
    ```

3. 替换自带的 scoop search，因为自带的比较慢

    ```powershell
    scoop install official/scoop-search

    # 使用 scoop-search ，例如
    scoop-search 7zip
    ```

> [!TIP]
>
> 如果你之前添加过其他 bucket 并下载过应用，你希望他们全部或者部分使用本仓库来进行更新。那么你需要在 app 安装后的 apps\current 路径下的 install.json 的 bucket 项的值改为 official。然后运行 scoop list 来检查是否替换成功。
>
> 如果要批量修改，直接 vscode 搜索替换大法。

### 安装应用程序
```powershell
scoop install official/<app-name>
```

## 文件结构

```
buckets/
├── main/           # 主要应用程序清单
├── extras/         # 额外应用程序清单  
├── versions/       # 不同版本应用程序清单
├── nirsoft/        # NirSoft工具清单
├── php/            # PHP相关清单
├── nonportable/    # 非便携式应用清单
├── java/           # Java应用清单
├── games/          # 游戏清单
├── nerd-fonts/     # 字体清单
└── sysinternals/   # Sysinternals工具清单

scripts/            # 所有仓库的脚本文件（保持原始路径结构）
├── appname/        # 应用程序脚本目录
└── ...             # 其他脚本文件和目录

## 许可证

本仓库遵循各个官方存储库的许可证条款。

最后更新时间: 2025年11月05日 09:13:58

## 统计信息

- main: 1408 个应用程序 + 15 个脚本
- extras: 2207 个应用程序 + 74 个脚本
- versions: 530 个应用程序 + 20 个脚本
- nirsoft: 290 个应用程序
- php: 391 个应用程序
- nonportable: 128 个应用程序 + 3 个脚本
- java: 322 个应用程序 + 1 个脚本
- games: 366 个应用程序 + 4 个脚本
- nerd-fonts: 367 个应用程序
- sysinternals: 75 个应用程序 + 1 个脚本

总计: 6084 个应用程序 + 109 个脚本
