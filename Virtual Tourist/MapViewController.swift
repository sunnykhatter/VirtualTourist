//
//  MapViewController.swift
//  Virtual Tourist
//
//  Created by Lakshay Khatter on 10/12/16.
//  Copyright © 2016 Lakshay Khatter. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController, MKMapViewDelegate  {
    
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var tapPinsToDeleteView: UIView!
    @IBOutlet weak var topRightButton: UIBarButtonItem!
    
    var location = MKPointAnnotation()
 

    
    var editTapped = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tapPinsToDeleteView.hidden = true
        mapView.delegate = self;

        
        
        var uilgr = UILongPressGestureRecognizer(target: self, action: "action:")
        uilgr.minimumPressDuration = 2.0
        
        mapView.addGestureRecognizer(uilgr)

    }
    
    override func viewDidAppear(animated: Bool) {
        self.mapView.delegate = self;

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func edit(sender: AnyObject) {
        if editTapped == false {
            UIView.animateWithDuration(0.15) {
                let firstView = self.stackView.arrangedSubviews[1]
                firstView.hidden = false
                self.editTapped = true
            }
            
        } else {
            UIView.animateWithDuration(0.15) {
                let firstView = self.stackView.arrangedSubviews[1]
                firstView.hidden = true
                self.editTapped = false
            }
            
        }
    }
    
    func mapView(mapView: MKMapView, viewForAnnotation annotation: MKAnnotation) -> MKAnnotationView? {
        let reuseId = "locations"
        let buttonType = UIButtonType.InfoDark
        let pinView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: reuseId)
        
        
        pinView.canShowCallout = false
        pinView.rightCalloutAccessoryView = UIButton(type: buttonType)
        
        return pinView
    }
    
    func action(gestureRecognizer:UIGestureRecognizer){
        
        
        if (gestureRecognizer.state == UIGestureRecognizerState.Began) {
            //Do Whatever You want on End of Gesture
            let touchPoint = gestureRecognizer.locationInView(mapView)
            let newCoordinates = mapView.convertPoint(touchPoint, toCoordinateFromView: mapView)
            
            let annotation = MKPointAnnotation()
            annotation.coordinate = newCoordinates
            annotation.title = " " // So it is registered, with didSelectAnnotationView
            
            location.coordinate = newCoordinates
            location.title = " "
            
            mapView.addAnnotation(annotation)
            mapView.deselectAnnotation(annotation, animated: false)

            performSegueWithIdentifier("toPhotoAlbumView", sender: self)
            
        }
        
        
    }
    
    func mapView(mapView: MKMapView, didSelectAnnotationView view: MKAnnotationView){
        //Pin clicked, do your stuff here
        
        if editTapped == true {
            self.mapView.removeAnnotation(view.annotation!)
        } else {
            performSegueWithIdentifier("toPhotoAlbumView", sender: self)
        }
        
        
        
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let identifier = segue.identifier
        if identifier == "toPhotoAlbumView" {
            let viewController:PhotoAlbumViewController = segue.destinationViewController as! PhotoAlbumViewController
            viewController.annotation = self.location
        }
        
    }
    

}
