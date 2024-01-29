//
//  Operator+Basics.swift
//  SunSwiftBaseProject
//
//  Created by suni on 1/29/24.
//

import Foundation

class OperatorBasic {
    static func basic() {
        // MARK: 나머지 연산
        let intNum: Int = 10
        print(intNum % 3)   // 1
        
        let doubleNum: Double = 5.0
        print(doubleNum.truncatingRemainder(dividingBy: 1.5))   // 0.5
        print(doubleNum.truncatingRemainder(dividingBy: 2))     // 1.0
        print(12.truncatingRemainder(dividingBy: 2.5))          // 2.0
        
    }
}
