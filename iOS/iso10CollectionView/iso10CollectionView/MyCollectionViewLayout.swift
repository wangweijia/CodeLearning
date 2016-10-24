//
//  MyCollectionViewLayout.swift
//  iso10CollectionView
//
//  Created by apple on 28/09/2016.
//  Copyright © 2016 apple. All rights reserved.
//

import UIKit

class MyCollectionViewLayout: UICollectionViewLayout {

    var cellWidth: Double = 100
    var col: Int = 3
    var maxCellY: Double = 0
    
    override var collectionViewContentSize: CGSize{
        print("-=-=-=-=-=-=collectionViewContentSize-=-=-=-=-=-=")
        let size = CGSize.init(width: 320, height: self.maxCellY)
        print("\nsssssssssssssssssssss\(size)")
        return size
    }
    
    override func prepare() {
        print("--------------prepare----------------")
        super.prepare()
        
        self.col = 3
        self.cellWidth = 100
    }
    
    override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
        return true
    }
    
    override func layoutAttributesForSupplementaryView(ofKind elementKind: String, at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        print("layoutAttributesForSupplementaryView")
        let attributes = UICollectionViewLayoutAttributes.init(forCellWith: indexPath)
        return attributes
    }
    
    override func layoutAttributesForDecorationView(ofKind elementKind: String, at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        print("layoutAttributesForDecorationView")
        let attributes = UICollectionViewLayoutAttributes.init(forCellWith: indexPath)
        return attributes
    }
    
    override func layoutAttributesForItem(at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
//        print("layoutAttributesForItem")
        let attributes = UICollectionViewLayoutAttributes.init(forCellWith: indexPath)
        let winWidth = UIScreen.main.bounds.size.width

        let margin = (Double(winWidth) - 3 * self.cellWidth) / Double(self.col + 1)
        
        let x = self.cellWidth * Double(indexPath.item % self.col) + margin * Double((indexPath.item % self.col) + 1)
        var y = self.cellWidth * Double(indexPath.item / self.col) + margin * Double((indexPath.item / self.col) + 1)
        
        if (indexPath.item % self.col) % 2 == 1 {
            y += (self.cellWidth / 2.0 + margin / 2.0)
        }
        
        attributes.center = CGPoint.init(x: x+self.cellWidth/2.0, y: y+self.cellWidth/2.0)
        attributes.size = CGSize.init(width: self.cellWidth, height: self.cellWidth)
        
        self.maxCellY = max(y + self.cellWidth, self.maxCellY)
        
        return attributes
    }
    
    var scount:Int = 0;
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        scount += 1
        print("count    \(scount) \n  \(rect)")
        
        var attributes: Array = [UICollectionViewLayoutAttributes]()
        
        let itemIndices = self.collectionView?.indexPathsForVisibleItems
        
//        if (itemIndices?.count)! == 0 {
            for i in 0 ..< (self.collectionView?.numberOfItems(inSection: 0))! {
                
                let indexPath = NSIndexPath.init(item: i, section: 0)
                
                attributes.append(self.layoutAttributesForItem(at: indexPath as IndexPath)!)
                
            }
            return attributes
//        }else{
//            for indexPath in itemIndices! {
//                attributes.append(self.layoutAttributesForItem(at: indexPath as IndexPath)!)
//            }
//            return attributes
//        }
        
    }

}
