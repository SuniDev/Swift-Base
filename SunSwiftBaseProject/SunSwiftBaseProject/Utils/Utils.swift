//
//  Utils.swift
//  SunSwiftBaseProject
//
//  Created by suni on 2023/12/22.
//

// ** Common UI ** //

import UIKit

class Utils {
    static let STATUS_HEIGHT: CGFloat = UIApplication.shared.keyWindowInConnectedScenes?.windowScene?.statusBarManager?.statusBarFrame.height ?? 0  // 상태바 높이

    /**
     # safeAreaTopInset
     - Note: 현재 디바이스의 safeAreaTopInset값 반환
     */
    static func safeAreaTopInset() -> CGFloat {
        if #available(iOS 11.0, *) {
            let window = UIApplication.shared.keyWindowInConnectedScenes
            let topPadding = window?.safeAreaInsets.top
            return topPadding ?? Utils.STATUS_HEIGHT
        } else {
            return Utils.STATUS_HEIGHT
        }
    }
    
    /**
     # safeAreaBottomInset
     - Note: 현재 디바이스의 safeAreaBottomInset값 반환
     */
    static func safeAreaBottomInset() -> CGFloat {
        if #available(iOS 11.0, *) {
            let window = UIApplication.shared.keyWindowInConnectedScenes
            let bottomPadding = window?.safeAreaInsets.bottom
            return bottomPadding ??  0.0
        } else {
            return 0.0
        }
    }
    
    /**
     # version
     - Note: 현재 번들 버전 반환
     */
    static func version() -> String {
        return Bundle.main.infoDictionary!["CFBundleShortVersionString"] as! String
    }
    
    /**
     # isSimulator
     - Note: 시뮬레이터 구동 여부 반환
     */
    static func isSimulator() -> Bool {
        return ProcessInfo.processInfo.environment["SIMULATOR_DEVICE_NAME"] != nil
    }
    
    /**
     # openExternalLink
     - Parameters:
     - urlStr : String 타입 링크
     - handler : Completion Handler
     - Note: 외부 브라우저로 링크 오픈
     */
    static func openExternalLink(urlStr: String, _ handler:(() -> Void)? = nil) {
        guard let url = URL(string: urlStr) else {
            return
        }
        
        if #available(iOS 10.0, *) {
            UIApplication.shared.open(url, options: [:]) { (result) in
                handler?()
            }
            
        } else {
            UIApplication.shared.openURL(url)
            handler?()
        }
    }
    
    /**
     # getDeviceUUID
     - Note: 디바이스 고유 넘버 반환
     */
    static func getDeviceUUID() -> String {
        return UIDevice.current.identifierForVendor!.uuidString
    }
}
