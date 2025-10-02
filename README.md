# LWKBCore

[![Version](https://img.shields.io/badge/version-1.0.0-blue.svg)](https://gitlab.com/ioslibraries1/lwkbcore)
[![License](https://img.shields.io/badge/license-MIT-green.svg)](https://gitlab.com/ioslibraries1/lwkbcore/blob/master/LICENSE)
[![Platform](https://img.shields.io/badge/platform-iOS%208.0%2B-orange.svg)](https://gitlab.com/ioslibraries1/lwkbcore)

[English](./README.md) | [中文版](./README_ZH.md)

---

## Table of Contents

- [Overview](#overview)
- [Core Features](#core-features)
- [Keyboard Types](#keyboard-types)
- [Requirements](#requirements)
- [Installation](#installation)
- [Getting Started](#getting-started)
- [Usage](#usage)
- [Configuration](#configuration)
- [Architecture](#architecture)
- [Project Structure](#project-structure)
- [Important Notes](#important-notes)
- [FAQ](#frequently-asked-questions-faq)
- [Contributing](#contributing)
- [Author](#author)
- [License](#license)

---

A comprehensive iOS keyboard core framework that provides multiple input methods and keyboard types for Chinese and English input. LWKBCore is designed specifically for custom input method development, offering robust support for various input modes including Pinyin, Wubi, stroke input, handwriting, and more.

## Overview

LWKBCore is a modular keyboard framework that serves as the foundation for building custom iOS keyboard extensions. It provides essential components for managing keyboard types, input methods, word databases, and configuration settings. The framework leverages App Group capabilities to enable seamless data sharing between the host app and keyboard extension.

## Core Features

### Keyboard Core Functionality

- **9 Different Keyboard Types**: Comprehensive support for various input modes with bitwise flag operations
- **Multiple Input Methods**:
  - **Pinyin Input**: Full keyboard (26-key) and 9-key pad modes
  - **Wubi Input**: Full keyboard support with pure Wubi mode option
  - **English Input**: Full keyboard for English typing
  - **Stroke Input**: 9-key pad with stroke-based Chinese character input
  - **Handwriting Recognition**: AI-powered handwriting input with online API
  - **Symbol Input**: Dedicated symbol keyboards (full and collection modes)
  - **Number Input**: 9-key numeric pad

- **Word Database Support**: Remote database resources for multiple input methods
- **Configuration Management**: Centralized settings with App Group support
- **Utility Functions**: User agent generation, random string generation, device identification

## Keyboard Types

LWKBCore defines 9 keyboard types using the `KeyboardType` enum with bitwise flags, allowing for flexible type combinations and efficient keyboard switching.

### Keyboard Type Definition

```objective-c
typedef NS_OPTIONS(NSUInteger, KeyboardType) {
    Keyboard_PingYingFull       = 1,        // Pinyin full keyboard (26-key)
    Keyboard_WuBiFull           = 1 << 1,   // Wubi full keyboard (26-key)
    Keyboard_ENFull             = 1 << 2,   // English full keyboard
    Keyboard_NumNine            = 1 << 3,   // Number 9-key pad
    Keyboard_PingYingNine       = 1 << 4,   // Pinyin 9-key pad
    Keyboard_BiHuaNine          = 1 << 5,   // Stroke 9-key pad
    Keyboard_SymbolCollection   = 1 << 6,   // Symbol collection keyboard
    Keyboard_SymbolFull         = 1 << 7,   // Full symbol keyboard
    Keyboard_HandWritting       = 1 << 8,   // Handwriting input keyboard
};
```

### Keyboard Type Details

| Type | Description | Enum Value | Bit Flag | Chinese Name |
|------|-------------|------------|----------|--------------|
| `Keyboard_PingYingFull` | Full Pinyin keyboard with 26 keys for standard Chinese input | 1 | 1 | 拼音全键 |
| `Keyboard_WuBiFull` | Full Wubi keyboard (26-key) for shape-based Chinese input | 2 | 1 << 1 | 全键盘五笔 |
| `Keyboard_ENFull` | Full English keyboard for English typing | 4 | 1 << 2 | 英文全键 |
| `Keyboard_NumNine` | Numeric 9-key pad for number input | 8 | 1 << 3 | 数字九键 |
| `Keyboard_PingYingNine` | Pinyin 9-key pad (T9-style) for compact Chinese input | 16 | 1 << 4 | 拼音九键 |
| `Keyboard_BiHuaNine` | Stroke-based 9-key pad for Chinese character input by strokes | 32 | 1 << 5 | 笔画九键 |
| `Keyboard_SymbolCollection` | Symbol collection keyboard for frequently used symbols | 64 | 1 << 6 | 符号方键 |
| `Keyboard_SymbolFull` | Full symbol keyboard with comprehensive symbol support | 128 | 1 << 7 | 符号全键 |
| `Keyboard_HandWritting` | Handwriting recognition input mode | 256 | 1 << 8 | 手写键盘 |

### Using Keyboard Types

```objective-c
#import <LWKBCore/LWKeyboardDefines.h>

// Single keyboard type
KeyboardType type = Keyboard_PingYingFull;

// Combine multiple keyboard types using bitwise OR
KeyboardType multiType = Keyboard_PingYingFull | Keyboard_ENFull | Keyboard_SymbolFull;

// Check if a specific keyboard type is enabled
if (keyboardTypes & Keyboard_HandWritting) {
    // Handwriting keyboard is enabled
}
```

## Configuration

### App Group Identifier

The framework uses App Group for data sharing between the host app and keyboard extension. This is essential for maintaining shared state and accessing word databases across app boundaries.

```objective-c
#define AppGroupIdentifer @"group.com.wodedata.LWInputMethod"
```

**Setup Requirements:**
1. Enable App Groups in Xcode project Capabilities
2. Add the App Group identifier to both host app and keyboard extension
3. Ensure both targets use the same identifier for data sharing

### Core Configuration (LWKBConfig)

The `LWKBConfig` class provides essential configuration and utility methods:

```objective-c
#import <LWKBCore/LWKBConfig.h>

// Instance methods
LWKBConfig *config = [LWKBConfig new];
[config hellowrold];  // Test method - outputs "Hello World!" to console

// Class methods
NSString *userAgent = [LWKBConfig userAgent];      // Random user agent from 18 predefined browsers
NSString *randomStr = [LWKBConfig randomString];   // Device UUID-based random string
```

### Input Method Support

#### 1. Pinyin Input Method

LWKBCore supports both full keyboard and 9-key Pinyin input modes:

- **Full Keyboard** (`Keyboard_PingYingFull`): 26-key QWERTY layout for Pinyin input
- **9-Key Pad** (`Keyboard_PingYingNine`): T9-style compact layout for mobile devices

**Configuration:**
```objective-c
// Pinyin database
#define PinYinURLString @"http://oss.wodedata.com/db/mykeyboard_pinyin"
#define PinYinFileName @"mykeyboard_pinyin"

// Pinyin core bundle (includes pronunciation rules, tone marks, etc.)
#define PyCoreBundleURLString @"http://oss.wodedata.com/db/mykeyboard_pycore_bundle_zip"
#define PyCoreBundleDirName @"pycore.bundle"

// Top speed input mode - enables fast input optimization
#define Key_TopSpeed_Input @"Key_TopSpeed_Input"
```

#### 2. Wubi Input Method

Shape-based Chinese input method with full keyboard support:

**Configuration:**
```objective-c
// Wubi word database
#define WBwordsURLString @"http://oss.wodedata.com/db/mykeyboard_wbwords"
#define WBwordsFileName @"mykeyboard_wbwords"

// Pure Wubi mode - when enabled, only shape-based input (no Pinyin fallback)
#define Key_isPureWubi @"Key_isPureWubi"  // Default: NO

// Usage
[[NSUserDefaults standardUserDefaults] setBool:YES forKey:Key_isPureWubi];
```

#### 3. Stroke Input Method (Bihua)

Stroke-based Chinese character input using 9-key pad:

**Configuration:**
```objective-c
// Stroke database - maps stroke sequences to characters
#define BiHuaURLString @"http://oss.wodedata.com/db/mykeyboard_bhwords"
#define BiHuaFileName @"mykeyboard_bhwords"

// Use Keyboard_BiHuaNine type
KeyboardType strokeKeyboard = Keyboard_BiHuaNine;
```

#### 4. Handwriting Input Method

AI-powered handwriting recognition with online API support:

**Configuration:**
```objective-c
// Handwriting recognition API (Unihan Shuzongwen service)
#define API_Handwritting_URLString @"https://hanzi.unihan.com.cn/api/qpen/res"

// Language preference for handwriting recognition
#define Key_Handwritting_Language @"Key_Handwritting_Language"

// Usage
[[NSUserDefaults standardUserDefaults] setObject:@"zh-Hans" forKey:Key_Handwritting_Language];
```

**Features:**
- Real-time handwriting recognition
- Support for simplified and traditional Chinese
- Online API with high accuracy
- Stroke order analysis

#### 5. English Input Method

Full keyboard support for English typing:

**Configuration:**
```objective-c
// English word database
#define EnwordsURLString @"http://oss.wodedata.com/db/mykeyboard_enwords"
#define EnwordsFileName @"mykeyboard_enwords"

// Use Keyboard_ENFull type
KeyboardType englishKeyboard = Keyboard_ENFull;
```

#### 6. Symbol Input Methods

Two symbol keyboard modes for special character input:

**Configuration:**
```objective-c
// Emoji and symbol database
#define EmojiAndSymbolURLString @"http://oss.wodedata.com/db/mykeyboard_emoji_symbols"
#define EmojiAndSymbolFileName @"emoji_symbols"

// Symbol collection (frequently used symbols)
KeyboardType symbolCollection = Keyboard_SymbolCollection;

// Full symbol keyboard (comprehensive symbol library)
KeyboardType symbolFull = Keyboard_SymbolFull;
```

#### 7. Additional Language Support

**Traditional Chinese & Mars Language:**
```objective-c
// Traditional Chinese and Mars language database
#define TranditionalAndMarURLString @"http://oss.wodedata.com/db/mykeyboard_traditional_mars"
#define TranditionalAndMarsFileName @"traditional_mars"
```

**Dictionary Support:**
```objective-c
// Dictionary database for word definitions and lookups
#define ZidianURLString @"http://oss.wodedata.com/db/mykeyboard_zidian"
#define ZidianFileName @"mykeyboard_zidian"
```

### Database Resources Summary

All word databases are hosted remotely and downloaded on-demand:

| Database | URL | File Name | Purpose |
|----------|-----|-----------|---------|
| Emoji & Symbols | `http://oss.wodedata.com/db/mykeyboard_emoji_symbols` | `emoji_symbols` | Emoji and symbol characters |
| Traditional & Mars | `http://oss.wodedata.com/db/mykeyboard_traditional_mars` | `traditional_mars` | Traditional Chinese & Mars language |
| Dictionary | `http://oss.wodedata.com/db/mykeyboard_zidian` | `mykeyboard_zidian` | Word definitions and lookups |
| Pinyin Core | `http://oss.wodedata.com/db/mykeyboard_pycore_bundle_zip` | `pycore.bundle` | Pinyin core rules (bundled) |
| Pinyin Words | `http://oss.wodedata.com/db/mykeyboard_pinyin` | `mykeyboard_pinyin` | Pinyin word database |
| Stroke Words | `http://oss.wodedata.com/db/mykeyboard_bhwords` | `mykeyboard_bhwords` | Stroke-based input database |
| English Words | `http://oss.wodedata.com/db/mykeyboard_enwords` | `mykeyboard_enwords` | English word database |
| Wubi Words | `http://oss.wodedata.com/db/mykeyboard_wbwords` | `mykeyboard_wbwords` | Wubi input database |

## Requirements

- iOS 8.0 or higher
- Xcode 8.0 or higher
- CocoaPods for dependency management

## Installation

### Using CocoaPods

LWKBCore is available through [CocoaPods](https://cocoapods.org). To install it, simply add the following line to your Podfile:

```ruby
pod 'LWKBCore'
```

Then run:

```bash
pod install
```

### Manual Installation

1. Clone the repository
2. Add all files from `LWKBCore/Classes` directory to your project
3. Configure App Groups in both host app and keyboard extension

## Getting Started

### Prerequisites

Before using LWKBCore, ensure you have:

1. **App Groups Enabled**: Configure App Groups in your Xcode project's Capabilities tab for both the host app and keyboard extension
2. **Network Access**: First-time usage requires internet connection to download word databases
3. **Minimum iOS Version**: iOS 8.0+ (iOS 10.0+ recommended for optimal performance)

### Example Project

To run the example project and see LWKBCore in action:

```bash
cd Example
pod install
open LWKBCore.xcworkspace
```

The example demonstrates:
- Basic configuration setup
- Keyboard type selection and switching
- Utility function usage
- App Group integration
- Database management

## Usage

### Quick Start

Import the framework headers in your code:

```objective-c
#import <LWKBCore/LWKBCore.h>
#import <LWKBCore/LWKBConfig.h>
#import <LWKBCore/LWKeyboardDefines.h>
#import <LWKBCore/LWWordEngineDefines.h>
```

### Basic Setup

```objective-c
// Initialize configuration
LWKBConfig *config = [LWKBConfig new];
[config hellowrold];  // Test output - prints "Hello World!" to console

// Get user agent for network requests
// Returns a random user agent from 18 predefined browsers
NSString *userAgent = [LWKBConfig userAgent];

// Generate random identifier based on device UUID
NSString *identifier = [LWKBConfig randomString];
```

### Keyboard Type Management

```objective-c
// Select single keyboard type
KeyboardType type = Keyboard_PingYingFull;

// Combine multiple keyboard types using bitwise OR
KeyboardType multiType = Keyboard_PingYingFull | Keyboard_ENFull | Keyboard_SymbolFull;

// Check if specific keyboard type is enabled
if (currentType & Keyboard_HandWritting) {
    // Initialize handwriting input
}

// Switch between keyboard types
KeyboardType newType = Keyboard_WuBiFull;
```

### Input Method Configuration

```objective-c
// Enable top speed input mode for faster typing
[[NSUserDefaults standardUserDefaults] setBool:YES forKey:Key_TopSpeed_Input];

// Enable pure Wubi mode (no Pinyin fallback)
[[NSUserDefaults standardUserDefaults] setBool:YES forKey:Key_isPureWubi];

// Set handwriting language preference
[[NSUserDefaults standardUserDefaults] setObject:@"zh-Hans" forKey:Key_Handwritting_Language];
```

### Database Management

```objective-c
// Access database URLs for downloading
NSString *pinyinURL = PinYinURLString;
NSString *wubiURL = WBwordsURLString;
NSString *emojiURL = EmojiAndSymbolURLString;

// Use App Group for shared storage
NSUserDefaults *sharedDefaults = [[NSUserDefaults alloc] initWithSuiteName:AppGroupIdentifer];
```

## Architecture

The framework consists of three core components:

### 1. LWKBConfig
**Purpose**: Configuration management and utility functions

**Key Features:**
- User agent generation (18 predefined browser UAs)
- Random string generation (device UUID-based)
- App Group identifier definition
- Test methods for validation

**Files:** `LWKBConfig.h`, `LWKBConfig.m`

### 2. LWKeyboardDefines
**Purpose**: Keyboard type definitions and enumerations

**Key Features:**
- `KeyboardType` enum with 9 input modes
- Bitwise flag operations for keyboard combinations
- Type checking and validation
- Support for custom keyboard types

**Files:** `LWKeyboardDefines.h`

### 3. LWWordEngineDefines
**Purpose**: Input engine configuration and database constants

**Key Features:**
- Remote database URL definitions
- Database file name constants
- Input method API endpoints
- Configuration key definitions
- Handwriting recognition API integration

**Files:** `LWWordEngineDefines.h`

## Project Structure

```
LWKBCore/
├── Classes/
│   ├── LWKBConfig.h              # Configuration class header
│   ├── LWKBConfig.m              # Configuration implementation
│   ├── LWKeyboardDefines.h       # Keyboard type definitions
│   └── LWWordEngineDefines.h     # Word engine & database definitions
├── Example/                      # Example project
│   ├── LWKBCore/                 # Example app code
│   └── Podfile                   # CocoaPods dependencies
├── LICENSE                       # MIT License
├── README.md                     # English documentation
├── README_ZH.md                  # Chinese documentation
└── LWKBCore.podspec             # CocoaPods specification
```

## Important Notes

### Critical Configuration Requirements

1. **App Group Configuration**:
   - **MUST** be properly configured in Xcode Capabilities for both host app and keyboard extension
   - Use the identifier: `group.com.wodedata.LWInputMethod` (or customize and update in `LWWordEngineDefines.h`)
   - Without proper configuration, data sharing between app and extension will fail

2. **Network Access**:
   - First-time usage requires internet connection to download word databases
   - All databases are hosted remotely and cached locally after download
   - Ensure network permissions are granted

3. **Handwriting Recognition**:
   - Requires internet connection to access the Unihan Shuzongwen API
   - API endpoint: `https://hanzi.unihan.com.cn/api/qpen/res`
   - Real-time recognition requires stable network connection

4. **iOS Version Compatibility**:
   - Minimum: iOS 8.0
   - Recommended: iOS 10.0+ for optimal performance
   - Latest iOS versions recommended for best experience

5. **Database Storage**:
   - All databases are stored in the App Group shared container
   - Local caching reduces subsequent load times
   - Consider disk space when using multiple input methods

### Performance Considerations

- **Initial Load Time**: First launch requires database downloads (may take a few seconds depending on network speed)
- **Memory Usage**: Multiple keyboard types may increase memory footprint
- **Database Size**: Plan for adequate storage space for word databases

### Security & Privacy

- **Secure Storage**: Sensitive data should be stored using secure methods
- **Network Requests**: All database URLs use HTTP - consider implementing HTTPS if deploying to production
- **User Data**: Framework does not collect or transmit user input data

## Frequently Asked Questions (FAQ)

### Q: How do I switch between different keyboard types?

**A:** Use the `KeyboardType` enum defined in `LWKeyboardDefines.h`. You can combine multiple types using bitwise OR operations:

```objective-c
KeyboardType type = Keyboard_PingYingFull | Keyboard_ENFull;
```

### Q: Where are the database files stored?

**A:** Database files are downloaded to the App Group shared container, accessible by both the host app and keyboard extension. This enables seamless data sharing and persistence.

### Q: Can I customize the word databases?

**A:** Yes! You can modify the URL constants in `LWWordEngineDefines.h` to point to your own database servers:

```objective-c
#define PinYinURLString @"https://your-server.com/custom-pinyin-db"
```

### Q: How do I enable pure Wubi mode?

**A:** Set the `Key_isPureWubi` preference in NSUserDefaults:

```objective-c
[[NSUserDefaults standardUserDefaults] setBool:YES forKey:Key_isPureWubi];
```

### Q: What languages does handwriting recognition support?

**A:** The handwriting API supports:
- Simplified Chinese (zh-Hans)
- Traditional Chinese (zh-Hant)

Set the language using:
```objective-c
[[NSUserDefaults standardUserDefaults] setObject:@"zh-Hans" forKey:Key_Handwritting_Language];
```

### Q: How can I improve input performance?

**A:** Enable top speed input mode:

```objective-c
[[NSUserDefaults standardUserDefaults] setBool:YES forKey:Key_TopSpeed_Input];
```

### Q: Are there any dependencies?

**A:** LWKBCore has minimal dependencies and uses standard iOS frameworks. When using CocoaPods, all dependencies are automatically managed.

## Contributing

Contributions are welcome! Here's how you can contribute:

1. **Fork the Repository**: Create your own fork of the project
2. **Create a Feature Branch**: `git checkout -b feature/amazing-feature`
3. **Make Your Changes**: Implement your feature or bug fix
4. **Test Thoroughly**: Ensure your changes work correctly
5. **Commit Your Changes**: `git commit -m 'Add amazing feature'`
6. **Push to Branch**: `git push origin feature/amazing-feature`
7. **Open a Pull Request**: Submit your changes for review

### Contribution Guidelines

- Follow existing code style and conventions
- Add comments for complex logic
- Update documentation for new features
- Test on multiple iOS versions if possible
- Include example usage for new features

## Author

**luowei**
- Email: [luowei@wodedata.com](mailto:luowei@wodedata.com)
- GitLab: [@ioslibraries1](https://gitlab.com/ioslibraries1)

## License

LWKBCore is available under the **MIT License**. See the [LICENSE](./LICENSE) file for more details.

```text
MIT License

Copyright (c) 2025 luowei

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
```

---

## Support & Resources

### Links

- **Repository**: [GitLab - LWKBCore](https://gitlab.com/ioslibraries1/lwkbcore)
- **CocoaPods**: [LWKBCore Pod](https://cocoapods.org/pods/LWKBCore)
- **Handwriting API**: [Unihan Shuzongwen](https://hanzi.unihan.com.cn)

### Getting Help

- **Issues**: Report bugs or request features via [GitLab Issues](https://gitlab.com/ioslibraries1/lwkbcore/issues)
- **Discussions**: Join the community discussions on GitLab
- **Email Support**: Contact the author at [luowei@wodedata.com](mailto:luowei@wodedata.com)

### Related Projects

If you're building custom keyboards for iOS, you might also be interested in:
- Custom keyboard UI components
- Input method engines
- Word database generators
- Handwriting recognition libraries

---

<div align="center">
  <strong>Made with ❤️ for iOS developers</strong>
  <br>
  <sub>Building better Chinese input experiences</sub>
</div>
