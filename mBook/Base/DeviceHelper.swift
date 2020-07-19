//
//  DeviceHelper.swift
//  mBook
//
//  Created by 郑月华 on 2020/07/03.
//  Copyright © 2020 Meal Book corp. All rights reserved.
//

import SwiftUI

struct DeviceHelper {
    static func getDeviceInfo()->DeviceInfo{
        DeviceInfo.init(deviceId: getDeviceId(), phoneName: phoneName(), appVersion: appVersion(), systemName: systemName(), systemVersion: systemVersion(), deviceIP: deviceIP())
    }
    static func createDeviceId()->String {
        let deviceId: String = UUID().uuidString
        _ = Keychain.save(key: Constants.KEY_CHAIN_DEVICE_ID, string: deviceId)
        return deviceId
    }
    
    static func getDeviceId() -> String {
        let deviceId = Keychain.loadString(key: Constants.KEY_CHAIN_DEVICE_ID)
        if (deviceId ?? "").isEmpty {
            return createDeviceId();
        } else {
            return deviceId!
        }
    }
    /// 获取iPhone名称
    static func phoneName() -> String {
        return UIDevice.current.name
    }

    /// 获取app版本号
    static func appVersion() -> String {
        return Bundle.main.infoDictionary!["CFBundleShortVersionString"] as! String
    }

    /// 获取电池电量
    static func batteryLevel() -> CGFloat {
        return CGFloat(UIDevice.current.batteryLevel)
    }

    /// 当前系统名称
    static func systemName() -> String {
        return UIDevice.current.systemName
    }

    /// 当前系统版本号
    static func systemVersion() -> String {
        return UIDevice.current.systemVersion
    }


    /// 获取当前设备IP
    static func deviceIP() -> String? {
        var addresses = [String]()
        var ifaddr : UnsafeMutablePointer<ifaddrs>? = nil
        if getifaddrs(&ifaddr) == 0 {
            var ptr = ifaddr
            while (ptr != nil) {
                let flags = Int32(ptr!.pointee.ifa_flags)
                var addr = ptr!.pointee.ifa_addr.pointee
                if (flags & (IFF_UP|IFF_RUNNING|IFF_LOOPBACK)) == (IFF_UP|IFF_RUNNING) {
                    if addr.sa_family == UInt8(AF_INET) || addr.sa_family == UInt8(AF_INET6) {
                        var hostname = [CChar](repeating: 0, count: Int(NI_MAXHOST))
                        if (getnameinfo(&addr, socklen_t(addr.sa_len), &hostname, socklen_t(hostname.count),nil, socklen_t(0), NI_NUMERICHOST) == 0) {
                            if let address = String(validatingUTF8:hostname) {
                                addresses.append(address)
                            }
                        }
                    }
                }
                ptr = ptr!.pointee.ifa_next
            }
            freeifaddrs(ifaddr)
        }
        return addresses.first
    }

}

