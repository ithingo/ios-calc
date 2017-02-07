//
//  Stack.swift
//  SimpleCalculator
//
//  Created by Admin on 27.12.16.
//  Copyright © 2016 vborodaev. All rights reserved.
//

import Foundation

public class Stack {
    var stackArray = [String]()
    
    func push(pushedString : String) {
        self.stackArray.append(pushedString)
    }
    
    func pop() -> String? {
        if self.stackArray.last != nil {
            var returnedString = stackArray.last
            self.stackArray.removeLast()
            return returnedString
        } else {
            return nil
        }
    }
    
    func peek() -> String{
        return stackArray.last!
    }
    
    func listValues() {
        for var str in stackArray {
            print(str)
        }
    }
    
    func isEmpty() -> Bool {
        if stackArray.isEmpty == true {
            return true
        } else {
            return false
        }
    }
}
