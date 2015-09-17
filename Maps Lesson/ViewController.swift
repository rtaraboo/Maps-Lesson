//
//  ViewController.swift
//  Maps Lesson
//
//  Created by Rosario Tarabocchia on 9/17/15.
//  Copyright © 2015 RLDT. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {

    @IBOutlet var map: MKMapView!
    
    var locationManager = CLLocationManager()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        
        

        var longitude:CLLocationDegrees = -74.052698
        
        var laditude:CLLocationDegrees = 40.837151
        
        var latDelta:CLLocationDegrees = 0.02
        
        var lonDelta:CLLocationDegrees = 0.02
        
        var span:MKCoordinateSpan = MKCoordinateSpanMake(latDelta, lonDelta)
        
        var location:CLLocationCoordinate2D = CLLocationCoordinate2DMake(laditude, longitude)
        
        var region:MKCoordinateRegion = MKCoordinateRegionMake(location, span)
        
        map.setRegion(region, animated: false)
        
        var annotation = MKPointAnnotation()
        
        annotation.coordinate = location
        
        annotation.title = "HOME"
        
        annotation.subtitle = "There's no place like it!"
        
        map.addAnnotation(annotation)
        
        var uilpgr = UILongPressGestureRecognizer(target: self, action: "action:")
        
        uilpgr.minimumPressDuration = 2
        
        map.addGestureRecognizer(uilpgr)
    
        
    }
    
    
    
    func action(gestureRecogizer:UIGestureRecognizer) {
        
        print("Gesture Recognized")
        
        var touchpoint = gestureRecogizer.locationInView(self.map)
        
        var newCordinate: CLLocationCoordinate2D = map.convertPoint(touchpoint, toCoordinateFromView: self.map)
        
        var annotation = MKPointAnnotation()
        
        annotation.coordinate = newCordinate
        
        annotation.title = "New Place"
        
        annotation.subtitle = "What's here?"
        
        map.addAnnotation(annotation)
        
        
    }
    
    
    
    
    
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        print(locations)
        
        var userLocation:CLLocation = locations[0] as! CLLocation
        
        var latitude = userLocation.coordinate.latitude
        
        var longitude = userLocation.coordinate.longitude
        
        var latDelta:CLLocationDegrees = 0.02
        
        var lonDelta:CLLocationDegrees = 0.02
        
        var span:MKCoordinateSpan = MKCoordinateSpanMake(latDelta, lonDelta)
        
        var location:CLLocationCoordinate2D = CLLocationCoordinate2DMake(latitude, longitude)
        
        var region:MKCoordinateRegion = MKCoordinateRegionMake(location, span)
        
        self.map.setRegion(region, animated: false)
        
    }
    
    
    
    
    
    
    
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

