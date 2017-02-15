
import Foundation

class CorrectInputChecker {
    static var isDotSetOnce = true
//  static let EMPTY_DATA_STRING : Bool = countingString.characters.count == 0
    
    static let PREVIOUS_CHAR_IS_DOT             : Bool = countingString.hasSuffix(".")
    static let PREVIOUS_CHAR_IS_ZERO            : Bool = countingString.hasSuffix("0")
    
    static let PREVIOUS_CHAR_IS_DEVISION        : Bool = countingString.hasSuffix("÷")
    static let PREVIOUS_CHAR_IS_MULTIPLICATION  : Bool = countingString.hasSuffix("×")
    static let PREVIOUS_CHAR_IS_ADDITION        : Bool = countingString.hasSuffix("+")
    static let PREVIOUS_CHAR_IS_SUBTRACTION     : Bool = countingString.hasSuffix("÷")
    
    static let operands           = ["+", "-", "×", "÷"]
    static let numbersWithoutZero = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
    
    class func checkCurrentSymbol(current : String) {
        switch current {
        case operands:
            if !(PREVIOUS_CHAR_IS_DOT) || !PREVIOUS_CHAR_IS_ADDITION || !PREVIOUS_CHAR_IS_SUBTRACTION || !PREVIOUS_CHAR_IS_MULTIPLICATION || !PREVIOUS_CHAR_IS_DEVISION { //(PREVIOUS_CHAR_IS_DOT) { //&& LAST_CHAR_IS_OPERATOR) {
                countingString += current
                print("im right here: \(countingString)")
            }
            print("im still here: \(countingString)")
        case numbersWithoutZero: //РОБЯТ
            //if LAST_CHAR_IS_ZERO || !EMPTY_DATA_STRING || !LAST_CHAR_IS_DOT {
             //   countingString.remove(at: countingString.index(before: countingString.endIndex))
       //     }
            countingString += current
        case ".": //ТОЧКА РАБОТАЕТ
            if PREVIOUS_CHAR_IS_ZERO && isDotSetOnce { // || !LAST_CHAR_IS_OPERATOR && isDotSetOnce {
                countingString += "0\(current)"
                isDotSetOnce = false
            }
           // if  {
                
          //  }
            print("im here: \(countingString)")
        case "0": //ДЕЛЕНИЕ НА 0 РАБОТАЕТ
            if PREVIOUS_CHAR_IS_DEVISION {
                countingString += current
            }
        default:
            print("Error with \(current) symbol")
        }
    }
}
