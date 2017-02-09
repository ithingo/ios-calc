//
//  Model.swift
//  SimpleCalculator
//
//  Created by Admin on 24.12.16.
//  Copyright © 2016 vborodaev. All rights reserved.
//

import Foundation

var countingString : String = ""
var operatorsSet : Set = ["+","-","*","/"]
var digitsSet : Set = ["0","1","2","3","4","5","6","7","8","9"]

func isOperator(char: Character) -> Bool {
    if operatorsSet.contains(String(char)) {
        return true
    }
    return false
}

func isDigit(char: Character) -> Bool {
    if digitsSet.contains(String(char)) {
        return true
    }
    return false
}

func isDot(char: Character) -> Bool {
    if char == Character(".") {
        return true
    }
    return false
}

func getOperatorPriority(char : Character) -> Int {
    switch char {
    case "*", "/":
        return 0
    case "+", "-":
        return 1
    default:
        return -1
    }
}

func getExpression(nonRPNString : String) -> String {
    var outputRPNString : String = ""
//    
//    var operatorStack : Stack? = nil
//    var currentOperator : Character?
//    
//    for char in nonRPNString.characters {
//        if isDot(char: char) {
//            continue
//        }
//        print(char)
//        print("\n")
//        if isDigit(char: char) {
//            /*while !isDot(char: char) || !isOperator(char: char) {*/
//                outputRPNString += String(char)
//            //}
//        }
//        if isOperator(char: char) {
//            operatorStack?.push(pushedString: String(char))
//        } else  if !((operatorStack?.isEmpty())!) {
//            currentOperator = Character((operatorStack?.pop()!)!)
//            if getOperatorPriority(char: char) <= getOperatorPriority(char: currentOperator!) {
//                outputRPNString += String(describing: currentOperator)
//            }
//        }
//    }
//    while !((operatorStack?.isEmpty())!) {
//        outputRPNString += String(describing: operatorStack?.pop())
//    }
    return outputRPNString
}
    
/*func calculateRPN(rpnString : String) -> Double {
    var result = 0.0
    
}*/

/*func calculateResult() -> Double {
    let inputString = countingString
   // let outputRPNString = getExpression(nonRPNString: inputString)
    return calculateRPN(rpnString: outputRPNString)
}*/
