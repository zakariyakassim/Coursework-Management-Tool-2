//
//  MyButton.swift
//  Coursework Management Tool
//
//  Created by Zakariya Kassim on 04/05/2016.
//  Copyright © 2016 MACBOOKPRO. All rights reserved.
//


import UIKit

class MyButton: UIButton {
    
    var topLeft = 0
    var topRight = 0
    var bottomLeft = 0
    var bottomRight = 0
    
    
    var path1: UIBezierPath!
    var path2: UIBezierPath!
    
    var bgColor: UIColor = UIColor.clearColor()
    
    func setFillColor(color: UIColor) {
        bgColor = color
    }
    
    
    func setRadius(setTopLeft: Int, setTopRight: Int, setBottomLeft: Int, setBottomRight: Int) {
        topLeft = setTopLeft
        topRight = setTopRight
        bottomLeft = setBottomLeft
        bottomRight = setBottomRight
    }
    
    
    override func drawRect(rect: CGRect) {
        
          path1 = UIBezierPath(roundedRect: CGRectMake(0,0, self.bounds.width, (self.bounds.height/2)),
         byRoundingCorners: [.TopLeft, .TopRight],
         cornerRadii: CGSize(width: topLeft, height: topRight))
        
        path2 = UIBezierPath(roundedRect: CGRectMake(0,(self.bounds.height/2)-2, self.bounds.width, (self.bounds.height/2)+2), byRoundingCorners: [.BottomLeft, .BottomRight],
                            cornerRadii: CGSize(width: bottomLeft, height: bottomRight))
        

        
        
        
      //  UIColor.blueColor().setFill()
        bgColor.setFill()
        
        path1.fill()
        path2.fill()
        
        
    }
    


}
