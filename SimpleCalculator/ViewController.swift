//
//  ViewController.swift
//  SimpleCalculator
//
//  Created by Admin on 17.12.16.
//  Copyright © 2016 vborodaev. All rights reserved.
//

import UIKit
import Foundation

class ViewController: UIViewController {
    

    @IBOutlet weak var displayLabel: UILabel!
    
    var isTyping = false
    var isFirstOperator = 0
    var isStillTyping = false

    var isOnceOperatorSended : Bool = true
    var previousOperator : String = ""
    
//    var savedData : NSData?
 //   var savedDataString : String?
    
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
//        print("Printing numbers")
 //       print(countingString)
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
      //  displayLabel.text! += displayLabel.text! + dot!
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
      /*  savedData = countingString.data(using: .utf8) as NSData?
      //  savedData = tempString?.data(using .utf8)
        /*if let d = savedData {
            print(d)
        }*/
        let fileURL = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
        do {
            try savedData?.write(to: fileURL, atomically: true)
        } catch {
            print(error)
        }
        countingString = "0"
        savedDataString = String(data: savedData! as Data, encoding: .utf8)!
        //          let lengthOfSavedDataString = count(savedDataString)
        let lengthOfSavedDataString = savedDataString?.characters.count
        if lengthOfSavedDataString != nil {
            countingString = savedDataString!
        }*/
        var bufstring = getExpression(nonRPNString: countingString)
        displayLabel.text = String(bufstring)
    }
    
    override func viewDidLoad() {
       /* do {
            try savedDataString = String(data: savedData! as Data, encoding: .utf8)!
            //          let lengthOfSavedDataString = count(savedDataString)
            let lengthOfSavedDataString = savedDataString?.characters.count
            if lengthOfSavedDataString != nil {
                countingString = savedDataString!
            }
        }*/
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

