//
//  DataType+Basics.swift
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

// MARK: 문자열(String)
class StringBasics {
    
    // MARK: 여러 줄의 문자열 """
    var multiLineString: String = """
    안녕하세요! 저는 수니입니다.
    잘 부탁드립니다!
    """
    
    // MARK: 접두어
    func hasPrefix() {
        let blog: String = "DevSuni Blog"
        
        print(blog.hasPrefix("Dev"))    // true
        print(blog.hasPrefix("Suni"))   // false
    }
    
    // MARK: 접미어
    func hasSuffix() {
        let blog: String = "DevSuni Blog"
        
        print(blog.hasSuffix("Blog"))   // true
        print(blog.hasSuffix("blog"))   // false - 대소문자 구분
    }
    
    // MARK: 대문자 변환
    func upperCased() {
        let name: String = "suni"
        
        print(name.uppercased())    // SUNI
    }
    
    // MARK: 소문자 변환
    func lowerCassed() {
        let name: String = "SUNI"
        
        print(name.lowercased())    // suni
    }
    
    // MARK: 빈 문자열
    func isEmpty() {
        var greeting: String = "Hello"
        
        print(greeting.isEmpty) // false
        
        greeting = ""
        
        print(greeting.isEmpty) // true
    }
    
    // MARK: 문자열 길이
    func count() {
        let greeting: String = "Hello"
        
        print(greeting.count)   // 5
    }
    
    // MARK: 특수 문자
    func specialString() {
        print("줄바꿈 \n")
        print("백슬래시 \\")
        print("큰 따옴표 \"")
        print("탭 문자 \t")
    }
}
