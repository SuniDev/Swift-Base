//
//  Array+Extension.swift
//  SunSwiftBaseProject
//
//  Created by suni on 1/14/24.
//
import Foundation

extension Array {
    
    /**
     # contains<T>
     - Parameters: obj
     - Returns: Bool
     - Note: obj값을 현재 Array에서 포함하는지 여부를 반환
    */
    func contains<T>(obj: T) -> Bool where T : Equatable {
        return self.filter({$0 as? T == obj}).count > 0
    }
}


extension Array where Element: Equatable {
    /**
        # exists
        - Parameters:
           - item: Array의 Element
        - Returns: Bool
        - Note: 배열 안에 해당 item의 존재 여부를 반환
       */
    public func exists(_ item: Element) -> Bool {
           if let _ = self.indexOf(item) {
               return true
           }
           return false
       }
    
    /**
     # indexOf
     - Parameters:
        - item: 인덱스를 반환할 해당 Array의 Element
     - Returns: Int?
     - Note: 해당 Element의 인덱스를 반환. 존재하지 않으면 nil 반환
    */
    public func indexOf(_ item: Element) -> Int? {
        return self.enumerated().filter({ $0.element == item }).map({ $0.offset }).first
    }
    
    /**
        # remove
        - Parameters:
           - item: 제거할 Array의 Element
        - Returns: Int?
        - Note: item을 제거하고 해당 값을 반환
       */
    public mutating func remove(item: Element) -> Element? {
        if let index = indexOf(item) {
            return self.remove(at: index)
        }
        return nil
    }
    
    /**
     # removed
     - Parameters:
        - item: Array의 Element
     - Returns: Bool
     - Note: item을 제거한 배열을 반환
    */
    public func removed(_ item: Element) -> [Element] {
        return self.filter({ $0 != item })
    }
    
    
    /**
     # findAndReplace
     - Parameters:
        - selector: 변환할 배열 Element를 찾아 존재 여부를 반환
        - replaceWith: selector가 true이면 변환할 값
     - Returns: [Element]
     - Note: 배열 안에 해당 item이 존재하면 교체할 값으로 변경
    */
    public func findAndReplace(_ selector: (Element) -> Bool,
                               replaceWith: (Element) -> Element) -> [Element] {
        return map { item in selector(item) ? replaceWith(item) : item }
    }
    
    /**
     # toCommaString
     - Returns: String
     - Note: 배열을 콤마로 구분하여 String형으로 나열한 값을 반환
    */
    public func toCommaString() -> String {

        var result = ""
        for (i,data) in self.enumerated() {
            if i < self.count - 1 {
                result += "\(data),"
            } else {
                result += "\(data)"
            }
        }
        
        return result
    }
}

extension Array where Element == URLQueryItem {
    /**
     # toDictionary
     - Parameters:
     - Returns: [String: Any]
     - Note: URLQueryItem 형식 배열을 Dictionary로 변경
    */
    func toDictionary() -> [String: Any] {
        var dictionary = [String: Any]()
        for queryItem in self {
            guard let value = queryItem.value else { continue }
            if queryItem.name.contains("[]") {
                let key = queryItem.name.replacingOccurrences(of: "[]", with: "")
                let array = dictionary[key] as? [String] ?? []
                dictionary[key] = array + [value]
            } else {
                dictionary[queryItem.name] = value
            }
        }
        return dictionary
    }
}




