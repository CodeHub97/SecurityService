// The Swift Programming Language
// https://docs.swift.org/swift-book

//
//  SecurityService.swift
//  InterviewProject
//
//  Created by Gaganpreet Singh on 1/7/26.
//

import Foundation

public protocol SecurityService {
    
    func saveSenstiveData(with key: String, data: Data )
    
}
