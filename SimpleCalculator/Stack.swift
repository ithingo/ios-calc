//
//  Stack.swift
//  SimpleCalculator
//
//  Created by Admin on 27.12.16.
//  Copyright © 2016 vborodaev. All rights reserved.
//

import Foundation

struct Stack {
    fileprivate var array : [String] = []
    
    var isEmpty : Bool {
        return array.isEmpty
    }
    
    var count : Int {
        return array.count
    }
    
    mutating func push(_ pushedString : String) {
        array.append(pushedString)
    }
    
    mutating func pop() -> String? {
        return array.popLast()
    }
    
    mutating func peek() -> String{
        return array.last!
    }
}
