//
//  KeychainProtocols.swift
//  InterviewProject
//
//  Created by Gaganpreet Singh on 1/7/26.
//

import Foundation

protocol KeychainProtocols {
    func saveToKeychain(key: String, data: Data) throws
    func retrieveFromKeychain(key: String) -> Data? 
    
}
