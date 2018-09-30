//
//  ViewController.swift
//  OhNSTimer
//
//  Created by Yanci on 2018/9/30.
//  Copyright © 2018年 tdw. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func pushViewController() {
        let view1 = ViewController1()
        self.navigationController?.pushViewController(view1, animated: true)
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

