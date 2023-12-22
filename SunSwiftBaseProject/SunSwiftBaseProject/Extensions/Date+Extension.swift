//
//  Date+Extension.swift
//  SunSwiftBaseProject
//
//  Created by suni on 2023/12/22.
//

import Foundation

extension Date {

    /**
     # formatted
     - Parameters:
        - format: 변형할 DateFormat
     - Note: DateFormat으로 변형한 String 반환
    */
    public func formatted(_ format: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        formatter.timeZone = TimeZone(identifier: TimeZone.current.identifier)!
        
        return formatter.string(from: self)
    }
    
    
    /**
     # currentTimeInMilli
     - Note: 현재 시간의 밀리초 반환
    */
    public static func currentTimeInMilli() -> Int {
        return Date().timeInMilli()
    }
    
    /**
     # timeInMilli
     - Note: timeIntervalSince1970의 밀리초 반환
    */
    public func timeInMilli() -> Int {
        return Int(self.timeIntervalSince1970 / 1000.0)
    }
    
    /**
     # dateCompare
     - Parameters:
        - fromDate: 비교 대상 Date
     - Note: 두 날짜간 비교해서 과거(Future)/현재(Same)/미래(Past) 반환
    */
    public func dateCompare(fromDate:Date) -> String {
        var strDateMessage:String = ""
        let result:ComparisonResult = self.compare(fromDate)
        switch result {
        case .orderedAscending:
            strDateMessage = "Future"
            break
        case .orderedDescending:
            strDateMessage = "Past"
            break
        case .orderedSame:
            strDateMessage = "Same"
            break
        default:
            strDateMessage = "Error"
            break
        }
        return strDateMessage
    }
}
