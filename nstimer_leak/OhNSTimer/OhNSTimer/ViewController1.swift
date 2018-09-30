//
//  ViewController1.swift
//  OhNSTimer
//
//  Created by Yanci on 2018/9/30.
//  Copyright © 2018年 tdw. All rights reserved.
//

import UIKit

class ViewController1: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        Timer.scheduledTimer(timeInterval: TimeInterval.init(1),
                             target: self,
                             selector: #selector(tick),
                             userInfo: nil,
                             repeats: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func tick() {
        print("tick")
    }

    deinit {
        print("deinit")
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
