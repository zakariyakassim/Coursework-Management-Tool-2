//
//  ViewControllerMainMenu.swift
//  Coursework Management Tool
//
//  Created by MACBOOKPRO on 07/04/2016.
//  Copyright © 2016 MACBOOKPRO. All rights reserved.
//

import UIKit

class ViewControllerMainMenu: UIViewController {


    @IBOutlet weak var btnAddCourse: MyButton!
    @IBOutlet weak var btnButton2: MyButton!
    @IBOutlet weak var btnButton3: MyButton!
    @IBOutlet weak var btnButton4: MyButton!
    @IBOutlet weak var btnButton5: MyButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
      //  let checkBox = MyButton()
        
        self.btnAddCourse.backgroundColor = UIColor.clearColor()
        self.btnButton2.backgroundColor = UIColor.clearColor()
        self.btnButton3.backgroundColor = UIColor.clearColor()
        self.btnButton4.backgroundColor = UIColor.clearColor()
        self.btnButton5.backgroundColor = UIColor.clearColor()

        self.btnAddCourse.setRadius(20,setTopRight: 20,setBottomLeft: 0,setBottomRight: 0)
        self.btnButton5.setRadius(0,setTopRight: 00,setBottomLeft: 20,setBottomRight: 20)

        
       /* self.btnAddCourse.setFillColor(UIColor(red: 0.165, green:0.427, blue:0.620, alpha:1.00))
        self.btnButton2.setFillColor(UIColor(red: 0.169, green:0.449, blue:0.656, alpha:1.00))
        self.btnButton3.setFillColor(UIColor(red: 0.182, green:0.484, blue:0.707, alpha:1.00))
        self.btnButton4.setFillColor(UIColor(red: 0.197, green:0.522, blue:0.764, alpha:1.00))
        self.btnButton5.setFillColor(UIColor(red: 0.208, green:0.554, blue:0.809, alpha:1.00)) */
        
        self.btnAddCourse.setFillColor(UIColor(red: 0.165, green:0.427, blue:0.620, alpha:1.00))
        self.btnButton2.setFillColor(UIColor(red: 0.169, green:0.449, blue:0.656, alpha:1.00))
        self.btnButton3.setFillColor(UIColor(red: 0.165, green:0.427, blue:0.620, alpha:1.00))
        self.btnButton4.setFillColor(UIColor(red: 0.169, green:0.449, blue:0.656, alpha:1.00))
        self.btnButton5.setFillColor(UIColor(red: 0.165, green:0.427, blue:0.620, alpha:1.00))
 

    }
 
 
 
 

 
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
