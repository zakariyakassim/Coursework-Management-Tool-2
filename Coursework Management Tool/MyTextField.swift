//
//  MyTextField.swift
//  Coursework Management Tool
//
//  Created by Zakariya Kassim on 05/05/2016.
//  Copyright © 2016 MACBOOKPRO. All rights reserved.
//

import UIKit

class MyTextField: UITextField {
    
        var path1: UIBezierPath!
            var path2: UIBezierPath!
    override func drawRect(rect: CGRect) {
        
        path1 = UIBezierPath(roundedRect: CGRectMake(10,10, self.bounds.width-20, self.bounds.height-20),
                             byRoundingCorners: [.TopLeft, .TopRight],
                             cornerRadii: CGSize(width: 0, height: 0))
        

        

        
        
        
        
        
        //  UIColor.blueColor().setFill()
       // UIColor.blueColor().setFill()
        UIColor.whiteColor().setStroke()
        path1.lineWidth = 3
        path1.stroke()
        
        
        path1.fill()
        //path2.fill()

        
        
    }

    

}
