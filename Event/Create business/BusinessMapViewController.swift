//
//  BusinessMapViewController.swift
//  Event
//
//  Created by Vincent Cubit on 1/4/22.
//


import UIKit
import MapKit


class BusinessMapViewController: UIViewController, UISearchBarDelegate, UISearchResultsUpdating {
    
    
    private let map: MKMapView = {
        let map = MKMapView()
        return map
    }()
    
    
    private let searchController: UISearchController = UISearchController(searchResultsController: SearchLocationsResultsViewController())
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemBackground
        self.navigationItem.searchController = self.searchController
        self.view.addSubview(self.map)
        self.searchController.searchBar.placeholder = "Search an address"
        self.searchController.searchResultsUpdater = self
        
    }
    
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.endEditing(true)
    }
    
    
    func searchBarShouldEndEditing(_ searchBar: UISearchBar) -> Bool {
        return true
    }
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.map.frame = CGRect(x: self.view.safeAreaInsets.left
                                , y: self.view.safeAreaInsets.top, width: self.view.frame.size.width, height: self.view.frame.size.height)
    }
    
    
    func updateSearchResults(for searchController: UISearchController) {
        print()
    }
    
    


}

