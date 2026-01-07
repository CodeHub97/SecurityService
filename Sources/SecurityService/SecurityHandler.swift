//
//  SecurityHandler.swift
//  InterviewProject
//
//  Created by Gaganpreet Singh on 1/7/26.
//

import Foundation

final class SecurityHandler: SecurityService {
    private let keychain = KeychainHandler()
    
    func saveSenstiveData(with key: String, data: Data ) {
        do {
          try keychain.saveToKeychain(key: key, data: data)
        }catch {
            
        }
    }
}
