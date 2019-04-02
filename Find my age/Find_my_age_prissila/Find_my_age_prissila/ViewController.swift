//
//  ViewController.swift
//  Find_my_age_prissila
//
//  Created by LABMAC08 on 22/02/19.
//  Copyright © 2019 utng. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet var laShowAge: UILabel!
    @IBOutlet var txtYearOfBirth: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        

    }

    @IBAction func BuFindAge(_ sender: Any) {
        GetAge()
    }
    
    func GetAge(){
        let yearOfBirth = Int(txtYearOfBirth.text!)
        //get current year
        let date = Date()
        let calendar = Calendar.current
        let year = calendar.component(.year, from: date)
        
        
        let personAge = year - yearOfBirth!
        laShowAge.text = "Your age is \(personAge)  "
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // fire some click of return keyboard
        GetAge()
        self.view.endEditing(true)
        return true
    }

}

