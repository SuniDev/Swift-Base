//
//  Dictionary+Basics.swift
//  SunSwiftBaseProject
//
//  Created by suni on 1/12/24.
//

import Foundation

class DictionaryBasics {
    
    // MARK: 딕셔너리 생성
    // 키 - String / 값 - Int
    var ageForName1: Dictionary<String, Int> = Dictionary<String, Int>()
    var ageForName2: [String: Int] = [String: Int]()
    var ageForName3: [String: Int] = [:]
    var ageForName4: [String: Int] = ["suni": 25, "zico": 28, "mino": 27]
    
    // typealias를 사용하여 생성
    typealias StringIntDictionary = [String: Int]
    var ageForName5: StringIntDictionary = StringIntDictionary()
    
    // MARK: 기본 기능
    static func basicTest() {
        var ageForName: [String: Int] = ["suni": 25, "zico": 28, "mino": 27]
        
        print(ageForName.isEmpty)   // false
        print(ageForName.count)     // 3
        
        // 키에 해당하는 값 반환
        print(ageForName["suni"] ?? "suni is nil")   // 25
        // 키에 해당하는 값이 없으면 기본값을 반환하도록 할 수 있다.
        print(ageForName["pio", default: 0])   // 0
        
        // 값 수정
        ageForName["zico"] = 30
        print(ageForName["zico", default: 0])   // 30
        
        // 키:값 추가
        ageForName["somin"] = 35   // somin라는 키로 35라는 값을 추가
        print(ageForName["somin", default: 0])  // 35
        
        // 키에 해당하는 값을 삭제 후 삭제된 값 반환
        print(ageForName.removeValue(forKey: "suni") ?? "suni is nil")  // 25
        
        // 위에서 해당 값이 이미 삭제되었으므로 nil 반환
        print(ageForName.removeValue(forKey: "suni") ?? "suni is nil")  // suni is nil
    }
}
