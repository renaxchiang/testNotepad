//
//  RCDetailViewController.swift
//  testNotepad
//
//  Created by Chiang Siek Siang on 2015/5/11.
//  Copyright (c) 2015年 Chiang Siek Siang. All rights reserved.
//

import UIKit

class RCDetailViewController: UIViewController, UITextViewDelegate {
    @IBOutlet var textView: UITextView!
    var data: NSMutableArray = NSMutableArray()
    var select: Int = -1
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // set text in textView with select number
        if select != -1 {
            textView.text = data[select] as! String
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func textViewDidChange(textView: UITextView) {
        data[select] = textView.text
    }
}
