import UIKit
import Foundation

class ViewController: UIViewController {
    

    @IBOutlet weak var displayLabel: UILabel!
    
    @IBAction func sendDigitAfterButtonPressed(_ sender: UIButton) {
        let number = sender.currentTitle!
        var checker = CorrectInputChecker(countingString)
        checker.checkCurrentSymbol(current: number)
        displayLabel.text = countingString
    }

    @IBAction func sendOperatorAfterButtonPressed(_ sender: UIButton) {
        let operation = sender.currentTitle!
        var checker = CorrectInputChecker(countingString)
        checker.checkCurrentSymbol(current: operation)
        displayLabel.text = countingString
    }
    
    @IBAction func setDotIntoExpressionAfterButtonPressed(_ sender: UIButton) {
        let dot = sender.currentTitle!
        var checker = CorrectInputChecker(countingString)
        checker.checkCurrentSymbol(current: dot)
        displayLabel.text = countingString
    }
    @IBAction func removeLastValueAfterButtonPressed(_ sender: UIButton) {
        countingString = CorrectInputChecker.removeLastCheckingDotWithReturnChangedDataString()
        displayLabel.text! = countingString // checker.removeLastCheckingDotWithReturnChangedDataString()
        
    }
    @IBAction func countResultAfterButtonPressed(_ sender: UIButton) {
        displayLabel.text = RPN.evaluate(dataString: countingString)
        
    }
    
    override func viewDidLoad() {
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }


}

