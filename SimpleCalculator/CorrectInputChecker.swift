
import Foundation

class CorrectInputChecker {
    static var isDotSetOnce = true
    static let LAST_CHAR_IS_OPERATOR : Bool = countingString.hasSuffix("+") && countingString.hasSuffix("-")
                                                    && countingString.hasSuffix("×") && countingString.hasSuffix("÷")
    
    static let LAST_CHAR_IS_DOT : Bool = countingString.hasSuffix(".")
    static let EMPTY_DATA_STRING : Bool = countingString.characters.count == 0
    static let LAST_CHAR_IS_ZERO : Bool = countingString.hasSuffix("0")
    static let LAST_CHAR_IS_DEVISION : Bool = countingString.hasSuffix("÷")
    
    class func checkCurrentSymbol(current : String) {
        switch current {
        case "+", "-", "×", "÷":
            if !LAST_CHAR_IS_DOT || !LAST_CHAR_IS_OPERATOR {
                countingString += current
                print("im right here: \(countingString)")
            }
            print("im still here: \(countingString)")
        case ".": //ТОЧКА РАБОТАЕТ
            if LAST_CHAR_IS_ZERO && isDotSetOnce || !LAST_CHAR_IS_OPERATOR && isDotSetOnce {
                countingString += current
                isDotSetOnce = false
            }
            print("im here: \(countingString)")
        case "0": //ДЕЛЕНИЕ НА 0 РАБОТАЕТ
            if !LAST_CHAR_IS_DEVISION {
                countingString += current
            }
        case "1", "2", "3", "4", "5", "6", "7", "8", "9": //РОБЯТ
            if LAST_CHAR_IS_ZERO || !EMPTY_DATA_STRING || !LAST_CHAR_IS_DOT {
                countingString.remove(at: countingString.index(before: countingString.endIndex))
            }
            countingString += current
        default:
            print("Error with \(current) symbol")
        }
    }
}
