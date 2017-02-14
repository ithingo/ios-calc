import Foundation

class RPN {
    class func evaluate(dataString : String) -> String {
        let postfixExpression = setInfixToPrefixString(infixExpression: dataString)
        let result = evaluatePostfixString(postfixString: postfixExpression)
        let finalResult = checkIfDoubleIsInt(evaluatedDataString: result)
        print("Final result \(finalResult)")
        return finalResult
    }
    
    class func setInfixToPrefixString(infixExpression : String) -> String {
        var postfixExpression : String = ""
        var stack : [String] = []
        var isPreviousAnOperator : Bool = false
        
        for char in infixExpression.characters {
            switch String(char) {
            case "0", "1", "2", "3", "4", "5", "6", "7", "8", "9" :
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
                //  }
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
                    } else {      //+-
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
        
        print("RESULT: \(postfixExpression)")
        
        return postfixExpression
    }
    
    class func evaluatePostfixString(postfixString : String) -> String {
        var postfixStringArray : [Character] = []
        
        for char in postfixString.characters {
            postfixStringArray.append(char)
        }
        
        var arg : String = ""
        var stack : [String] = []
        
        for elem in postfixStringArray {
            switch elem {
            case "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", ".":
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
    
    class func checkIfDoubleIsInt(evaluatedDataString : String) -> String {
        let count = evaluatedDataString.characters.count
        var zerosAfterDotCount = 0
        var otherDigitsWithDotCount = 0
        var isFraction = false
        for char in evaluatedDataString.characters {
            if !isFraction {
                otherDigitsWithDotCount = otherDigitsWithDotCount + 1
            } else {
                zerosAfterDotCount = zerosAfterDotCount + 1
            }
            
            if String(char) == "." {
                isFraction = true
            }
        }
        
        if zerosAfterDotCount == count - otherDigitsWithDotCount {
            let dotRange : Range<String.Index> = evaluatedDataString.range(of: ".")!
            let dotIndex : Int = evaluatedDataString.distance(from: evaluatedDataString.startIndex, to: dotRange.lowerBound)
            
            let endIndex = evaluatedDataString.index(evaluatedDataString.endIndex, offsetBy: -dotIndex)
            return evaluatedDataString.substring(to: endIndex)
        } else {
            return evaluatedDataString
        }
    }
}