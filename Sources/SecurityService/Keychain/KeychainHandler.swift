//
//  KeychainHandler.swift
//  InterviewProject
//
//  Created by Gaganpreet Singh on 1/7/26.
//

import Foundation
enum SecurityError: Error {
    case keychainFailure(OSStatus)
    case fileWriteFailure(Error)
    case unknown
}

final class KeychainHandler: KeychainProtocols {
    
    private let keychainService: String
    
    init(service: String = "com.codehub97.security") {
        keychainService = service
    }

    func saveToKeychain(key: String, data: Data) throws {
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrService as String: keychainService,
            kSecAttrAccount as String: key,
            kSecValueData as String: data,
            kSecAttrAccessible as String: kSecAttrAccessibleWhenPasscodeSetThisDeviceOnly
        ]
        
        SecItemDelete(query as CFDictionary)  
        let status = SecItemAdd(query as CFDictionary, nil)
        if status != errSecSuccess {
            throw SecurityError.keychainFailure(status)
        }
    }
    
    func retrieveFromKeychain(key: String) -> Data? {
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrService as String: keychainService,
            kSecAttrAccount as String: key,
            kSecReturnData as String: true,
            kSecMatchLimit as String: kSecMatchLimitOne
        ]
        
        var result: AnyObject?
        let status = SecItemCopyMatching(query as CFDictionary, &result)
        return status == errSecSuccess ? result as? Data : nil
    }
}
