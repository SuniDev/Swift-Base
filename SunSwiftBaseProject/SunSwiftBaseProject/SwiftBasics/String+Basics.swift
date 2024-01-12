//
//  String+Basics.swift
//  SunSwiftBaseProject
//
//  Created by suni on 2024/01/05.
//

import Foundation

/// String 타입이 제공하는 기능(함수, 연산자, 프로퍼티 등) 테스트
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
