//
//  LWWordEngineDefines.swift
//  LWKBCore
//
//  Swift/SwiftUI version
//  Converted from Objective-C implementation
//

import Foundation
import UIKit

// MARK: - API Endpoints

/// Handwriting recognition API endpoint (书同文在线手写)
public let APIHandwritingURLString = "https://hanzi.unihan.com.cn/api/qpen/res"

// MARK: - User Defaults Keys

/// Key for handwriting language preference
public let KeyHandwritingLanguage = "Key_Handwritting_Language"

/// Key for top speed input preference
public let KeyTopSpeedInput = "Key_TopSpeed_Input"

/// Key for pure Wubi mode (default is false)
public let KeyIsPureWubi = "Key_isPureWubi"

// MARK: - Database URLs and File Names

/// Emoji and Symbol database URL
public let EmojiAndSymbolURLString = "http://oss.wodedata.com/db/mykeyboard_emoji_symbols"

/// Emoji and Symbol local file name
public let EmojiAndSymbolFileName = "emoji_symbols"

/// Traditional and Mars language database URL
public let TraditionalAndMarsURLString = "http://oss.wodedata.com/db/mykeyboard_traditional_mars"

/// Traditional and Mars language local file name
public let TraditionalAndMarsFileName = "traditional_mars"

/// Dictionary database URL
public let ZidianURLString = "http://oss.wodedata.com/db/mykeyboard_zidian"

/// Dictionary local file name
public let ZidianFileName = "mykeyboard_zidian"

/// Pinyin Core Bundle URL
public let PyCoreBundleURLString = "http://oss.wodedata.com/db/mykeyboard_pycore_bundle_zip"

/// Pinyin Core Bundle directory name
public let PyCoreBundleDirName = "pycore.bundle"

/// Pinyin database URL
public let PinYinURLString = "http://oss.wodedata.com/db/mykeyboard_pinyin"

/// Pinyin local file name
public let PinYinFileName = "mykeyboard_pinyin"

/// Stroke (BiHua) database URL
public let BiHuaURLString = "http://oss.wodedata.com/db/mykeyboard_bhwords"

/// Stroke (BiHua) local file name
public let BiHuaFileName = "mykeyboard_bhwords"

/// English words database URL
public let EnWordsURLString = "http://oss.wodedata.com/db/mykeyboard_enwords"

/// English words local file name
public let EnWordsFileName = "mykeyboard_enwords"

/// Wubi words database URL
public let WBWordsURLString = "http://oss.wodedata.com/db/mykeyboard_wbwords"

/// Wubi words local file name
public let WBWordsFileName = "mykeyboard_wbwords"

// MARK: - Resource Configuration

/// Configuration structure for word engine resources
public struct WordEngineResource {
    public let urlString: String
    public let fileName: String

    public init(urlString: String, fileName: String) {
        self.urlString = urlString
        self.fileName = fileName
    }

    public var url: URL? {
        return URL(string: urlString)
    }
}

// MARK: - Resource Registry

/// Registry of all available word engine resources
public struct WordEngineResourceRegistry {
    public static let emojiAndSymbol = WordEngineResource(
        urlString: EmojiAndSymbolURLString,
        fileName: EmojiAndSymbolFileName
    )

    public static let traditionalAndMars = WordEngineResource(
        urlString: TraditionalAndMarsURLString,
        fileName: TraditionalAndMarsFileName
    )

    public static let dictionary = WordEngineResource(
        urlString: ZidianURLString,
        fileName: ZidianFileName
    )

    public static let pinyin = WordEngineResource(
        urlString: PinYinURLString,
        fileName: PinYinFileName
    )

    public static let stroke = WordEngineResource(
        urlString: BiHuaURLString,
        fileName: BiHuaFileName
    )

    public static let english = WordEngineResource(
        urlString: EnWordsURLString,
        fileName: EnWordsFileName
    )

    public static let wubi = WordEngineResource(
        urlString: WBWordsURLString,
        fileName: WBWordsFileName
    )

    public static let allResources: [WordEngineResource] = [
        emojiAndSymbol,
        traditionalAndMars,
        dictionary,
        pinyin,
        stroke,
        english,
        wubi
    ]
}

