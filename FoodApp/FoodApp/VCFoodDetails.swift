//
//  VCFoodDetails.swift
//  FoodApp
//
//  Created by Laboratorio Mac on 4/2/19.
//  Copyright © 2019 Laboratorio Mac. All rights reserved.
//

import UIKit

class VCFoodDetails: UIViewController {

    @IBOutlet weak var iv_FoodName: UIImageView!
    @IBOutlet weak var laFoodName: UILabel!
    @IBOutlet weak var lafoodDes: UITextView!
    var food:Food?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        laFoodName.text = food?.name!
        lafoodDes.text = food?.des!
        iv_FoodName.image = UIImage(named: (food?.image!)!)
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func buBack(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
