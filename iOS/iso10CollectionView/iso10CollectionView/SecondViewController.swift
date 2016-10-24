//
//  SecondViewController.swift
//  iso10CollectionView
//
//  Created by apple on 20/10/2016.
//  Copyright © 2016 apple. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.test01(t1: 1, t2: 2)
        self.test02(1, t2: 2)
        self.test03(1, 2)
        self.test04(t1: 1)
        self.test04(t1: 1, t2: 2)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func test01(t1:Int, t2:Int) {
        print("test01")
    }
    
    func test02(_ t1:Int, t2:Int) {
        print("test02")
    }
    
    func test03(_ t1: Int, _ t2: Int) {
        print("test03")
    }
    
    func test04(t1: Int, t2: Int = 5) {
        print("test04")
    }
}
