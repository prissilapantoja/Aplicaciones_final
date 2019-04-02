//
//  pokemon.swift
//  Pokemon
//
//  Created by Nicthea Alvarez Platas on 3/6/19.
//  Copyright © 2019 Efrain Alvarez. All rights reserved.
//

import UIKit

class pokemons{
    var latitude:Double?
    var longitude:Double?
    var image:String?
    var name:String?
    var des:String?
    var power:Double?
    var isCatch:Bool?
    init(latitude:Double,longitude:Double,image:String,name:String,des:String,power:Double){
        self.latitude=latitude
        self.longitude=longitude
        self.image=image
        self.name=name
        self.des=des
        self.power=power
        self.isCatch=false
    }
}
