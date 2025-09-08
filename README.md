# Scoop Official Buckets Mirror

这个仓库每天自动同步所有Scoop官方存储库，确保提供最新的应用程序清单。

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

### 添加这个镜像仓库
```powershell
scoop bucket add official-mirror https://github.com/cmontage/scoopbucket-official
```

### 安装应用程序
```powershell
scoop install official-mirror/<app-name>
```

## 自动更新

本仓库使用GitHub Actions每天北京时间早上8点自动同步所有官方存储库的最新内容。

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
├── common/         # 通用脚本目录
└── ...             # 其他脚本文件和目录

## 许可证

本仓库遵循各个官方存储库的许可证条款。

最后更新时间: 2025年09月08日 20:42:45

## 统计信息

- main: 1403 个应用程序
- extras: 2180 个应用程序
- versions: 510 个应用程序
- nirsoft: 289 个应用程序
- php: 389 个应用程序
- nonportable: 128 个应用程序
- java: 299 个应用程序
- games: 355 个应用程序
- nerd-fonts: 367 个应用程序
- sysinternals: 75 个应用程序

总计: 5995 个应用程序 + 109 个脚本
