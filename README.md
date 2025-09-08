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
└── java/           # Java应用清单
```

## 许可证

本仓库遵循各个官方存储库的许可证条款。

最后更新时间: 2025年09月08日 16:47:27

## 统计信息

- main: 1000 个应用程序
- nirsoft: 289 个应用程序
- nonportable: 128 个应用程序

总计: 1417 个应用程序
