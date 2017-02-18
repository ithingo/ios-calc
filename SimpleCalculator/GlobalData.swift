
import Foundation

var countingString : String = "0"

var dotCount : Int = 0


//Pattern for using arrays in switch-case in CorrectInputChecker
func ~= <T : Equatable> (array : [T], value: T) -> Bool {
    return array.contains(value)
}
