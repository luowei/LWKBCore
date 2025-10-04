//
//  LWKeyboardDefines.swift
//  LWKBCore
//
//  Swift/SwiftUI version
//  Converted from Objective-C implementation
//

import Foundation
import UIKit

// MARK: - Keyboard Type Definition

/// Keyboard types available in the system
@objc public enum KeyboardType: UInt {
    // Regular keyboards
    case pingYinFull = 1        // Full pinyin keyboard
    case wuBiFull = 2           // Full wubi keyboard (1 << 1)
    case enFull = 4             // Full English keyboard (1 << 2)
    case numNine = 8            // Nine-key numeric keyboard (1 << 3)
    case pingYinNine = 16       // Nine-key pinyin keyboard (1 << 4)
    case biHuaNine = 32         // Nine-key stroke keyboard (1 << 5)
    case symbolCollection = 64  // Symbol collection keyboard (1 << 6)
    case symbolFull = 128       // Full symbol keyboard (1 << 7)
    case handWriting = 256      // Handwriting keyboard (1 << 8)

    // Specific keyboards (reserved for future use)
}

// MARK: - Swift OptionSet Version

/// Option set version of keyboard types for Swift convenience
public struct KeyboardTypeOptions: OptionSet {
    public let rawValue: UInt

    public init(rawValue: UInt) {
        self.rawValue = rawValue
    }

    // Regular keyboards
    public static let pingYinFull       = KeyboardTypeOptions(rawValue: 1 << 0)
    public static let wuBiFull          = KeyboardTypeOptions(rawValue: 1 << 1)
    public static let enFull            = KeyboardTypeOptions(rawValue: 1 << 2)
    public static let numNine           = KeyboardTypeOptions(rawValue: 1 << 3)
    public static let pingYinNine       = KeyboardTypeOptions(rawValue: 1 << 4)
    public static let biHuaNine         = KeyboardTypeOptions(rawValue: 1 << 5)
    public static let symbolCollection  = KeyboardTypeOptions(rawValue: 1 << 6)
    public static let symbolFull        = KeyboardTypeOptions(rawValue: 1 << 7)
    public static let handWriting       = KeyboardTypeOptions(rawValue: 1 << 8)

    // Convenience sets
    public static let allNineKey: KeyboardTypeOptions = [.numNine, .pingYinNine, .biHuaNine]
    public static let allFull: KeyboardTypeOptions = [.pingYinFull, .wuBiFull, .enFull, .symbolFull]
    public static let allSymbol: KeyboardTypeOptions = [.symbolCollection, .symbolFull]
}

// MARK: - SwiftUI Extensions

#if canImport(SwiftUI)
import SwiftUI

@available(iOS 13.0, *)
extension KeyboardType: CaseIterable {
    /// User-friendly display name for keyboard types
    public var displayName: String {
        switch self {
        case .pingYinFull:
            return "Pinyin Full Keyboard"
        case .wuBiFull:
            return "Wubi Full Keyboard"
        case .enFull:
            return "English Full Keyboard"
        case .numNine:
            return "Nine-Key Numeric"
        case .pingYinNine:
            return "Nine-Key Pinyin"
        case .biHuaNine:
            return "Nine-Key Stroke"
        case .symbolCollection:
            return "Symbol Collection"
        case .symbolFull:
            return "Full Symbol Keyboard"
        case .handWriting:
            return "Handwriting Keyboard"
        }
    }

    /// Localized display name (Chinese)
    public var localizedDisplayName: String {
        switch self {
        case .pingYinFull:
            return "拼音全键"
        case .wuBiFull:
            return "五笔全键"
        case .enFull:
            return "英文全键"
        case .numNine:
            return "数字九键"
        case .pingYinNine:
            return "拼音九键"
        case .biHuaNine:
            return "笔画九键"
        case .symbolCollection:
            return "符号方键"
        case .symbolFull:
            return "符号全键"
        case .handWriting:
            return "手写键盘"
        }
    }

    /// Whether this is a nine-key keyboard
    public var isNineKey: Bool {
        switch self {
        case .numNine, .pingYinNine, .biHuaNine:
            return true
        default:
            return false
        }
    }

    /// Whether this is a full keyboard
    public var isFullKeyboard: Bool {
        switch self {
        case .pingYinFull, .wuBiFull, .enFull, .symbolFull:
            return true
        default:
            return false
        }
    }
}

@available(iOS 13.0, *)
extension KeyboardTypeOptions {
    /// User-friendly display names for selected keyboard types
    public var displayNames: [String] {
        var names: [String] = []
        if contains(.pingYinFull) { names.append("Pinyin Full") }
        if contains(.wuBiFull) { names.append("Wubi Full") }
        if contains(.enFull) { names.append("English Full") }
        if contains(.numNine) { names.append("Numeric Nine-Key") }
        if contains(.pingYinNine) { names.append("Pinyin Nine-Key") }
        if contains(.biHuaNine) { names.append("Stroke Nine-Key") }
        if contains(.symbolCollection) { names.append("Symbol Collection") }
        if contains(.symbolFull) { names.append("Symbol Full") }
        if contains(.handWriting) { names.append("Handwriting") }
        return names
    }
}
#endif
