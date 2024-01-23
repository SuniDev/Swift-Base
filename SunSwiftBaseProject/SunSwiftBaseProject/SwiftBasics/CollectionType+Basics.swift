//
//  CollectionType+Basics.swift
//  SunSwiftBaseProject
//
//  Created by suni on 1/23/24.
//

import Foundation

// MARK: 컬렉션형
class CollectionType {
    // MARK: 임의의 요소 추출 및 되섞기
    static func randomTest() {
        var array: [Int] = [0, 1, 2, 3, 4]
        var set: Set<Int> = [0, 1, 2, 3, 4]
        var dictionary: [String: Int] = ["a": 1, "b": 2, "c": 3]
        var string: String = "string"

        print(array.randomElement())    // 임의의 요소 - Optional(3)
        
        print(array.shuffled()) // [0, 4, 2, 1, 3] : 뒤죽박죽된 배열
        print(array)            // [0, 1, 2, 3, 4] : array 내부는 그대로
        array.shuffle()     // array 자체를 뒤죽박죽으로 뒤섞기
        print(array)        // [0, 4, 3, 2, 1]
        
        print(set.shuffled())   // [3, 4, 2, 1, 0] : 세트를 뒤섞으면 배열로 반환
        //set.shuffle()         // ERROR: 세트는 순서가 없기 때문에 스스로 뒤섞일 수 없다.
        print(dictionary.shuffled())    // [(key: "b", value: 2), (key: "c", value: 3), (key: "a", value: 1)] : 딕셔너리는 뒤섞이면 (키, 값)이 쌍을 이룬 튜플의 배열을 반환
        print(string.shuffled())        // ["s", "g", "i", "r", "n", "t"] : String도 컬렉션!
    }
}
// MARK: 배열(Array)
class ArrayBasics {
        
    func countTest() {
        let names: Array<String> = ["suni", "zico", "mino"]
        
        print(names.count)  // 3
    }
    
    func emptyTest() {
        let emptyArray: [Any] = [Any]()
        
        print(emptyArray.isEmpty)   // true
    }
    
    static func firstLastTest() {
        let names: Array<String> = ["suni", "zico", "mino", "zico"]
        
        print(names.firstIndex(of: "zico") ?? "index nil")  // 1
        print(names.firstIndex(of: "pio") ?? "index nil")   // index nil
        
        print(names.first ?? "first nil")   // suni
        print(names.last ?? "last nil")     // zico
    }
    
    func appendTest() {
        var names: Array<String> = ["suni", "zico", "mino"]
        
        names.append("alice")   // 마지막에 alice 추가
        print(names)            // ["suni", "zico", "mino", "alice"]
        
        names.append(contentsOf: ["pio", "junny"]) // 맨 마지막에 pio, junny 추가
        print(names)            // ["suni", "zico", "mino", "alice", "pio", "junny"]
    }
    
    func insertTest() {
        var names: Array<String> = ["suni", "zico", "mino"]
        
        names.insert("alice", at: 2)    // 인덱스 2에 삽입
        print(names)                    // ["suni", "zico", "alice", "mino"]
        
        names.insert(contentsOf: ["pio", "junny"], at: 1)  // 인덱스 1의 위치에 pio, junny 삽입
        print(names)                                        // ["suni", "pio", "junny", "zico", "alice", "mino"]
    }
    
    func removeTest() {
        var names: Array<String> = ["suni", "zico", "mino", "alice", "pio", "junny"]
        
        print(names.removeFirst())  // 첫번째 요소 제거 후 제거된 요소 반환 : suni
        print(names)    // ["zico", "mino", "alice", "pio", "junny"]
        
        print(names.removeLast())   // 마지막 요소 제거 후 제거된 요소 반환 : junny
        print(names)    // ["zico", "mino", "alice", "pio"]
        
        print(names.remove(at: 0))  // 인덱스 0번째 요소 제거 후 제거된 요소 반환 : zico
        print(names)    // ["mino", "alice", "pio"]
    }
}

// MARK: Dictionary(딕셔너리)
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

// MARK: Set(세트)
class SetBasics {
    // MARK: 기본 기능
    static func basicTest() {
        var names1: Set<String> = Set<String>() // 빈 세트 생성
        var names2: Set<String> = []            // 빈 세트 생성

        // Array와 마찬가지로 대괄호 사용
        var names: Set<String> = ["suni", "zico", "mino", "suni"]

        // 그렇기 때문에 타입 추론을 사용하게 되면 컴파일러는 Array로 타입을 지정합니다.
        var numbers = [100, 200, 300]
        print(type(of: numbers))        // Array<Int>

        print(names.isEmpty)     // false
        print(names.count)       // 3 - 중복된 값은 허용되지 않아 suni는 1 개만 남음

        names.insert("somin")
        print(names.count)      // 4

        print(names.remove("zico"))     // zico
        print(names.remove("pio"))      // nil
    }
    
    // MARK: 집합 연산 활용
    static func setOperation() {
        let aStudents: Set<String> = ["suni", "zico", "mino"]
        let bStudents: Set<String> = ["suni", "pio", "june", "zico", "somin"]

        // 교집합 ["suni", "zico"]
        let intersectSet: Set<String> = aStudents.intersection(bStudents)
        print(intersectSet)

        // 여집합의 합(배타적 논리합) ["june", "mino", "pio", "somin"]
        let symmetricDiffSet: Set<String> = aStudents.symmetricDifference(bStudents)
        print(symmetricDiffSet)
        
        // 차집합 ["mino"]
        let subtractSet: Set<String> = aStudents.subtracting(bStudents)
        print(subtractSet)

        // 합집합 ["somin", "zico", "suni", "mino", "june", "pio"]
        let unionSet: Set<String> = aStudents.union(bStudents)
        print(unionSet)
        print(unionSet.sorted())    // ["june", "mino", "pio", "somin", "suni", "zico"]
    }
}
