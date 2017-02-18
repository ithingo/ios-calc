
import Foundation

//Pattern for using arrays in switch-case in CorrectInputChecker
func ~= <T : Equatable> (array : [T], value: T) -> Bool {
    return array.contains(value)
}

class CorrectInputChecker {
    private var infixString : String = ""
    private let dot : String       = "."
    private let zero : String      = "0"
    private let operators          = ["+", "-", "×", "÷"]
    private let digitsWithoutZero = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
    
    private var IS_INPUTING_A_NUMBER  = true
    
    private var PREVIOUS_CHAR_IS_DOT : Bool {
        get {
            return infixString.hasSuffix(".")
        }
    }
    private var PREVIOUS_CHAR_IS_ZERO : Bool {
        get {
            return infixString.hasSuffix("0")
        }
    }
    private var PREVIOUS_CHAR_IS_DEVISION : Bool {
        get {
            return infixString.hasSuffix("÷")
        }
    }
    private var PREVIOUS_CHAR_IS_MULTIPLICATION : Bool {
        get {
            return infixString.hasSuffix("×")
        }
    }
    private var PREVIOUS_CHAR_IS_ADDITION : Bool {
        get {
            return infixString.hasSuffix("+")
        }
    }
    private var PREVIOUS_CHAR_IS_SUBTRACTION : Bool {
        get {
            return infixString.hasSuffix("-")
        }
    }
    
    private var EMPTY_DATA_STRING : Bool {
        get {
            return infixString.characters.count == 0
        }
    }
    private var STRING_WITH_ONLY_ZERO : Bool {
        get {
            return (infixString.characters.count == 1) && (infixString.characters.last! == "0")
        }
    }
    private var PREVIOUS_CHAR_IS_POSITIVE_DIGIT : Bool {
        get {
            return infixString.hasSuffix("1")
                || infixString.hasSuffix("2")
                || infixString.hasSuffix("3")
                || infixString.hasSuffix("4")
                || infixString.hasSuffix("5")
                || infixString.hasSuffix("6")
                || infixString.hasSuffix("7")
                || infixString.hasSuffix("8")
                || infixString.hasSuffix("9")
        }
    }
    
    init(_ inputString : String) {
        infixString = inputString
    }
    
    private func putDigitInEmptyDataString(_ currentChar : String) -> String {
        if currentChar == "0" || digitsWithoutZero.contains(currentChar) {
            infixString += currentChar
            IS_INPUTING_A_NUMBER = true
        }
        return infixString
    }
    
    private func putCharInStringWithZero(_ currentChar : String) -> String {
        switch currentChar {
        case dot:
            if dotCount == 0 {
                IS_INPUTING_A_NUMBER = true
                infixString += currentChar
                dotCount += 1
            }
        case operators:
            dotCount = 0
            IS_INPUTING_A_NUMBER = false
            infixString += currentChar
        case zero: fallthrough
        case digitsWithoutZero:
            IS_INPUTING_A_NUMBER = true
            infixString.remove(at: infixString.index(before: infixString.endIndex))
            infixString += currentChar
        default:
            print("Error in srt with zero \(infixString)")
        }
        return infixString
    }
    
    private func putCharInNormalMode(_ currentChar : String) -> String {
        if PREVIOUS_CHAR_IS_POSITIVE_DIGIT || PREVIOUS_CHAR_IS_ZERO {
            switch currentChar {
            case dot:
                if dotCount == 0 {
                    infixString += currentChar
                    dotCount += 1
                }
            case operators:
                dotCount = 0
                IS_INPUTING_A_NUMBER = false
                infixString += currentChar
            case zero: fallthrough
            case digitsWithoutZero:
                infixString += currentChar
            default:
                print("Error in after digit\(infixString)")
            }
        }
        if PREVIOUS_CHAR_IS_MULTIPLICATION || PREVIOUS_CHAR_IS_ADDITION || PREVIOUS_CHAR_IS_SUBTRACTION {
            if digitsWithoutZero.contains(currentChar) || currentChar == zero {
                IS_INPUTING_A_NUMBER = true
                infixString += currentChar
            }
        }
        if PREVIOUS_CHAR_IS_DEVISION && digitsWithoutZero.contains(currentChar) {
            IS_INPUTING_A_NUMBER = true
            infixString += currentChar
        }
        if PREVIOUS_CHAR_IS_DOT {
            if digitsWithoutZero.contains(currentChar) || currentChar == zero {
                infixString += currentChar
            }
        }
        return infixString
    }
    
    public func checkCurrentSymbol(current : String) {
        if EMPTY_DATA_STRING {
            countingString = self.putDigitInEmptyDataString(current)
        } else {
            if STRING_WITH_ONLY_ZERO {
                countingString = self.putCharInStringWithZero(current)
            } else {
                countingString = self.putCharInNormalMode(current)
            }
        }
        
        print(countingString)
    }
    
    static public func removeLastCheckingDotWithReturnChangedDataString() -> String {
        var changedString = countingString
        if changedString.characters.count > 0 {
            if changedString.hasSuffix(".") {
                dotCount = 0
            }
            changedString = changedString.substring(to: changedString.index(before: changedString.endIndex))
        }
        return changedString
    }
}
