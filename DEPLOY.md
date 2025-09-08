# 部署指南

## 快速部署到GitHub

### 1. 初始化Git仓库
```bash
git init
git add .
git commit -m "Initial commit: Scoop official buckets mirror"
```

### 2. 创建GitHub仓库
1. 访问 [GitHub](https://github.com/new)
2. 仓库名称: `scoopbucket-official`
3. 描述: `Scoop官方存储库镜像 - 每日自动同步所有官方bucket`
4. 设为公开仓库
5. 不要初始化README、.gitignore或LICENSE（已存在）

### 3. 推送到GitHub
```bash
git remote add origin https://github.com/cmontage/scoopbucket-official.git
git branch -M main
git push -u origin main
```

### 4. 启用GitHub Actions
1. 进入仓库的 Settings 页面
2. 点击左侧的 "Actions" → "General"
3. 在 "Actions permissions" 下选择 "Allow all actions and reusable workflows"
4. 保存设置

### 5. 测试自动化
- 手动触发: 进入 Actions 页面，选择 "Sync Scoop Official Buckets" 工作流，点击 "Run workflow"
- 查看结果: 等待工作流完成，检查是否所有bucket都已同步

## 本地使用

### 手动同步所有存储库
```powershell
.\sync-buckets.ps1 all
```

### 同步特定存储库
```powershell
.\sync-buckets.ps1 main
.\sync-buckets.ps1 extras
.\sync-buckets.ps1 java
# ... 等等
```

### 使用批处理文件
```cmd
.\sync.bat
```

### 验证仓库状态
```powershell
.\verify.ps1
```

## 用户使用方法

### 添加这个镜像仓库
```powershell
scoop bucket add official-mirror https://github.com/cmontage/scoopbucket-official
```

### 搜索应用程序
```powershell
scoop search <app-name>
```

### 安装应用程序
```powershell
scoop install <app-name>
```

### 从特定bucket安装
```powershell
scoop install official-mirror/main/<app-name>
scoop install official-mirror/extras/<app-name>
```

## 自动化说明

- **同步频率**: 每天北京时间早上8点（UTC 0点）
- **同步内容**: 所有10个官方Scoop存储库的最新内容
- **更新内容**: README.md会自动更新统计信息和时间戳

## 维护

### 添加新的官方存储库
1. 修改 `config.json` 中的 `buckets` 部分
2. 修改 `sync-buckets.ps1` 中的 `$buckets` 哈希表
3. 修改 `.github/workflows/sync-buckets.yml` 中的 matrix 策略
4. 创建对应的目录: `buckets/<bucket-name>`

### 修改同步时间
编辑 `.github/workflows/sync-buckets.yml` 中的 cron 表达式:
```yaml
schedule:
  - cron: '0 0 * * *'  # UTC时间，根据需要修改
```

### 手动触发同步
在GitHub仓库的Actions页面可以手动触发同步。

## 许可证

本项目使用MIT许可证。所有同步的内容遵循各个官方存储库的许可证条款。

## 支持

如有问题，请在GitHub仓库中提交Issue。
