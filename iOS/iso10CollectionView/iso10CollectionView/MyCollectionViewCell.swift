//
//  MyCollectionViewCell.swift
//  iso10CollectionView
//
//  Created by apple on 28/09/2016.
//  Copyright © 2016 apple. All rights reserved.
//

import UIKit

class MyCollectionViewCell: UICollectionViewCell {

    var indexlabel: UILabel! = nil
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        self.indexlabel = UILabel()
        self.indexlabel.backgroundColor = UIColor.blue
        self.contentView.addSubview(self.indexlabel)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.indexlabel = UILabel()
        self.indexlabel.backgroundColor = UIColor.clear
        self.indexlabel.textAlignment = .center
        self.contentView.addSubview(self.indexlabel)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func aaaaa() -> Void {
        let SIZE: Double = min(Double(self.frame.size.width), Double(self.frame.size.height))
        
        let s1 = SIZE * 0.5
        let s2 = SIZE * 0.5 * sin(M_PI / 3.0)
        let s3 = SIZE * 0.5 * cos(M_PI / 3.0)
        
        let path = UIBezierPath.init()
        
        path.move(to: CGPoint.init(x: 0, y: s1))
        
        path.addLine(to: CGPoint.init(x: s3, y: s1-s2))
        path.addLine(to: CGPoint.init(x: s3+s1, y: s1-s2))
        
        path.addLine(to: CGPoint.init(x: SIZE, y: s1))
        
        path.addLine(to: CGPoint.init(x: s3+s1, y: s1+s2))
        path.addLine(to: CGPoint.init(x: s3, y: s1+s2))
        
        path.close()
        
        let maskLayer = CAShapeLayer.init()
        maskLayer.path = path.cgPath
        
        self.contentView.layer.mask = maskLayer
        
        self.contentView.backgroundColor = UIColor.orange
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.indexlabel.frame = CGRect.init(x: 0, y: 0, width: 50, height: 30)
        self.indexlabel.center = self.contentView.center
        
        self.aaaaa()
    }
    
//    override func draw(_ rect: CGRect) {
//        
//    }
}
