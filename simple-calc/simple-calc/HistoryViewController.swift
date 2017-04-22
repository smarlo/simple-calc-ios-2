//
//  HistoryViewController.swift
//  simple-calc
//
//  Created by Sabrina Niklaus on 4/21/17.
//  Copyright © 2017 Sabrina Niklaus. All rights reserved.
//

import UIKit

class HistoryViewController: UIViewController {

    public var history = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(history)
        for item in history {
            let newLabel = UILabel(frame: CGRect(x: 0, y: 75 + history.index(of: item)! * 30, width: 200, height: 21))
            newLabel.textAlignment = .center
            newLabel.text = item
            self.view.addSubview(newLabel)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func backPressed(_ sender: Any) {
        performSegue(withIdentifier: "SimpleCalcSegue", sender: nil)
    }

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let viewController = segue.destination as! ViewController
        viewController.history = history
    }
 

}
