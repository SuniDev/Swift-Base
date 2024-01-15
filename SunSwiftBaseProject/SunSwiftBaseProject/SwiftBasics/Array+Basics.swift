//
//  Array+Basics.swift
//  SunSwiftBaseProject
//
//  Created by suni on 1/12/24.
//

import Foundation

/// Array 타입이 제공하는 기능(함수, 연산자, 프로퍼티 등) 테스트
public class ArrayBasics {
        
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
    
    static func appendTest() {
        var names: Array<String> = ["suni", "zico", "mino"]
        
        names.append("alice")   // 마지막에 alice 추가
        print(names)            // ["suni", "zico", "mino", "alice"]
        
        names.append(contentsOf: ["pio", "junny"]) // 맨 마지막에 pio, junny 추가
        print(names)            // ["suni", "zico", "mino", "alice", "pio", "junny"]
    }
    
    static func insertTest() {
        var names: Array<String> = ["suni", "zico", "mino"]
        
        names.insert("alice", at: 2)    // 인덱스 2에 삽입
        print(names)                    // ["suni", "zico", "alice", "mino"]
        
        names.insert(contentsOf: ["pio", "junny"], at: 1)  // 인덱스 1의 위치에 pio, junny 삽입
        print(names)                                        // ["suni", "pio", "junny", "zico", "alice", "mino"]
    }
    
    static func removeTest() {
        var names: Array<String> = ["suni", "zico", "mino", "alice", "pio", "junny"]
        
        print(names.removeFirst())  // 첫번째 요소 제거 후 제거된 요소 반환 : suni
        print(names)    // ["zico", "mino", "alice", "pio", "junny"]
        
        print(names.removeLast())   // 마지막 요소 제거 후 제거된 요소 반환 : junny
        print(names)    // ["zico", "mino", "alice", "pio"]
        
        print(names.remove(at: 0))  // 인덱스 0번째 요소 제거 후 제거된 요소 반환 : zico
        print(names)    // ["mino", "alice", "pio"]
    }
}
