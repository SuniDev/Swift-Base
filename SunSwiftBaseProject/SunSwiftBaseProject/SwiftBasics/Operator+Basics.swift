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
        
        // MARK: 참조 비교 연산자 ===
        let referenceA: referenceClass = referenceClass()
        let referenceB: referenceClass = referenceClass()
        let referenceC: referenceClass = referenceA
        
        // 같은 인스턴스를 가리킨다.
        print(referenceA === referenceB)    // false
        print(referenceA === referenceC)    // true
        
        // 같지 않은 인스턴스를 가리킨다
        print(referenceA !== referenceB)    // true
        print(referenceA !== referenceC)    // false
    }
}

class referenceClass { }

// MARK: 전위 연산자
// ! 연산자 오버 로드
prefix func ! (value: String) -> Bool {
    return value.isEmpty
}

// 전위 연산자 사용자 정의 ++
prefix operator ++

prefix func ++ (value: Int) -> Int {
    return value + 1
}

// 사용자 정의 전위 연산자 ++ 오버 로드
prefix func ++ (value: String) -> String {
    return value + " " + value
}

extension OperatorBasic {
    static func prefixOperator() {
        let stringValue: String = "suni"
        print(!stringValue) // false
        
        let intValue: Int = 3
        print(++intValue)  // 4
        
        print(++stringValue) // suni suni
    }
}

// MARK: 후위 연산자
// 후위 연산자 사용자 정의 --
postfix operator --

postfix func -- (value: Int) -> Int {
    return value - 1
}

extension OperatorBasic {
    static func postfixOperator() {
        let intValue: Int = 20
        print(intValue--)   // 19
    }
}

// MARK: 우선 순위
// 전위 연산과 후위 연산 함께 테스트
// value의 제곱을 구하는 연산자 정의 **
prefix operator **

prefix func ** (value: Int) -> Int {
    return value * value
}

extension OperatorBasic {
    static func priorityOperator() {
        let value: Int = 5
        print(**value--)    // value-- = 4 -> **value = 16
    }
}

// MARK: 중위 연산자 정의와 구현