// MARK: - Settings Manager

/// Manager for word engine settings
public class WordEngineSettings {
    public static let shared = WordEngineSettings()

    private let defaults = UserDefaults.standard

    private init() {}

    // MARK: - Handwriting Language

    /// Current handwriting language setting
    public var handwritingLanguage: String? {
        get {
            return defaults.string(forKey: KeyHandwritingLanguage)
        }
        set {
            defaults.set(newValue, forKey: KeyHandwritingLanguage)
        }
    }

    // MARK: - Top Speed Input

    /// Whether top speed input is enabled
    public var isTopSpeedInputEnabled: Bool {
        get {
            return defaults.bool(forKey: KeyTopSpeedInput)
        }
        set {
            defaults.set(newValue, forKey: KeyTopSpeedInput)
        }
    }

    // MARK: - Pure Wubi Mode

    /// Whether pure Wubi mode is enabled (default is false)
    public var isPureWubiMode: Bool {
        get {
            return defaults.bool(forKey: KeyIsPureWubi)
        }
        set {
            defaults.set(newValue, forKey: KeyIsPureWubi)
        }
    }

    // MARK: - Reset

    /// Resets all settings to default values
    public func resetToDefaults() {
        defaults.removeObject(forKey: KeyHandwritingLanguage)
        defaults.removeObject(forKey: KeyTopSpeedInput)
        defaults.removeObject(forKey: KeyIsPureWubi)
    }
}

// MARK: - SwiftUI Support

#if canImport(SwiftUI) && canImport(Combine)
import SwiftUI
import Combine

@available(iOS 13.0, *)
extension WordEngineSettings: ObservableObject {
    /// Published property for handwriting language (SwiftUI binding)
    public var publishedHandwritingLanguage: String {
        get {
            handwritingLanguage ?? ""
        }
        set {
            objectWillChange.send()
            handwritingLanguage = newValue.isEmpty ? nil : newValue
        }
    }

    /// Published property for top speed input (SwiftUI binding)
    public var publishedTopSpeedInput: Bool {
        get {
            isTopSpeedInputEnabled
        }
        set {
            objectWillChange.send()
            isTopSpeedInputEnabled = newValue
        }
    }

    /// Published property for pure Wubi mode (SwiftUI binding)
    public var publishedPureWubiMode: Bool {
        get {
            isPureWubiMode
        }
        set {
            objectWillChange.send()
            isPureWubiMode = newValue
        }
    }
}

@available(iOS 13.0, *)
public struct WordEngineSettingsView: View {
    @ObservedObject private var settings = WordEngineSettings.shared
    @State private var handwritingLanguage: String = ""
    @State private var topSpeedInput: Bool = false
    @State private var pureWubiMode: Bool = false

    public init() {
        _handwritingLanguage = State(initialValue: settings.handwritingLanguage ?? "")
        _topSpeedInput = State(initialValue: settings.isTopSpeedInputEnabled)
        _pureWubiMode = State(initialValue: settings.isPureWubiMode)
    }

    public var body: some View {
        Form {
            Section(header: Text("Handwriting")) {
                TextField("Language", text: $handwritingLanguage)
                    .onChange(of: handwritingLanguage) { newValue in
                        settings.handwritingLanguage = newValue
                    }
            }

            Section(header: Text("Input Options")) {
                Toggle("Top Speed Input", isOn: $topSpeedInput)
                    .onChange(of: topSpeedInput) { newValue in
                        settings.isTopSpeedInputEnabled = newValue
                    }

                Toggle("Pure Wubi Mode", isOn: $pureWubiMode)
                    .onChange(of: pureWubiMode) { newValue in
                        settings.isPureWubiMode = newValue
                    }
            }

            Section {
                Button("Reset to Defaults") {
                    settings.resetToDefaults()
                    handwritingLanguage = ""
                    topSpeedInput = false
                    pureWubiMode = false
                }
                .foregroundColor(.red)
            }
        }
        .navigationTitle("Word Engine Settings")
    }
}

@available(iOS 13.0, *)
struct WordEngineSettingsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            WordEngineSettingsView()
        }
    }
}
#endif
