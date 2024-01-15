//
//  String+Extension.swift
//  SunSwiftBaseProject
//
//  Created by suni on 1/15/24.
//

import Foundation

extension String.StringInterpolation {
    mutating func appendInterpolation<T>(
        _ value: T?,
        default: @autoclosure () -> String
    ) {
        self.appendLiteral(value.map(String.init(describing:)) ?? `default`())
    }
}
