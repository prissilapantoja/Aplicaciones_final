//
//  ViewController.swift
//  ZooApp
//
//  Created by Alumno on 4/2/19.
//  Copyright © 2019 UTNG. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    //var listOfAnimals = [Animal]()
    var listOfKillerAnimals = [Animal]()
    var listOfNotKillerAnimals = [Animal]()
    var AnimalType = ["Not killer", "killer"]
    @IBOutlet weak var tvListAnimals: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        listOfNotKillerAnimals.append(Animal(name: "Dog", des: "Lives in homes", image: "dog"))
        listOfKillerAnimals.append(Animal(name: "Leopardo", des: "Lives in the jungle", image: "leopardo"))
        listOfKillerAnimals.append(Animal(name: "Seal", des: "Lives in the coast", image: "seal"))
        listOfNotKillerAnimals.append(Animal(name: "Giraffe", des: "Lives in the savana", image: "giraffe"))
        listOfKillerAnimals.append(Animal(name: "Cat", des: "Lives in homes", image: "cat.png"))
        listOfNotKillerAnimals.append(Animal(name: "Dog 2", des: "Lives in homes", image: "dog2"))
        tvListAnimals.delegate = self
        tvListAnimals.dataSource = self
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return AnimalType[section]
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section:Int) -> Int {
        if section == 0 {
            return listOfNotKillerAnimals.count
        }else{
            return listOfKillerAnimals.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellAnimal:TVCAnimal = tableView.dequeueReusableCell(withIdentifier: "cellAnimal",for:indexPath) as! TVCAnimal
        if indexPath.section == 0 {
            cellAnimal.setAnimal(animal: listOfNotKillerAnimals[indexPath.row])
        }else{
            cellAnimal.setAnimal(animal: listOfKillerAnimals[indexPath.row])
        }
        
        return cellAnimal
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section==0 {
            print(listOfNotKillerAnimals[indexPath.row].image!)
            //listOfNotKillerAnimals.remove(at: indexPath.row)
            listOfNotKillerAnimals.append(listOfNotKillerAnimals[indexPath.row])
        }else{
            print(listOfKillerAnimals[indexPath.row].name!)
            //listOfKillerAnimals.remove(at: indexPath.row)
            listOfKillerAnimals.append(listOfKillerAnimals[indexPath.row])
        }
        
        tvListAnimals.reloadData()
    }
}

