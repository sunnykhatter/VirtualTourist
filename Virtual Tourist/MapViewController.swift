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
    
 

    
    var editTapped = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tapPinsToDeleteView.hidden = true
        mapView.delegate = self;

        
        
        var uilgr = UILongPressGestureRecognizer(target: self, action: "action:")
        uilgr.minimumPressDuration = 1.3
        
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
        if editTapped {
            UIView.animateWithDuration(0.15) {
                let firstView = self.stackView.arrangedSubviews[1]
                firstView.hidden = false
                self.editTapped = false
            }
            
        } else {
            UIView.animateWithDuration(0.15) {
                let firstView = self.stackView.arrangedSubviews[1]
                firstView.hidden = true
                self.editTapped = true
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
        var touchPoint = gestureRecognizer.locationInView(mapView)
        var newCoordinates = mapView.convertPoint(touchPoint, toCoordinateFromView: mapView)
        
        let annotation = MKPointAnnotation()
        annotation.coordinate = newCoordinates
        annotation.title = " " // So it is registered, with didSelectAnnotatioView
        mapView.addAnnotation(annotation)
    }
    
    func mapView(mapView: MKMapView!, didSelectAnnotationView view: MKAnnotationView!)
    {
        //Pin clicked, do your stuff here
        performSegueWithIdentifier("toPhotoAlbumView", sender: self)
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
