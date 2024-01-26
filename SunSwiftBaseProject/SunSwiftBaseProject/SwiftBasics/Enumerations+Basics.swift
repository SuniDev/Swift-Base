//
//  Enumerations+Basics.swift
//  SunSwiftBaseProject
//
//  Created by suni on 1/24/24.
//

import Foundation

class EnumerationsBasics {
    // MARK: Enumerations 기본
    // Pay Enumerations 선언
    enum Pay: String {
        case cash   = "현금"
        case card   = "카드"
        case kakaopay
        case etc    = "기타"
        case empty  = "결제 종류 없음"
    }
    enum Numbers: Int {
        case zero, one, two
        case ten = 10
    }
    
    static func basic() {
        // Enumerations 변수 생성 및 값 변경
        var userPay: Pay = Pay.empty
        // 같은 타입인 Pay 내부의 항목으로만 변경 가능
        userPay = .card
        
        // Raw Values 사용
        print("회원님의 결제 타입은 '\(userPay.rawValue)' 입니다.") // 회원님의 결제 타입은 '카드' 입니다.
        
        // Raw Values 자동 처리
        // String enum
        let myPay = Pay.kakaopay
        print("나의 결제 타입은 '\(myPay.rawValue)' 입니다.") // 나의 결제 타입은 'kakaopay' 입니다.
        
        // Int enum
        print("\(Numbers.zero.rawValue) - \(Numbers.one.rawValue) - \(Numbers.two.rawValue) - \(Numbers.ten.rawValue)")
        // 0 - 1 - 2 - 10
        
        // Raw Values를 사용한 enum 초기화﻿
        var card = Pay(rawValue: "카드")  // card
        var kakaoPay = Pay(rawValue: "카카오 페이") // nil
    }
    
    static func associatedValuesTest() {
        // Associated Values을 가지는 Enumerations
        enum Menu {
            case set(burger: String, drink: String)
            case single(burger: String)
        }
        
        // 사용
        var order: Menu = Menu.single(burger: "불고기") // 불고기 버거 단품
        order = .set(burger: "치즈", drink: "콜라")   // 치즈 버거 + 콜라 세트
    }
    
    static func associatedValuesTest2() {
        enum Burger {
            case bulgogi
            case shrimp
            case cheese
        }
        
        enum Drink {
            case coke
            case fanta
        }
        
        // Associated Values을 가지는 Enumerations
        enum Menu {
            case set(burger: Burger, drink: Drink)
            case single(burger: Burger)
        }
        
        // 사용
        var order: Menu = Menu.single(burger: .bulgogi) // 불고기 버거 단품
        order = .set(burger: .cheese, drink: .coke)   // 치즈 버거 + 콜라 세트
    }
    
    // MARK: 항목 순회 - CaseIterable
    static func caseIterableBasic() {
        // CaseIterable Protocol을 채택한 Enumeration
        enum Color: CaseIterable {
            case red, green, blue, yellow
        }

        // CaseIterable 프로토콜을 채택했기 때문에 allCases 속성을 통해 모든 케이스를 얻을 수 있다.
        let allColors = Color.allCases
        for color in allColors {
            print(color)    // red green blue yellow
        }
    }
    
    static func caseIterableExample() {
        // 플랫폼별 사용 조건을 추가하는 경우 : available 속성을 갖는 Enumeration
        enum Color: CaseIterable {
            case red, green, blue, yellow
            @available(iOS 13.0, *)
            case white
            
            // allCases 를 직접 구현
            static var allCases: [Color] {
                let all: [Color] = [.red, .green, .blue, .yellow]
                #if os(iOS)
                return all + [.white]
                #else
                return all
                #endif
            }
        }
        
        let allColors = Color.allCases
        for color in allColors {
            print(color)    // 실행환경에 따라 다른 결과
        }
    }
    
    static func caseIterableExample2() {
        enum Burger: CaseIterable {
            case bulgogi
            case shrimp
            case cheese
        }
        
        enum Drink: CaseIterable {
            case coke
            case fanta
        }
        
        // Associated Values을 가지는 Enumerations
        enum Menu: CaseIterable {
            case set(burger: Burger, drink: Drink)
            case single(burger: Burger)
            
            static var allCases: [Menu] {
                return Burger.allCases.reduce([]) { (result, burger) -> [Menu] in
                    result + Drink.allCases.map { (drink) -> Menu in
                        Menu.set(burger: burger, drink: drink)
                    }
                }
                + Burger.allCases.map(Menu.single)
            }
        }
        
        print(Menu.allCases.count)  // 9 : 모든 경우의 수
        print(Menu.allCases)        // 모든 경우의 항목(case) 컬렉션
    }
    
    // MARK: Recurcive Enumerations - indirect
    // case에 한정 적용
//    enum ArithmeticExpression {
//        case number(Int)
//        indirect case addition(ArithmeticExpression, ArithmeticExpression)
//        indirect case multiplication(ArithmeticExpression, ArithmeticExpression)
//    }
    // Enumerations 전체에 적용
    indirect enum ArithmeticExpression {
        case number(Int)
        case addition(ArithmeticExpression, ArithmeticExpression)
        case multiplication(ArithmeticExpression, ArithmeticExpression)
    }
    
    // ArithmeticExpression 계산을 도와주는 Recursive Function
    func evaluate(_ expression: ArithmeticExpression) -> Int {
        switch expression {
        case let .number(value):
            return value
        case let .addition(left, right):
            return evaluate(left) + evaluate(right)
        case let .multiplication(left, right):
            return evaluate(left) * evaluate(right)
        }
    }
    
    func recurciveEnumerationsExample() {
        let six = ArithmeticExpression.number(6)
        let three = ArithmeticExpression.number(3)
        let sum = ArithmeticExpression.addition(six, three)
        let final = ArithmeticExpression.multiplication(sum, ArithmeticExpression.number(2))
        
        let result: Int = evaluate(final)
        print("(6 + 3) * 2 = \(result)")    // (6 + 3) * 2 = 18
    }
    
    // MARK: 비교 가능한 Enumerations - Comparable
    static func comparableExample() {
        enum AppleDevice: Comparable {
            case iPhone
            case iPad
            case macBook
            case iMac
        }
        
        let myDevice: AppleDevice = .iMac
        let yourDevice: AppleDevice = .iPhone
        
        if myDevice > yourDevice {
            print("제 디바이스가 더 크네요!")
        } else if myDevice < yourDevice {
            print("당신의 디바이스가 더 크네요!")
        } else {
            print("우리 디바이스가 같네요!")
        }
        // 제 디바이스가 더 크네요!
    }
    
    static func comparableExample2() {
        enum AppleDevice: Comparable {
            case iPhone(version: String)
            case iPad(version: String)
            case macBook
            case iMac
        }
        
        var devices: [AppleDevice] = []
        devices.append(.iMac)
        devices.append(.iPhone(version: "6.1"))
        devices.append(.iPhone(version: "14.3"))
        devices.append(.iPad(version: "10.3"))
        devices.append(.macBook)
        
        let sortedDevices: [AppleDevice] = devices.sorted()
        print(sortedDevices)
        // [AppleDevice.iPhone(version: "14.3"), AppleDevice.iPhone(version: "6.1"), AppleDevice.iPad(version: "10.3"), AppleDevice.macBook, AppleDevice.iMac]
    }
    
}
