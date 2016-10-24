//
//  HomeycombView.swift
//  iso10CollectionView
//
//  Created by apple on 28/09/2016.
//  Copyright © 2016 apple. All rights reserved.
//

import UIKit

class HomeycombView: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let SIZE: Double = 100.0
        
        let longSide = SIZE * 0.5 * cos(M_PI * 30.0 / 180)
        let shortSide = SIZE * 0.5 * sin(M_PI * 30.0 / 180.0)
        
        let path = UIBezierPath.init()
        
        path.move(to: CGPoint.init(x: 0, y: longSide))
        path.addLine(to: CGPoint.init(x: shortSide, y: 0))
        path.addLine(to: CGPoint.init(x: shortSide+SIZE*0.5, y: 0))
        path.addLine(to: CGPoint.init(x: SIZE, y: longSide))
        path.addLine(to: CGPoint.init(x: shortSide+SIZE*0.5, y: longSide*2.0))
        path.addLine(to: CGPoint.init(x: shortSide, y: longSide*2.0))
        
        path.close()
        
        let maskLayer = CAShapeLayer.init()
        maskLayer.path = path.cgPath
        
        self.layer.mask = maskLayer
        
        self.backgroundColor = UIColor.orange
    }

}
