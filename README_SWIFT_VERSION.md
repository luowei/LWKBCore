# LWKBCore Swift 版本使用说明

## 概述

`LWKBCore_swift` 是 `LWKBCore` 库的 Swift 子模块，包含了使用 Swift 编写的核心键盘组件。

## 安装

### 使用 Swift 版本

如果你的项目使用 Swift，可以安装 Swift 版本：

```ruby
pod 'LWKBCore_swift'
```

### 使用 Objective-C 版本

如果你的项目使用 Objective-C，可以安装原版本：

```ruby
pod 'LWKBCore'
```

### 同时使用两个版本

如果需要同时使用 Objective-C 和 Swift 版本：

```ruby
pod 'LWKBCore'
pod 'LWKBCore_swift'
```

## Swift 文件列表

本 Swift 子模块包含以下文件：

- `LWKBConfig.swift` - 键盘配置相关
- `LWKeyboardDefines.swift` - 键盘定义
- `LWWordEngineDefines.swift` - 词引擎定义

## 版本要求

- iOS 8.0+
- Swift 5.0+

## 许可证

LWKBCore_swift 使用 MIT 许可证。详情请参见 LICENSE 文件。
