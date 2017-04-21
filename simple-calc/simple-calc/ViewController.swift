//
//  ViewController.swift
//  simple-calc
//
//  Created by Sabrina Niklaus on 4/14/17.
//  Copyright © 2017 Sabrina Niklaus. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var calcDisplay: UILabel!
    public final let possibleOperands: [String] = ["+", "-", "/", "%", "x", "count", "avg", "fact"]
    
    public var numPressed: Bool = true
    public var avgPressed: Bool = false
    public var countPressed: Bool = false
    public var factPressed: Bool = false
    
    @IBAction func numberPressed(_ sender: Any) {
        if !factPressed {
            let number = (sender as AnyObject).titleLabel!!.text
            addNum(number!)
            numPressed = true
        }
    }
    
    func addNum(_ num: String) {
        if calcDisplay.text! == "0" {
            calcDisplay.text = num
        } else {
            calcDisplay.text! += num
        }
    }
    
    @IBAction func add(_ sender: Any) {
        if numPressed {
            calcDisplay.text! += " + "
        }
    }
    
    @IBAction func subtract(_ sender: Any) {
        if numPressed {
            calcDisplay.text! += " - "
        }
    }
    
    @IBAction func multiply(_ sender: Any) {
        if numPressed {
            calcDisplay.text! += " x "
        }
    }
    
    @IBAction func divide(_ sender: Any) {
        if numPressed {
            calcDisplay.text! += " / "
        }
    }
    
    @IBAction func modulo(_ sender: Any) {
        if numPressed {
            calcDisplay.text! += " % "
        }
    }
    
    @IBAction func count(_ sender: Any) {
        if numPressed && !avgPressed && !factPressed {
            calcDisplay.text! += " count "
            countPressed = true
            numPressed = false
        }
    }
    
    @IBAction func average(_ sender: Any) {
        if numPressed && !factPressed && !countPressed {
            calcDisplay.text! += " avg "
            avgPressed = true
            numPressed = false
        }
    }
    
    @IBAction func factorial(_ sender: Any) {
        if numPressed && !countPressed && !avgPressed {
            calcDisplay.text! += " fact "
            factPressed = true
            numPressed = false
        }
    }
    
    @IBAction func clear(_ sender: Any) {
        calcDisplay.text! = "0"
        factPressed = false
        avgPressed = false
        countPressed = false
        numPressed = false
    }
    
    func count(nums: [Int]) -> Int {
        return nums.count
    }
    
    func average(nums: [Int]) -> Int {
        var sum = 0
        for num in nums {
            sum += num
        }
        return sum / nums.count
    }
    
    func factorial(num: Int) -> Int {
        if (num < 0) {
            return -1
        } else if (num == 1 || num == 0) {
            return 1
        }
        
        return num * factorial(num: (num - 1))
    }
    
    @IBAction func calculate(_ sender: Any) {
        let arg = calcDisplay.text!
        let numString: [String] = arg.characters.split(separator: " ").map(String.init)
        var numbers: [Int] = []
        var operators: [String] = []
        for i in 0...numString.count - 1 {
            if !possibleOperands.contains(numString[i]) {
                numbers.append(Int(numString[i])!)
            } else if possibleOperands.contains(numString[i]) {
                operators.append(numString[i])
            }
        }

        if arg.contains("count") || arg.contains("avg") || arg.contains("fact") {
            
            if arg.contains("count") {
                calcDisplay.text = String(count(nums: numbers))
                countPressed = false
            } else if arg.contains("avg") {
                calcDisplay.text = String(average(nums: numbers))
                avgPressed = false
            } else if arg.contains("fact") {
                calcDisplay.text = String(factorial(num: numbers[0]))
                factPressed = false
            }
            
        } else if arg.contains("+") || arg.contains("-") || arg.contains("/") || arg.contains("%") || arg.contains("x") {
            var result = numbers[0]
            for i in 0...operators.count - 1 {
                result = processArgs(left: result, right: numbers[i + 1], op: operators[i])
            }
            calcDisplay.text! = String(result)
        }
        numPressed = true
        
    }
    
    func processArgs(left: Int, right: Int, op: String) -> Int {
        var total: Int = left
        switch op {
            case "+" : total += right
            case "-" : total -= right
            case "x" : total *= right
            case "/" : total /= right
            case "%" : total = total % right
            default : total += 0
        }
        return total
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

