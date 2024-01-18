//
//  UUidManager.swift
//  E4Pay
//
//  Created by 20-N311 on 1/17/24.
//

import Foundation
import UIKit

class UUIDManager {
    static let shared = UUIDManager()

    private init() {}

    func getDeviceUUID() -> String {
        if let uuid = UIDevice.current.identifierForVendor?.uuidString {
            return uuid
        } else {
            return "UUID not available"
        }
    }
}
