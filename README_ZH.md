# LWKBCore

[![Version](https://img.shields.io/badge/version-1.0.0-blue.svg)](https://gitlab.com/ioslibraries1/lwkbcore)
[![License](https://img.shields.io/badge/license-MIT-green.svg)](https://gitlab.com/ioslibraries1/lwkbcore/blob/master/LICENSE)
[![Platform](https://img.shields.io/badge/platform-iOS%208.0%2B-orange.svg)](https://gitlab.com/ioslibraries1/lwkbcore)

LWKBCore 是一个用于 iOS 平台的输入法键盘核心库，提供多种输入方式支持和配置管理功能。该库专为自定义输入法开发设计，支持拼音、五笔、笔画、手写等多种输入模式。

## 功能特性

### 核心功能

- **多种键盘类型支持**
  - 拼音全键盘输入
  - 拼音九键输入
  - 五笔全键盘输入
  - 笔画九键输入
  - 英文全键盘输入
  - 数字九键输入
  - 符号输入（全键和方键）
  - 手写输入

- **词库支持**
  - 拼音词库
  - 五笔词库
  - 笔画词库
  - 英文词库
  - 表情符号库
  - 繁体字和火星文支持
  - 自定义字典

- **配置管理**
  - App Group 支持（用于主应用和键盘扩展间的数据共享）
  - 用户代理配置
  - 随机字符串生成
  - 手写语言设置
  - 极速输入开关
  - 纯五笔模式开关

### 键盘类型枚举

库中定义了以下键盘类型（`KeyboardType`）：

```objective-c
typedef NS_OPTIONS(NSUInteger, KeyboardType) {
    Keyboard_PingYingFull = 1,              // 拼音全键
    Keyboard_WuBiFull = 1 << 1,             // 全键盘五笔
    Keyboard_ENFull = 1 << 2,               // 英文全键
    Keyboard_NumNine = 1 << 3,              // 数字九键
    Keyboard_PingYingNine = 1 << 4,         // 拼音九键
    Keyboard_BiHuaNine = 1 << 5,            // 笔画九键
    Keyboard_SymbolCollection = 1 << 6,     // 符号方键
    Keyboard_SymbolFull = 1 << 7,           // 符号全键
    Keyboard_HandWritting = 1 << 8,         // 手写键盘
};
```

## 系统要求

- iOS 8.0 或更高版本
- Xcode 11.0 或更高版本
- CocoaPods

## 安装

### 使用 CocoaPods

LWKBCore 可以通过 [CocoaPods](https://cocoapods.org) 安装。要安装它，只需在您的 Podfile 中添加以下行：

```ruby
pod 'LWKBCore'
```

然后运行：

```bash
pod install
```

### 手动安装

1. 克隆仓库到本地
2. 将 `LWKBCore/Classes` 目录下的所有文件添加到您的项目中

## 使用方法

### 基础使用

```objective-c
#import <LWKBCore/LWKBCore.h>

// 创建配置对象
LWKBConfig *config = [LWKBConfig new];
[config hellowrold];

// 获取用户代理字符串
NSString *userAgent = [LWKBConfig userAgent];

// 生成随机字符串
NSString *randomStr = [LWKBConfig randomString];
```

### App Group 配置

库中默认使用的 App Group 标识符为：

```objective-c
#define AppGroupIdentifer @"group.com.wodedata.LWInputMethod"
```

在使用前，请确保：
1. 在 Xcode 项目的 Capabilities 中启用 App Groups
2. 添加相应的 App Group 标识符
3. 确保主应用和键盘扩展都配置了相同的 App Group

### 词库配置

库提供了多个远程词库的 URL 配置：

- **表情符号库**：`http://oss.wodedata.com/db/mykeyboard_emoji_symbols`
- **繁体字和火星文**：`http://oss.wodedata.com/db/mykeyboard_traditional_mars`
- **字典库**：`http://oss.wodedata.com/db/mykeyboard_zidian`
- **拼音词库**：`http://oss.wodedata.com/db/mykeyboard_pinyin`
- **笔画词库**：`http://oss.wodedata.com/db/mykeyboard_bhwords`
- **英文词库**：`http://oss.wodedata.com/db/mykeyboard_enwords`
- **五笔词库**：`http://oss.wodedata.com/db/mykeyboard_wbwords`
- **Python 核心包**：`http://oss.wodedata.com/db/mykeyboard_pycore_bundle_zip`

### 手写输入配置

库支持书同文在线手写识别 API：

```objective-c
#define API_Handwritting_URLString @"https://hanzi.unihan.com.cn/api/qpen/res"
```

### 键盘设置

```objective-c
// 手写语言设置键
#define Key_Handwritting_Language @"Key_Handwritting_Language"

// 极速输入开关键
#define Key_TopSpeed_Input @"Key_TopSpeed_Input"

// 纯五笔模式开关键（默认不是纯五笔）
#define Key_isPureWubi @"Key_isPureWubi"
```

## 示例项目

要运行示例项目，请按以下步骤操作：

1. 克隆仓库
2. 从 Example 目录运行 `pod install`
3. 打开 `LWKBCore.xcworkspace`
4. 运行示例应用

示例代码展示了如何使用 `LWKBConfig` 类：

```objective-c
- (void)viewDidLoad {
    [super viewDidLoad];

    LWKBConfig *config = [LWKBConfig new];
    [config hellowrold];
}
```

## 核心类说明

### LWKBConfig

配置管理类，提供以下功能：

**实例方法：**
- `- (void)hellowrold`：测试方法，输出 "Hello World!" 到控制台

**类方法：**
- `+ (NSString *)userAgent`：获取随机用户代理字符串（从预定义的 18 个常用浏览器 UA 中随机选择）
- `+ (NSString *)randomString`：生成基于设备 UUID 的随机字符串（去除连字符）

### LWKeyboardDefines.h

定义了键盘类型的枚举，用于标识不同的输入模式。使用位运算的方式，支持组合使用多种键盘类型。

### LWWordEngineDefines.h

定义了词库引擎相关的常量和配置，包括：
- 词库文件的 URL 地址
- 词库文件名
- 手写识别 API 配置
- 各种开关键名

## 项目结构

```
LWKBCore/
├── Classes/
│   ├── LWKBConfig.h              # 配置类头文件
│   ├── LWKBConfig.m              # 配置类实现
│   ├── LWKeyboardDefines.h       # 键盘类型定义
│   └── LWWordEngineDefines.h     # 词库引擎定义
├── Example/                      # 示例项目
├── LICENSE                       # MIT 许可证
├── README.md                     # 英文文档
├── README_ZH.md                  # 中文文档
└── LWKBCore.podspec             # CocoaPods 规格文件
```

## 注意事项

1. **App Group 配置**：使用前务必配置正确的 App Group，否则主应用和键盘扩展之间无法共享数据
2. **词库下载**：首次使用时需要从远程服务器下载词库文件，请确保网络连接正常
3. **手写识别**：手写功能依赖第三方 API，需要网络连接
4. **iOS 版本**：最低支持 iOS 8.0，但建议在 iOS 10.0 及以上版本使用以获得更好的体验

## 常见问题

**Q: 如何切换不同的键盘类型？**
A: 使用 `LWKeyboardDefines.h` 中定义的 `KeyboardType` 枚举来标识和切换不同的键盘类型。

**Q: 词库文件存储在哪里？**
A: 词库文件会下载到 App Group 的共享容器中，以便主应用和键盘扩展都能访问。

**Q: 可以自定义词库吗？**
A: 可以，您可以修改 `LWWordEngineDefines.h` 中的 URL 配置，指向您自己的词库服务器。

**Q: 如何启用纯五笔模式？**
A: 使用 `Key_isPureWubi` 键在 NSUserDefaults 中设置相应的值。

## 版本历史

### 1.0.0
- 初始版本发布
- 支持多种键盘类型
- 提供基础配置管理功能
- 支持远程词库下载
- 支持手写输入

## 贡献

欢迎提交 Issue 和 Pull Request！

## 作者

luowei - [luowei@wodedata.com](mailto:luowei@wodedata.com)

## 许可证

LWKBCore 基于 MIT 许可证开源。详细信息请查看 [LICENSE](LICENSE) 文件。

```
Copyright (c) 2020 luowei <luowei@wodedata.com>

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
```

## 相关链接

- [GitLab 仓库](https://gitlab.com/ioslibraries1/lwkbcore)
- [CocoaPods](https://cocoapods.org)
- [书同文手写识别](https://hanzi.unihan.com.cn)
