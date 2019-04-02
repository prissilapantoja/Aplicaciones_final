//
//  Food.swift
//  FoodApp
//
//  Created by Laboratorio Mac on 4/2/19.
//  Copyright © 2019 Laboratorio Mac. All rights reserved.
//

import UIKit

class Food: NSObject {
    var name:String?
    var des:String?
    var image:String?
    init(name:String,des:String,image:String) {
        self.name=name
        self.des=des
        self.image=image
    }
}
