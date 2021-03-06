import Foundation

class RPN {
    
    public class func evaluate(dataString : String) -> String {
        let postfixExpression   = setInfixToPrefixString(infixExpression: dataString)
        let result              = evaluatePostfixString(postfixString: postfixExpression)
        let finalResult         = checkIfDoubleIsInt(evaluatedDataString: result)
        
        return finalResult
    }
    
    private class func setInfixToPrefixString(infixExpression : String) -> String {
        let digitsWithZero = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"]
        var postfixExpression : String = ""
        var stack : [String] = []
        var isPreviousAnOperator : Bool = false
        
        for char in infixExpression.characters {
            switch String(char) {
            case digitsWithZero:
                if isPreviousAnOperator {
                    postfixExpression += " "
                }
                postfixExpression += "\(char)"
                isPreviousAnOperator = false
            case "." :
                postfixExpression += "\(char)"
                isPreviousAnOperator = false
            case "×", "÷" :
                if stack.isEmpty {
                    stack.append(String(char))
                } else {
                    if (stack.last)! == "+" || (stack.last)! == "-" {
                        stack.append(String(char))
                    } else {
                        if (stack.last)! == "×" || (stack.last)! == "÷" {
                            let curr = (stack.popLast())!
                            postfixExpression += " \(curr)"
                        }
                        stack.append(String(char))
                    }
                }
                isPreviousAnOperator = true
            case "+", "-" :
                if stack.isEmpty {
                    stack.append(String(char))
                } else {
                    if (stack.last)! == "×" || (stack.last)! == "÷" {
                        while !(stack.isEmpty) {
                            let curr = (stack.popLast())!
                            postfixExpression += " \(curr)"
                        }
                        stack.append(String(char))
                    } else {
                        let curr = (stack.popLast())!
                        stack.append(String(char))
                        postfixExpression += " \(curr)"
                    }
                }
                isPreviousAnOperator = true
            default :
                print("Error with input string: wrong format")
                print(postfixExpression)
            }
        }
        
        while !(stack.isEmpty) {
            postfixExpression += " "
            postfixExpression += (stack.popLast())!
        }
        
        return postfixExpression
    }
    
    private class func evaluatePostfixString(postfixString : String) -> String {
        let digitsWithZeroAndDot = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "."]
        
        var postfixStringArray : [Character] = []
        
        for char in postfixString.characters {
            postfixStringArray.append(char)
        }
        
        var arg : String = ""
        var stack : [String] = []
        
        for elem in postfixStringArray {
            switch String(elem) {
            case digitsWithZeroAndDot:
                arg = arg + String(elem)
            case " ":
                stack.append(arg)
                arg = ""
            case "+":
                let rightOper = stack.removeLast()
                let leftOper = stack.removeLast()
                arg = String(Double(leftOper)! + Double(rightOper)!)
            case "-":
                let rightOper = stack.removeLast()
                let leftOper = stack.removeLast()
                arg = String(Double(leftOper)! - Double(rightOper)!)
            case "×":
                let rightOper = stack.removeLast()
                let leftOper = stack.removeLast()
                arg = String(Double(leftOper)! * Double(rightOper)!)
            case "÷":
                let rightOper = stack.removeLast()
                let leftOper = stack.removeLast()
                arg = String(Double(leftOper)! / Double(rightOper)!)
                
            default:
                print("\n")
                print("Error")
                print(stack)
                print(arg)
                print("\n")
            }
        }
        return String(arg)
     
    }
    
    private class func checkIfDoubleIsInt(evaluatedDataString : String) -> String {
        var finalString = evaluatedDataString
        let count = finalString.characters.count
        var zerosAfterDotCount = 0
        var otherDigitsWithDotCount = 0
        var isFraction = false
        for char in finalString.characters {
            if !isFraction {
                otherDigitsWithDotCount = otherDigitsWithDotCount + 1
            } else {
                zerosAfterDotCount = zerosAfterDotCount + 1
            }
            
            if String(char) == "." {
                isFraction = true
            }
        }
        
        if zerosAfterDotCount == count - otherDigitsWithDotCount && finalString.hasSuffix(".") {
            finalString.remove(at: finalString.index(before: finalString.endIndex))
        }
        return finalString
    }
}
