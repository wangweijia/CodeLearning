//
//  ViewController.swift
//  iso10CollectionView
//
//  Created by apple on 27/09/2016.
//  Copyright © 2016 apple. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    var collectionView: UICollectionView! = nil

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
//        self.addCollectionView()
        self.addCollectionViewAndCustomCell()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /// 添加 6边形 view
    func addCustomView() -> Void {
        let newView = HomeycombView.init()
        newView.frame = CGRect.init(x: 100, y: 100, width: 100, height: 100)
        self.view.addSubview(newView)
    }
    
    /// 添加 默认 UICollectionView
    func addCollectionView() -> Void {
        let flowLayout = UICollectionViewFlowLayout.init()
        flowLayout.scrollDirection = .vertical
        self.collectionView = UICollectionView.init(frame: self.view.bounds, collectionViewLayout: flowLayout)
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        self.collectionView.backgroundColor = UIColor.clear
        self.collectionView.layer.borderWidth = 5
        
        print(UICollectionView.classForCoder())
        print(UICollectionViewCell.self)
        
        self.collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "UICollectionViewCell")
        
        self.view.addSubview(self.collectionView)
    }
    
    /// 添加 UICollectionView 和 自定义 cell
    func addCollectionViewAndCustomCell() -> Void {
        let flowLayout = MyCollectionViewLayout.init()
        self.collectionView = UICollectionView.init(frame: self.view.bounds, collectionViewLayout: flowLayout)
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        self.collectionView.backgroundColor = UIColor.clear
        
        self.collectionView.register(MyCollectionViewCell.self, forCellWithReuseIdentifier: "UICollectionViewCell")
        
        self.view.addSubview(self.collectionView)
    }

//    MARK:UICollectionViewDataSource
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 100
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "UICollectionViewCell", for: indexPath) as! MyCollectionViewCell
        
        cell.indexlabel.text = String(indexPath.row)
//        cell.backgroundColor = UIColor.blue
//        let label = UILabel.init(frame: CGRect.init(x: 0, y: 0, width: 40, height: 20))
//        label.textColor = UIColor.red
//        label.text = String.init(format: "%d", indexPath.row)
//        
//        for subView in cell.contentView.subviews {
//            subView.removeFromSuperview()
//        }
//        
//        cell.contentView.addSubview(label)
        return cell
    }
    
//    MARK:UICollectionViewDelegateFlowLayout
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        let wh = arc4random_uniform(100) + 1
//        
//        return CGSize.init(width: CGFloat(wh), height: CGFloat(wh))
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
//        return UIEdgeInsets.init(top: 10, left: 10, bottom: 10, right: 10)
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
//        return 10.0
//    }
//
////    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
////        return 100.0
////    }
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
//        return CGSize.init(width: 1, height: 50)
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
//        return CGSize.init(width: 1, height: 50)
//    }
    
//    MARK:UICollectionViewDelegate
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell: UICollectionViewCell = collectionView.cellForItem(at: indexPath)!
        cell.backgroundColor = UIColor.green
        
    }
    
    func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return false
    }
}

