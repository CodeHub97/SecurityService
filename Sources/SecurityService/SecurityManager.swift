//
//  SecurityManager.swift
//  InterviewProject
//
//  Created by Gaganpreet Singh on 1/7/26.



public enum SecurityManager {
    public static func makeHandler() -> SecurityService {
        SecurityHandler()
    }
}
