//
//  PhotoAlbumViewController.swift
//  Virtual Tourist
//
//  Created by Lakshay Khatter on 10/12/16.
//  Copyright © 2016 Lakshay Khatter. All rights reserved.
//

import UIKit
import MapKit


class PhotoAlbumViewController: UIViewController, MKMapViewDelegate, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var collectionView: UICollectionView!
    
    var annotation = MKPointAnnotation()
    
    
        
    override func viewDidLoad() {
        super.viewDidLoad()
        mapView.delegate = self
        setUpMapView()
        self.automaticallyAdjustsScrollViewInsets = false

        // Do any additional setup after loading the view.
    }


    func mapView(mapView: MKMapView, viewForAnnotation annotation: MKAnnotation) -> MKAnnotationView? {
        let reuseId = "locations"
        let buttonType = UIButtonType.InfoDark
        let pinView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: reuseId)
        mapView.addAnnotation(self.annotation)
        
        pinView.canShowCallout = false
        
        pinView.rightCalloutAccessoryView = UIButton(type: buttonType)
        return pinView
    }
    
    func setUpMapView() {
        
        var region = MKCoordinateRegion()
        var span = MKCoordinateSpan()
        span.latitudeDelta = 0.1
        span.longitudeDelta = 0.1
        region.span = span;
        
        var track = CLLocationCoordinate2D()
        track.latitude = annotation.coordinate.latitude
        track.longitude = annotation.coordinate.longitude
        region.center = track
        
        self.mapView.addAnnotation(self.annotation)
        self.mapView.setRegion(region, animated: true)
        self.mapView.regionThatFits(region)
        
        
        self.mapView.zoomEnabled = false;
        self.mapView.scrollEnabled = false;
        self.mapView.userInteractionEnabled = false;
        self.mapView.reloadInputViews()
    }
    

    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 21
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell{
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("Cell", forIndexPath: indexPath)
        return cell
    }

    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        let leftAndRightPaddings: CGFloat = 10.0
        let numberOfItemsPerRow: CGFloat = 3.0
        let bounds = collectionView.bounds
        let width = (bounds.size.width - leftAndRightPaddings*(numberOfItemsPerRow+1)) / numberOfItemsPerRow
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.itemSize = CGSizeMake(width, width)
        return layout.itemSize
        
    }


}
