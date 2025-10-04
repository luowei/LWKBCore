//
//  LWKBConfig.swift
//  LWKBCore
//
//  Swift/SwiftUI version
//  Converted from Objective-C implementation
//

import Foundation
import UIKit

/// App Group Identifier for shared data
public let AppGroupIdentifier = "group.com.wodedata.LWInputMethod"

/// Configuration class for LWKBCore library
@objc public class LWKBConfig: NSObject {

    // MARK: - Instance Methods

    /// Prints hello world message to console
    @objc public func helloWorld() {
        print("====:Hello World!")
    }

    // MARK: - Class Methods

    /// Returns a random user agent string from predefined list
    /// - Returns: Random user agent string
    @objc public static func userAgent() -> String {
        let userAgents = [
            "Mozilla/5.0 (Windows NT 6.1; rv:67.0) Gecko/20100101 Firefox/67.0",
            "Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101 Firefox/68.0",
            "Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:66.0) Gecko/20100101 Firefox/66.0",
            "Mozilla/5.0 (Android 8.1.0; Mobile; rv:66.0) Gecko/66.0 Firefox/66.0",
            "Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3724.8 Safari/537.36",
            "Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36",
            "Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36",
            "Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36",
            "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36",
            "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36",
            "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3788.1 Safari/537.36",
            "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/12.1.1 Safari/605.1.15",
            "Mozilla/5.0 (Windows NT 6.1; Trident/7.0; SLCC2; .NET CLR 2.0.50727; .NET CLR 3.5.30729; .NET CLR 3.0.30729; Media Center PC 6.0; .NET4.0C; .NET4.0E; rv:11.0) like Gecko",
            "Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36 OPR/60.0.3255.95",
            "Mozilla/5.0 (iPod; U; CPU iPhone OS 2_1 like Mac OS X; ja-jp) AppleWebKit/525.18.1 (KHTML, like Gecko) Version/3.1.1 Mobile/5F137 Safari/525.20",
            "Mozilla/5.0 (Linux; Android 7.0; VTR-AL00 Build/HUAWEIVTR-AL00; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/66.0.3359.126 MQQBrowser/6.2 TBS/044705 Mobile Safari/537.36 MMWEBID/9843 MicroMessenger/7.0.5.1440(0x27000537) Process/tools NetType/4G Language/zh_CN",
            "Mozilla/5.0 (iPhone; CPU iPhone OS 12_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Mobile/15E148 MicroMessenger/7.0.4(0x17000428) NetType/4G Language/zh_CN",
            "Mozilla/5.0 (iPhone; CPU iPhone OS 12_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Mobile/15E148 QQ/8.0.8.458 V1_IPH_SQ_8.0.8_1_APP_A Pixel/750 Core/WKWebView Device/Apple(iPhone 8) NetType/WIFI QBWebViewType/1 WKType/1"
        ]

        let randomIndex = Int.random(in: 0..<userAgents.count)
        return userAgents[randomIndex]
    }

    /// Generates a random string based on device UUID
    /// - Returns: Random string derived from device identifier
    @objc public static func randomString() -> String {
        guard let uuidString = UIDevice.current.identifierForVendor?.uuidString else {
            return UUID().uuidString.replacingOccurrences(of: "-", with: "")
        }
        return uuidString.replacingOccurrences(of: "-", with: "")
    }
}

// MARK: - SwiftUI Extensions

#if canImport(SwiftUI)
import SwiftUI

@available(iOS 13.0, *)
extension LWKBConfig {
    /// SwiftUI convenience property for user agent
    public static var swiftUIUserAgent: String {
        return userAgent()
    }

    /// SwiftUI convenience property for random string
    public static var swiftUIRandomString: String {
        return randomString()
    }
}
#endif
