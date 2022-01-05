//
//  BusinessLocationViewController.swift
//  Event
//
//  Created by Vincent Cubit on 12/31/21.
//


import UIKit
import MapKit


class BusinessLocationViewController: UIViewController, UIPopoverPresentationControllerDelegate {

    
    private let whereIsBusinessAddressLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 17.0)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 4
        return label
    }()
    
    
    private let mapView: MKMapView = {
        let mapView = MKMapView()
        mapView.translatesAutoresizingMaskIntoConstraints = false
        mapView.layer.masksToBounds = true
        mapView.layer.cornerRadius = 13.0
        mapView.isZoomEnabled = false
        mapView.isScrollEnabled = false
        return mapView
    }()
    
    
    private let openMapButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitleColor(.systemBlue, for: .normal)
        button.setTitle("Open map", for: .normal)
        button.layer.masksToBounds = true
        button.layer.cornerRadius = 20.0
        button.layer.borderWidth = 2.0
        button.layer.borderColor = UIColor.systemBlue.cgColor
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    
    private let orLabel: UILabel = {
        let label = UILabel()
        label.text = "or"
        label.font = UIFont.boldSystemFont(ofSize: 14.0)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    
    private let useCurrentLocationButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitleColor(.white, for: .normal)
        button.setTitle("Use current location", for: .normal)
        button.layer.masksToBounds = true
        button.layer.cornerRadius = 20.0
        button.backgroundColor = .systemBlue
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemBackground
        self.view.addSubview(self.whereIsBusinessAddressLabel)
        self.view.addSubview(self.mapView)
        self.view.addSubview(self.openMapButton)
        self.view.addSubview(self.orLabel)
        self.view.addSubview(self.useCurrentLocationButton)
        
        
        self.openMapButton.addTarget(self, action: #selector(self.tappedMapView(_:)), for: .touchUpInside)
        
        
        let tappedMap = UITapGestureRecognizer()
        tappedMap.addTarget(self, action: #selector(self.tappedMapView(_:)))
        self.mapView.addGestureRecognizer(tappedMap)
        
        
        
        if let businessName = UserDefaults.standard.string(forKey: "businessName") {
            self.whereIsBusinessAddressLabel.text = "Where is \(businessName)?"
        }
        
        
        let constraints: [ NSLayoutConstraint ] = [
            self.whereIsBusinessAddressLabel.topAnchor.constraint(equalTo: self.view.layoutMarginsGuide.topAnchor, constant: 40.0),
            self.whereIsBusinessAddressLabel.leftAnchor.constraint(equalTo: self.view.layoutMarginsGuide.leftAnchor, constant: 25.0),
            self.whereIsBusinessAddressLabel.rightAnchor.constraint(equalTo: self.view.layoutMarginsGuide.rightAnchor, constant: -25.0),
            self.mapView.centerXAnchor.constraint(equalTo: self.view.layoutMarginsGuide.centerXAnchor),
            self.mapView.centerYAnchor.constraint(equalTo: self.view.layoutMarginsGuide.centerYAnchor, constant: -80.0),
            self.mapView.leftAnchor.constraint(equalTo: self.view.layoutMarginsGuide.leftAnchor, constant: 20.0),
            self.mapView.rightAnchor.constraint(equalTo: self.view.layoutMarginsGuide.rightAnchor, constant: -20.0),
            self.mapView.heightAnchor.constraint(equalToConstant: self.view.frame.size.height / 3.0),
            self.useCurrentLocationButton.leftAnchor.constraint(equalTo: self.view.layoutMarginsGuide.leftAnchor, constant: 40.0),
            self.useCurrentLocationButton.bottomAnchor.constraint(equalTo: self.view.layoutMarginsGuide.bottomAnchor, constant: -50.0),
            self.useCurrentLocationButton.rightAnchor.constraint(equalTo: self.view.layoutMarginsGuide.rightAnchor, constant: -40.0),
            self.useCurrentLocationButton.centerXAnchor.constraint(equalTo: self.view.layoutMarginsGuide.centerXAnchor),
            self.useCurrentLocationButton.heightAnchor.constraint(equalToConstant: 50.0),
            self.orLabel.centerXAnchor.constraint(equalTo: self.view.layoutMarginsGuide.centerXAnchor),
            self.orLabel.bottomAnchor.constraint(equalTo: self.useCurrentLocationButton.layoutMarginsGuide.topAnchor, constant: -30.0),
            self.openMapButton.bottomAnchor.constraint(equalTo: self.orLabel.layoutMarginsGuide.topAnchor, constant: -30.0),
            self.openMapButton.leftAnchor.constraint(equalTo: self.view.layoutMarginsGuide.leftAnchor, constant: 40.0),
            self.openMapButton.rightAnchor.constraint(equalTo: self.view.layoutMarginsGuide.rightAnchor, constant: -40.0),
            self.openMapButton.centerXAnchor.constraint(equalTo: self.view.layoutMarginsGuide.centerXAnchor),
            self.openMapButton.heightAnchor.constraint(equalToConstant: 50.0),

        ]
        
        NSLayoutConstraint.activate(constraints)
        
        
    }
    
    
    @objc func tappedMapView(_ sender: Any) {
        let vc = BusinessMapViewController()
        self.show(vc, sender: self)
    }
    


}

