
import Foundation

var countingString : String = "0"

func ~= <T : Equatable> (array : [T], value: T) -> Bool {
    return array.contains(value)
}
