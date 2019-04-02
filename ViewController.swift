//
//  ViewController.swift
//  Pokemon
//
//  Created by Nicthea Alvarez Platas on 3/6/19.
//  Copyright © 2019 Efrain Alvarez. All rights reserved.
//

import UIKit
import GoogleMaps
class ViewController: UIViewController,CLLocationManagerDelegate,GMSMapViewDelegate {
    var mapView:GMSMapView!
    let locationManager = CLLocationManager()
    var listPokemon = [pokemons]()
    override func viewDidLoad() {
        super.viewDidLoad()
        let camera = GMSCameraPosition.camera(withLatitude: 20.614572, longitude: -100.449003, zoom: 15)
        mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        self.view = mapView
        self.mapView.delegate = self
        ///get user location
        self.locationManager.requestAlwaysAuthorization()
        self.locationManager.requestWhenInUseAuthorization()
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            locationManager.startUpdatingLocation()
        }
    }
    
    func mapView(_ mapView: GMSMapView, didTapAt coordinate:CLLocationCoordinate2D) {
        print("Tap at ->latitude\(coordinate.latitude),longitude:\(coordinate.longitude)")
        
        var index = 0
        //show pokemons
        for pokemons in listPokemon{
            if pokemons.isCatch == false{
                let markerpokemons = GMSMarker()
                markerpokemons.position = CLLocationCoordinate2D(latitude: pokemons.latitude!, longitude: pokemons.longitude!)
                markerpokemons.title = pokemons.name!
                markerpokemons.snippet = "\(pokemons.des!), power \(pokemons.power!)"
                markerpokemons.icon = UIImage(named:pokemons.image!)
                markerpokemons.map = self.mapView
            }}
        
    }
    
    
        var oldLocation = CLLocationCoordinate2D(latitude: 0, longitude: 0)
        func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]){
            oldLocation = manager.location!.coordinate
            print("Location:\(oldLocation) ")
            self.mapView.clear()
            let markerMe = GMSMarker()
            markerMe.position = CLLocationCoordinate2D(latitude: oldLocation.latitude, longitude: oldLocation.longitude)
            markerMe.title = "Me"
            markerMe.snippet = " here is my location"
            markerMe.icon = UIImage(named: "peach")
            markerMe.map = self.mapView
            var index = 0
            //show pokemons
            for pokemons in listPokemon{
                if pokemons.isCatch == false{
                    let markerpokemons = GMSMarker()
                    markerpokemons.position = CLLocationCoordinate2D(latitude: pokemons.latitude!, longitude: pokemons.longitude!)
                    markerpokemons.title = pokemons.name!
                    markerpokemons.snippet = "\(pokemons.des!), power \(pokemons.power!)"
                    markerpokemons.icon = UIImage(named:pokemons.image!)
                    markerpokemons.map = self.mapView

                    if (Double(oldLocation.latitude).roundTo(places: 4) == Double(pokemons.latitude!).roundTo(places: 4)) && (Double(oldLocation.longitude).roundTo(places: 4) == Double(pokemons.longitude!).roundTo(places: 4)){
                        listPokemon[index].isCatch = true
                        AlertDialog(pokemonspower: pokemons.power!)
                    }
                }
                index = index + 1
            }
            
            let camera = GMSCameraPosition.camera(withLatitude: oldLocation.latitude, longitude: oldLocation.longitude, zoom: 15)
            self.mapView.camera = camera
        }
    
    var playerPower:Double = 0.0
    func LoadPokemons(){
        self.listPokemon.append(pokemons(latitude: 20.616520, longitude: -100.449047, image: "charmander", name: "charmander", des: "Charmander lives in Japan", power: 33))
        self.listPokemon.append(pokemons(latitude: 20.613608, longitude: -100.448596, image: "eevee", name: "eevee", des: "Eevee lives in México", power: 33))
        self.listPokemon.append(pokemons(latitude: 20.614673, longitude: -100.448866, image: "staryou", name: "staryou", des: "Staryou lives in Costa Rica", power: 33.5))
    }
    
    
    func AlertDialog(pokemonspower:Double){
        playerPower = playerPower + pokemonspower
        let alert = UIAlertController(title: "Catch new pokemon", message: "Your new power is", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "ok", style:UIAlertAction.Style.default, handler: {action in
            print("+ one")
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    
    }


extension Double{
    func roundTo(places:Int) -> Double{
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }


}

