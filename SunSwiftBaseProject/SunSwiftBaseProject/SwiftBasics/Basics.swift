//
//  Basics.swift
//  SunSwiftBaseProject
//
//  Created by suni on 1/9/24.
//

import Foundation

/// 데이터 타입 기본
class DataType {
    
    // MARK: 타입 별칭
    func typealiasTest() {
        // 타입 별칭 선언
        typealias MyInt = Int
        typealias YourInt = Int
        
        // 타입 별칭 사용
        let age: MyInt = 100
        var year: YourInt = 2080
        
        // 같은 타입으로 취급
        year = age
        print("year \(year) age \(age)")
    }
}
