import UIKit
import Foundation

class ViewController: UIViewController {
    

    @IBOutlet weak var displayLabel: UILabel!
    
    @IBAction func sendDigitAfterButtonPressed(_ sender: UIButton) {
        let number = sender.currentTitle!
        print("\n pushed: \(number)")
        print("before: \(countingString)")
        CorrectInputChecker.checkCurrentSymbol(current: number)
        print("after: \(countingString)")
        displayLabel.text = countingString
    }

    @IBAction func sendOperatorAfterButtonPressed(_ sender: UIButton) {
        let operation = sender.currentTitle!
        print("\n pushed: \(operation)")
        print("before: \(countingString)")
        CorrectInputChecker.checkCurrentSymbol(current: operation)
        print("after: \(countingString)")
        displayLabel.text = countingString
    }
    
    @IBAction func setDotIntoExpressionAfterButtonPressed(_ sender: UIButton) {
        let dot = sender.currentTitle!
        print("\npushed: \(dot)")
        print("before: \(countingString)")
        CorrectInputChecker.checkCurrentSymbol(current: dot)
        print("after: \(countingString)")
        displayLabel.text = countingString
    }
    @IBAction func removeLastValueAfterButtonPressed(_ sender: UIButton) {
        if (displayLabel.text?.characters.count)! > 0 {
            let truncatedString = countingString.substring(to: countingString.index(before: countingString.endIndex))
            countingString = truncatedString
            displayLabel.text = truncatedString
        }
        
    }
    @IBAction func countResultAfterButtonPressed(_ sender: UIButton) {
        displayLabel.text = RPN.evaluate(dataString: countingString)
        
    }
    
    override func viewDidLoad() {
       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

