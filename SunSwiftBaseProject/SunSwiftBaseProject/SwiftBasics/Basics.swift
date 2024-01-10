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
    
    // MARK: 튜플(Tuple)
    func tupleTest() {
        // String, Int, Double 타입을 갖는 튜플
        var student: (name: String, grade: Int, score: Double) = ("suni", 2, 4.2)

        // 요소 이름을 사용해 값 사용
        print("이름: \(student.name), 학년: \(student.grade), 학점: \(student.score)")

        // 요소 이름을 사용해 값 할당
        student.grade = 3

        // 인덱스를 통해 값 사용
        print("이름: \(student.0), 학년: \(student.1), 학점: \(student.2)")
        
        // 인덱스를 통해 값 할당
        student.2 = 4.3
        
        
        // 튜플 별칭 지정
        typealias StudentTuple = (name: String, grade: Int, score: Double)

        let suni: StudentTuple = ("snui", 3, 4.3)
        let mora: StudentTuple = ("mora", 1, 4.4)

        print("이름: \(suni.name), 학년: \(suni.grade), 학점: \(suni.score)")
        print("이름: \(mora.name), 학년: \(mora.grade), 학점: \(mora.score)")
    }
}
