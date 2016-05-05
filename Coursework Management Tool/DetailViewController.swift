//
//  DetailViewController.swift
//  Coursework Management Tool
//
//  Created by MACBOOKPRO on 20/03/2016.
//  Copyright © 2016 MACBOOKPRO. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource{
    
  
    
    var placeHolderData: String!
    var levels = ["Level 4", "Level 5", "Level 6", "Level 7"];
    
    
    @IBOutlet weak var btnAddCoursework: MyButton!
    @IBOutlet weak var btnSave: MyButton!
    @IBOutlet weak var txtModule: UITextField!
    @IBOutlet weak var txtCode: UITextField!
    @IBOutlet weak var levelPickerView: UIPickerView!
    
    
    var detailItem: Module? {
        didSet {
            // Update the view.
            self.configureView()
        }
    }
    
    func configureView() {
        // Update the user interface for the detail item.
        if let detail = self.detailItem {
            if let name = self.txtModule {
                name.text = detail.name
            }
            if let code = self.txtCode {
                code.text = detail.code
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.customTextFieldStyle(txtModule, text: "Module Name")
        self.customTextFieldStyle(txtCode, text: "Module Code")
        
        
        self.levelPickerView.backgroundColor = UIColor.clearColor()
        self.levelPickerView.delegate = self
        self.levelPickerView.dataSource = self
        
        self.btnSave.backgroundColor = UIColor.clearColor()
        self.btnSave.backgroundColor = UIColor.clearColor()
        self.btnSave.setFillColor(UIColor(red: 0.165, green:0.427, blue:0.620, alpha:1.00))
        self.btnSave.setRadius(15,setTopRight: 15,setBottomLeft: 15,setBottomRight: 15)
        
        
        self.btnAddCoursework.backgroundColor = UIColor.clearColor()
        self.btnAddCoursework.setFillColor(UIColor(red: 0.165, green:0.427, blue:0.620, alpha:1.00))
        self.btnAddCoursework.setRadius(15,setTopRight: 15,setBottomLeft: 15,setBottomRight: 15)
        
    
        
        
        self.configureView()
    }
    
    
    func customTextFieldStyle(textField: UITextField, text: String) {
        
        textField.backgroundColor = UIColor.clearColor()
        textField.attributedPlaceholder = NSAttributedString(string: text, attributes:[NSForegroundColorAttributeName: UIColor.grayColor()])
        textField.layer.cornerRadius = 8
        textField.layer.borderWidth = 2
        textField.layer.borderColor = UIColor(red: 0.165, green:0.427, blue:0.620, alpha:1.00).CGColor
        
        levelPickerView.layer.borderWidth = 2
        levelPickerView.layer.borderColor = UIColor(red: 0.165, green:0.427, blue:0.620, alpha:1.00).CGColor
        levelPickerView.layer.cornerRadius = 8
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return levels.count
    }
    
    func pickerView(pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        var attributedString: NSAttributedString!
        
        
        attributedString = NSAttributedString(string: levels[row], attributes: [NSForegroundColorAttributeName : UIColor(red: 0.165, green:0.427, blue:0.620, alpha:1.00)])
        
        return attributedString
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        print(levels[row])
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

