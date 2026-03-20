# Xray Config Loader (Windows Batch)

一个轻量级的 Windows 批处理脚本，用于快速切换并启动 `xray.exe` 的不同配置文件。

## 🌟 功能特性

- **自动扫描**：自动识别 `config` 目录下的所有 `.json` 配置文件并生成菜单。
- **智能管理**：启动新配置前，自动检测并关闭已在运行的 `xray.exe` 进程，防止端口冲突。
- **独立运行**：使用 `start` 命令启动，脚本退出后 Xray 进程依然保持运行。
- **简单易用**：无需安装 Python 或其他环境，双击即可运行。

## 📂 目录结构

请确保你的文件夹结构如下：

```text
.
├── xray.exe             # Xray 核心程序
├── start_xray.bat       # 本脚本
└── config/              # 存放配置文件的文件夹
    ├── config1.json
    ├── google_node.json
    └── gaming_mode.json
