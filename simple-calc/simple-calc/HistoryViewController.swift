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

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var historyLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.contentSize = CGSize(width: self.view.frame.size.width, height: self.view.frame.size.height + 100)
        let offset: Int = 30
        var i = 0
        for item in history {
            let label = UILabel(frame: CGRect(x: 0, y: i * offset, width: Int(self.view.frame.size.width), height: 25))
            label.textColor = UIColor.black
            label.textAlignment = .left
            label.backgroundColor = UIColor.white
            label.text = item
            i += 1
            self.scrollView?.addSubview(label)
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
