import UIKit
import Foundation

class ViewController: UIViewController {
    

    @IBOutlet weak var displayLabel: UILabel!
    
    var isTyping = false
    var isFirstOperator = 0
    var isStillTyping = false
    var countingString : String = ""
    var isOnceOperatorSended : Bool = true
    var previousOperator : String = ""
    
    
    @IBAction func sendDigitAfterButtonPressed(_ sender: UIButton) {
        let number = sender.currentTitle!
        if isStillTyping && (displayLabel.text?.characters.count)! < 11  {
                displayLabel.text = displayLabel.text! + number
                countingString += String(number)
        } else {
            displayLabel.text = number
            countingString += String(number)
            isStillTyping = true
        }
        isOnceOperatorSended = true
    }

    @IBAction func sendOperatorAfterButtonPressed(_ sender: UIButton) {
        let operation = sender.currentTitle!
        if isOnceOperatorSended {
            let nextOperator : String =  String(operation)
            if  nextOperator != previousOperator {
                countingString += String(operation)
                displayLabel.text = displayLabel.text! + operation
            }
            previousOperator = nextOperator
        }
        isOnceOperatorSended = false
    }
    
    @IBAction func setDotIntoExpressionAfterButtonPressed(_ sender: UIButton) {
        let dot = sender.currentTitle!
        countingString += dot
        displayLabel.text! += dot
        
    }
    @IBAction func removeLastValueAfterButtonPressed(_ sender: UIButton) {
        if (displayLabel.text?.characters.count)! > 0 {
            let truncatedString = countingString.substring(to: countingString.index(before: countingString.endIndex))
            countingString = truncatedString
            displayLabel.text = truncatedString
        }
        
    }
    @IBAction func countResultAfterButtonPressed(_ sender: UIButton) {
        displayLabel.text! = RPN.evaluate(dataString: countingString)
        
    }
    
    override func viewDidLoad() {
       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

